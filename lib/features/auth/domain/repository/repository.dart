abstract class AuthRepository {
  Future<void> registerWithEmailAndPassword(String email, String password);
  Future<void> LoginWithEmailAndPassword(String email, String password);
}

