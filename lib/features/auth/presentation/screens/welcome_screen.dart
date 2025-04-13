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
      
      body: Container(
        width: double.infinity,
          decoration: BoxDecoration(
            
                gradient: LinearGradient(
                  colors: [Colors.blue.shade300, const Color.fromARGB(255, 3, 58, 121)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    height: MediaQuery.sizeOf(context).height * 0.7,
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
                        color: Colors.white,
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
              
                      SizedBox(width: MediaQuery.sizeOf(context).width*.08),
                      custom_botton(
                        color: Colors.white,
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
    );
  }
}
