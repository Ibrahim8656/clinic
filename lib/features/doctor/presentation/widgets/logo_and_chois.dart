import 'package:clinic/core/colos/colors.dart';
import 'package:clinic/features/doctor/presentation/cubit/doctor_cubit.dart';
import 'package:flutter/material.dart';

class logo_chois extends StatelessWidget {
  const logo_chois({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Container(
        decoration: BoxDecoration(color: primarycolor),
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                ),
                clipBehavior: Clip.antiAliasWithSaveLayer,
                child: Image.asset('assets/images/clinic_logo.png'),
              ),
              Spacer(),
              InkWell(
                onTap: () {
                  DoctorCubit.get(
                    context,
                  ).selectappointmentsorpateints(boo: true);
                },
                child: Container(
                  height: 55,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color:
                        DoctorCubit.get(context).isappointment
                            ? secondrycolor
                            : null,
                  ),
                  child: Center(
                    child: Text(
                      "Appointments",
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              InkWell(
                onTap: () {
                  DoctorCubit.get(
                    context,
                  ).selectappointmentsorpateints(boo: false);
                },
                child: Container(
                  height: 55,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color:
                        DoctorCubit.get(context).isappointment
                            ? null
                            : secondrycolor,
                  ),
                  child: Center(
                    child: Text(
                      "All Patients",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

