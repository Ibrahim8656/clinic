import 'package:clinic/core/widgets/custom_text_fild.dart';
import 'package:clinic/core/widgets/show_snack_bar.dart';
import 'package:clinic/features/auth/data/repository/repository.dart';
import 'package:clinic/features/auth/domain/usecases/login_usecase.dart';
import 'package:clinic/features/auth/domain/usecases/register_usecase.dart';
import 'package:clinic/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:clinic/features/auth/presentation/screens/loginscreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterPage extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create:
            (context) => AuthCubit(
              RegisterUserUseCase(AuthRepositoryImpl()),
              LoginUsecase(AuthRepositoryImpl()),
            ),
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.blue.shade300, Colors.blue.shade800],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 100, horizontal: 120),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16.0),
                  color: Colors.white,
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 100),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        radius: 40,
                        backgroundColor: Colors.blue.shade500,
                        child: Icon(
                          Icons.person,
                          size: 50,
                          color: Colors.white,
                        ),
                      ),
                       Text(
                              'Sign Up',
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: Colors.blue.shade700,
                              ),
                            ),
                            SizedBox(height: 30),
                      SizedBox(height: 20),
                      custom_text_fild(
                        Controller: _emailController,
                        labelText: 'email',
                        prefixIcon: Icons.email,
                        validatemessage: 'Plase enter email',
                      ),
                      SizedBox(height: 20),
                      custom_text_fild(
                        Controller: _passwordController,
                        labelText: 'passowrd',
                        prefixIcon: Icons.lock,
                        validatemessage: 'Plase enter Passowrd',
                      ),
                      SizedBox(height: 20),
                      BlocConsumer<AuthCubit, AuthState>(
                        listener: (context, state) {
                          if (state is AuthSuccess) {
                            showSnackBar(
                              context,
                              'Registration Successful',
                              Colors.green,
                            );
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Loginscreen(),
                              ),
                            );
                          } else if (state is AuthFailure) {
                            // Show error message
                            showSnackBar(context, state.message, Colors.red);
                          }
                        },
                        builder: (context, state) {
                          if (state is AuthLoading) {
                            return CircularProgressIndicator();
                          }
                          return ElevatedButton(
                            onPressed: () {
                              final email = _emailController.text;
                              final password = _passwordController.text;
                              AuthCubit.get(context).Register(email, password);
                            },
                            child: Text('Register'),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
