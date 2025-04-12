

import 'package:clinic/core/helpers/Cash_helper/shearedpref.dart';
import 'package:clinic/features/auth/domain/usecases/login_usecase.dart';
import 'package:clinic/features/auth/domain/usecases/register_usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
 final RegisterUserUseCase registerUserUseCase;
 final LoginUsecase loginUsecase;
  AuthCubit(this.registerUserUseCase, this.loginUsecase) : super(AuthInitial());
    static AuthCubit get(context) => BlocProvider.of(context);
  Future<void> Register(String email, String password)async{
    emit(AuthLoading());
   try{
     await registerUserUseCase(email,password);
       emit(AuthSuccess());
   }catch(error){
    emit(AuthFailure(error.toString()));
   }
  }
  Future<void>Login({required email,required passowrd})async{
   emit(LoginLoading());
   try{
    await loginUsecase(email,passowrd);
    CashHelper.SaveData("is_logedin", true);
    emit(LoginSuccess());
   }catch(e){
    emit(LoginFailure(e.toString()));
   }
  }
  
}
