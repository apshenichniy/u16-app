// Follow this setup guide to integrate the Deno language server with your editor:
// https://deno.land/manual/getting_started/setup_your_environment
// This enables autocomplete, go to definition, etc.

import { serve } from "https://deno.land/std@0.168.0/http/server.ts";
import { createClient } from 'https://esm.sh/@supabase/supabase-js@2';

serve(async (req) => {
  const { code } = await req.json()

  // create a Supabase client with a context of the authenticated user
  const supabaseClient = createClient(
    Deno.env.get('SUPABASE_URL') ?? '',
    Deno.env.get('SUPABASE_ANON_KEY') ?? '',
    { global: { headers: { Authorization: req.headers.get('Authorization')! } } },
  );

  const {
    data: { user }
  } = await supabaseClient.auth.getUser();

  let result = false;

  // fetch consent request
  const { data, error } = await supabaseClient.from('consent_requests').select('*').eq('id', user.id).maybeSingle();
  if (error) throw error;

  if (data) {
    if (data.code == code) {
      result = true;
      await supabaseClient.from('consent_requests').update({ 'verified_at': new Date().toISOString() }).eq('id', user.id);
    }
  }

  return new Response(
    JSON.stringify(result),
    { headers: { "Content-Type": "application/json" } },
  )
})

// To invoke:
// curl -i --location --request POST 'http://localhost:54321/functions/v1/' \
//   --header 'Authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZS1kZW1vIiwicm9sZSI6ImFub24iLCJleHAiOjE5ODM4MTI5OTZ9.CRXP1A7WOeoJeXxjNni43kdQwgnWNReilDMblYTn_I0' \
//   --header 'Content-Type: application/json' \
//   --data '{"name":"Functions"}'
