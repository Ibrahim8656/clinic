
import 'package:clinic/features/auth/domain/repository/repository.dart';

class LoginUsecase {
  final AuthRepository authRepository;

  LoginUsecase(this.authRepository);
Future<void>call(email,password){
  return authRepository.LoginWithEmailAndPassword(email, password);
}
}