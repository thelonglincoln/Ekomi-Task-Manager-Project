import 'package:supabase_flutter/supabase_flutter.dart' hide Provider;

export 'database/database.dart';

const _kSupabaseUrl = 'https://ciruoxmmfbyazdrdgxnu.supabase.co';
const _kSupabaseAnonKey =
    'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImNpcnVveG1tZmJ5YXpkcmRneG51Iiwicm9sZSI6ImFub24iLCJpYXQiOjE2OTEwMTUxMjMsImV4cCI6MjAwNjU5MTEyM30.Cq9RWE8VBU3DUxffyhTXXIMvpJydrQCdVqm8DfroGQI';

class SupaFlow {
  SupaFlow._();

  static SupaFlow? _instance;
  static SupaFlow get instance => _instance ??= SupaFlow._();

  final _supabase = Supabase.instance.client;
  static SupabaseClient get client => instance._supabase;

  static Future initialize() => Supabase.initialize(
        url: _kSupabaseUrl,
        anonKey: _kSupabaseAnonKey,
        debug: false,
      );
}
