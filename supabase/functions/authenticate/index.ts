// Follow this setup guide to integrate the Deno language server with your editor:
// https://deno.land/manual/getting_started/setup_your_environment
// This enables autocomplete, go to definition, etc.

import { serve } from "https://deno.land/std@0.168.0/http/server.ts";
import { createClient } from 'https://esm.sh/@supabase/supabase-js@2';

console.log("U16 authenticate function")

serve(async (req: Request) => {

  try {
    // create a Supabase client with a context of the authenticated user
    const supabaseClient = createClient(
      Deno.env.get('SUPABASE_URL') ?? '',
      Deno.env.get('SUPABASE_ANON_KEY') ?? '',
      { global: { headers: { Authorization: req.headers.get('Authorization')! } } },
    );

    const {
      data: { user }
    } = await supabaseClient.auth.getUser();

    // ageCheckRequired => user profile == null && consent request == null
    // waitingForConsent => user profile == null && consent request is not verified
    // userProfileRequired => user profile == null && consent request is verified
    // authenticated  => user profile != null
    // unauthenticated => unauthenticated

    // check user profile
    const { data, error } = await supabaseClient.from('app_users').select('*').eq('id', user.id).maybeSingle();
    if (error) throw error;

    let result = {
      auth_state: 'unauthenticated'
    };

    if (data) {
      // authenticated
      result = {
        auth_state: 'authenticated',
        profile_type: data.profile_type
      };
    } else {
      // check consent request
      const { data, error } = await supabaseClient.from('consent_requests').select('*').eq('id', user.id).maybeSingle();
      if (error) throw error;

      if (data) {
        // check verified_date
        if (data.verified_date != null) {
          // user profile required
          result = {
            auth_state: 'userProfileRequired',
          };
        } else {
          // waiting for consent
          result = {
            auth_state: 'waitingForConsent'
          }
        }
      } else {
        // age check required
        result = {
          auth_state: 'ageCheckRequired'
        };
      }
    }

    return new Response(JSON.stringify({ ...result }), {
      headers: { 'Content-Type': 'application/json' },
      status: 200,
    });

  } catch (error) {
    return new Response(JSON.stringify({ error: error.message }), {
      headers: { 'Content-Type': 'application/json' },
      status: 400,
    });
  }
})

// To invoke:
// curl -i --location --request POST 'http://localhost:54321/functions/v1/' \
//   --header 'Authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZS1kZW1vIiwicm9sZSI6ImFub24iLCJleHAiOjE5ODM4MTI5OTZ9.CRXP1A7WOeoJeXxjNni43kdQwgnWNReilDMblYTn_I0' \
//   --header 'Content-Type: application/json' \
//   --data '{"name":"Functions"}'
