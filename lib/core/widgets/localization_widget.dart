import 'package:clinic/features/auth/presentation/screens/welcome_screen.dart';
import 'package:clinic/features/localization/cubit/local_cubit.dart';
import 'package:flutter/material.dart';

class localizatonWidget extends StatelessWidget {
  const localizatonWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: MediaQuery.sizeOf(context).width * 0.02,
      ),
      child: Row(
        children: [
          PopupMenuButton<String>(
            icon: Icon(Icons.language, color: Colors.white),
            onSelected: (String value) {
              // Handle the selected option
              if (value == 'ar') {
                LocaleCubit.get(context)
                    .changeLanguage('ar');
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => WelcomeScreen(),
                  ),
                );
              } else if (value == 'en') {
              LocaleCubit.get(context)
                    .changeLanguage('en');
              }
            },
            itemBuilder:
                (BuildContext context) => [
                  PopupMenuItem<String>(
                    value: 'ar',
                    child: Text('arabic'),
                  ),
                  PopupMenuItem<String>(
                    value: 'en',
                    child: Text('english'),
                  ),
                ],
          ),
        ],
      ),
    );
  }
}
