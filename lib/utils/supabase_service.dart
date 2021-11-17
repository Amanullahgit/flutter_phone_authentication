import 'dart:async';
import 'package:flutter/material.dart';
import 'package:supabase/supabase.dart';
import './../common/constants.dart';

class SupabaseService {
  SupabaseService() {
    final client =
        SupabaseClient(SupaConstants.supabaseUrl, SupaConstants.supabaseKey);

    this.client = client;
  }

  dynamic client;

  get mySupabaseClient => client;

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
    final selectResponse = await client
        .from(table)
        .select(select)
        .execute(count: CountOption.exact);
    // print("select Response $selectResponse");

    return selectResponse;
  }

  Future<PostgrestResponse> filter(
      String table, String eqColumnName, dynamic value) async {
    // query data
    final selectResponse = await client
        .from(table)
        .select('*')
        .eq(eqColumnName, value)
        .execute(count: CountOption.exact);

    // print("select Response ${selectResponse.data?.length}");

    return selectResponse;
  }

  Future<PostgrestResponse> insert(String table, List<Map> data) async {
    // query data
    final selectResponse =
        await client.from(table).insert(data).execute(count: CountOption.exact);

    print("select Response ${selectResponse.data}");

    return selectResponse;
  }
}
