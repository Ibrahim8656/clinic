import 'package:clinic/core/widgets/custom_bottom.dart';
import 'package:clinic/core/widgets/localization_widget.dart';
import 'package:clinic/core/widgets/show_snack_bar.dart';
import 'package:clinic/features/auth/presentation/screens/loginscreen.dart';
import 'package:clinic/features/doctor/presentation/cubit/doctor_cubit.dart';
import 'package:clinic/features/localization/cubit/local_cubit.dart';
import 'package:clinic/features/localization/cubit/local_state.dart';
import 'package:clinic/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    bool isadoctor;
    return BlocConsumer<LocaleCubit,ChangeLocaleState >(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Scaffold(
          body: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.blue.shade300,
                  const Color.fromARGB(255, 3, 58, 121),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Directionality(
                textDirection: TextDirection.ltr,
                child: Row(
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        localizatonWidget(),
                        SizedBox(
                          height: MediaQuery.sizeOf(context).height * 0.1,
                        ),
                        Container(
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          height: MediaQuery.sizeOf(context).height * 0.6,
                          width: MediaQuery.sizeOf(context).width * 0.4,
                          child: Image.asset(
                            "assets/images/logo.jpg",
                            fit: BoxFit.cover,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(150),
                              topRight: Radius.circular(150),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(width: MediaQuery.sizeOf(context).width * 0.1),
                    Column(
                    
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(
                            vertical: MediaQuery.sizeOf(context).height * 0.25,
                          ),

                          child: Row(
                            children: [
                              Text(
                                S.of(context).welcomeMessage,
                                style: TextStyle(
                                  fontSize:
                                      MediaQuery.sizeOf(context).width * 0.035,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: MediaQuery.sizeOf(context).width * 0.5,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              custom_botton(
                                color: Colors.white,
                                text: S.of(context).loginasdoctor,
                                onTap: () {
                                  isadoctor = true;
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                      builder:
                                          (context) =>
                                              Loginscreen(isadoctor: isadoctor),
                                    ),
                                  );
                                },
                              ),
                          
                              SizedBox(
                                width: MediaQuery.sizeOf(context).width * .08,
                              ),
                              custom_botton(
                                color: Colors.white,
                                text: S.of(context).loginasreceptionist,
                                onTap: () {
                                  isadoctor = false;
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                      builder:
                                          (context) =>
                                              Loginscreen(isadoctor: isadoctor),
                                    ),
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),

                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

