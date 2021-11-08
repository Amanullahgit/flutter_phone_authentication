import 'dart:async';
import 'package:flutter/material.dart';
import 'package:supabase/supabase.dart';

class SupabaseService {
  SupabaseService() {
    final String supabaseUrl = "";
    final String supabaseKey = "";

    final client = SupabaseClient('https://nquwrxpqaiohypvambqs.supabase.co',
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoiYW5vbiIsImlhdCI6MTYzNDI5NDc0OSwiZXhwIjoxOTQ5ODcwNzQ5fQ.78qQYcAGImoc5oAxZC9WMs5DGDYMVjsCWb8qYMhNFUA');

    this.client = client;
  }

  dynamic client;

  dynamic response(supaResponse) {
    if (supaResponse.error == null) {
      print('>>>>>>>>>>>>response.data: ${supaResponse.data}');
      return supaResponse.data;
    } else {
      print('>>>>>>>>>>>>>>>>>>>selectResponse.error: ${supaResponse.error}');
      return supaResponse.error;
    }
  }

  Future<PostgrestResponse> query(String table, String select) async {
    // query data
    final selectResponse =
        await client.from('jobs').select('*').execute(count: CountOption.exact);
    // print("select Response $selectResponse");

    return selectResponse;
  }
}
