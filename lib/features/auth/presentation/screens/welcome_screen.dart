import 'package:clinic/core/colos/colors.dart';
import 'package:clinic/core/widgets/custom_bottom.dart';
import 'package:clinic/features/auth/presentation/screens/loginscreen.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    bool isadoctor;
    return Scaffold(
      backgroundColor: primarycolor,
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  Column(
                    children: [
                      Container(
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        height: MediaQuery.sizeOf(context).height * 0.45,
                        width: MediaQuery.sizeOf(context).width * 0.3,
                        child: Image.asset(
                          "assets/images/logo.jpg",
                          fit: BoxFit.cover,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(100),
                            topRight: Radius.circular(100),
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
                          vertical: MediaQuery.sizeOf(context).height * 0.2,
                        ),
                        child: Row(
                          children: [
                            Text(
                              "Welcome to Clinic assistant",
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
                      Row(
                        children: [
                          custom_botton(
                            text: "Login as a doctor",
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

                          SizedBox(height: 20),
                          custom_botton(
                            text: "Login as a Reception",
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
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
