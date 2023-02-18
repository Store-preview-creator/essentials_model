import 'package:essentials_model/essentials_model.dart';
import 'package:essentials_model/src/services/api_status.dart';
import 'package:essentials_model/src/services/implements/i_api.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class Api implements IApi {
  SupabaseClient dataBase = Supabase.instance.client;

  @override
  get({required String endpoint}) async {
    try {
      PostgrestResponse<dynamic> response = await dataBase.from(endpoint).execute();
      return response.data;
    } catch (e) {
      Log.error(e);
      return ApiStatus.messageErro;
    }
  }

  @override
  getFilter({required String endpoint, required Map<String, dynamic> data}) async {
    try {
      PostgrestResponse<dynamic> response = await dataBase.from(endpoint).select().match(data).execute();
      return response.data;
    } catch (e) {
      Log.error(e);
      return ApiStatus.messageErro;
    }
  }

  @override
  post({required String endpoint, required Map<String, dynamic> data}) async {
    try {
      PostgrestResponse<dynamic> response = await dataBase.from(endpoint).insert(data).execute();
      return response.data;
    } catch (e) {
      Log.error(e);
      return ApiStatus.messageErro;
    }
  }

  @override
  put({required String endpoint, required Map<String, dynamic> data}) async {
    try {
      PostgrestResponse<dynamic> response = await dataBase.from(endpoint).update(data).execute();
      return response.data;
    } catch (e) {
      Log.error(e);
      return ApiStatus.messageErro;
    }
  }

  @override
  delete({required String endpoint, required Map<String, dynamic> data}) async {
    try {
      PostgrestResponse<dynamic> response = await dataBase.from(endpoint).delete().match(data).execute();
      return response.data;
    } catch (e) {
      Log.error(e);
      return ApiStatus.messageErro;
    }
  }

  @override
  patch({required String endpoint, required Map<String, dynamic> data}) async {
    try {
      PostgrestResponse<dynamic> response = await dataBase.from(endpoint).update(data).execute();
      return response.data;
    } catch (e) {
      Log.error(e);
      return ApiStatus.messageErro;
    }
  }
}
