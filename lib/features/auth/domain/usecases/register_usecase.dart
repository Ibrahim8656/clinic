

import 'package:clinic/features/auth/domain/repository/repository.dart';

class RegisterUserUseCase {
  final AuthRepository repository;

  RegisterUserUseCase(this.repository);

  Future<void> call(String email, String password) {
    return repository.registerWithEmailAndPassword(email, password);
  }
  
  
}
