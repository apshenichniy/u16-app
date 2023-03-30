// Follow this setup guide to integrate the Deno language server with your editor:
// https://deno.land/manual/getting_started/setup_your_environment
// This enables autocomplete, go to definition, etc.

import { serve } from "https://deno.land/std@0.168.0/http/server.ts";
import * as OTPAuth from "https://deno.land/x/otpauth@v9.1.1/dist/otpauth.esm.js";
import { IRequestBody, sendMail } from "https://deno.land/x/sendgrid/mod.ts";
import { createClient } from 'https://esm.sh/@supabase/supabase-js@2';

serve(async (req) => {
  let { email, dateOfBirth } = await req.json();

  // create a Supabase client with a context of the authenticated user
  const supabaseClient = createClient(
    Deno.env.get('SUPABASE_URL') ?? '',
    Deno.env.get('SUPABASE_ANON_KEY') ?? '',
    { global: { headers: { Authorization: req.headers.get('Authorization')! } } },
  );

  const {
    data: { user }
  } = await supabaseClient.auth.getUser();

  // Create a new TOTP object.
  let totp = new OTPAuth.TOTP({
    issuer: "U16",
    label: "ConsentCode",
    algorithm: "SHA1",
    digits: 4,
    period: 30,
    secret: "NB2W45DFOIZA", // or 'OTPAuth.Secret.fromBase32("NB2W45DFOIZA")'
  });

  // Generate a token (returns the current token as a string).
  let code = totp.generate();

  await supabaseClient.from('consent_requests').insert({
    id: user.id,
    parent_email: email,
    code: code,
    date_of_birth: dateOfBirth
  });

  // send email with code
  const fromEmail = "alexander.pshenichniy@gmail.com";

  let mail: IRequestBody = {
    personalizations: [
      {
        subject: "Action required: enter confirmation code to give parential consent",
        to: [{ email: email }],
      },
    ],
    from: { email: fromEmail },
    content: [
      { type: "text/plain", value: `Confirmation code: ${code}\n\nU16 Team` },
      { type: "text/html", value: `<h1>Confirmation code: ${code}</h1><p/><h1>U16 Team</h1>` },
    ],
  };

  let response = await sendMail(mail, { apiKey: Deno.env.get("API_KEY") });

  return new Response(
    JSON.stringify(response),
    { headers: { "Content-Type": "application/json" } },
  )
})

// To invoke:
// curl -i --location --request POST 'http://localhost:54321/functions/v1/' \
//   --header 'Authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZS1kZW1vIiwicm9sZSI6ImFub24iLCJleHAiOjE5ODM4MTI5OTZ9.CRXP1A7WOeoJeXxjNni43kdQwgnWNReilDMblYTn_I0' \
//   --header 'Content-Type: application/json' \
//   --data '{"name":"Functions"}'
