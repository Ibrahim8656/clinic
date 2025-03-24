import 'package:clinic/features/auth/domain/repository/repository.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthRepositoryImpl implements AuthRepository {
  @override
  Future<void> registerWithEmailAndPassword(
    String email,
    String password,
  ) async {
    try {
      final AuthResponse res = await Supabase.instance.client.auth.signUp(
        email: email,
        password: password,
      );
      print("registered");
      print(res.user!.email);
    } catch (e) {
      print("error");
      rethrow;
    }
  }

  @override
  Future<void> LoginWithEmailAndPassword(String email, String password) async {
    try {
      final AuthResponse res = await Supabase.instance.client.auth.signInWithPassword(
        email: email,
        password: password,
      );
      print("Logedin");
      print(res.user!.email);
    } catch (e) {
        print(e.toString());
      rethrow;
    }
  }
}
