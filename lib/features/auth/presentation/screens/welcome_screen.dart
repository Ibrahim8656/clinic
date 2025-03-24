
import 'package:clinic/features/auth/presentation/screens/loginscreen.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});
  
  @override
  Widget build(BuildContext context) {
    bool isadoctor;
    return Scaffold(
      body: Column(
        children: [
          TextButton(onPressed: (){
            isadoctor=true;
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Loginscreen()));
          }, child: Text("Login as a doctor")),
          SizedBox(height: 20,),
          TextButton(onPressed: (){
            isadoctor =false;
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Loginscreen()));
          }, child: Text("Login as a Reception")),
        ],
      ),
    );
  }
}