import 'package:supabase_flutter/supabase_flutter.dart';

class ApiConnect {
  static String url = '';
  static String anonKey = '';

  init() async {
    await Supabase.initialize(
      url: url,
      anonKey: anonKey,
      authCallbackUrlHostname: '',
    );
  }
}
