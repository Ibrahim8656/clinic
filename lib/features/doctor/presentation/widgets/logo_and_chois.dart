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
          padding:  EdgeInsets.all(MediaQuery.sizeOf(context).width * 0.015,),
          child: Column(
            children: [
              Container(
                height: MediaQuery.sizeOf(context).height * 0.4,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                ),
                clipBehavior: Clip.antiAliasWithSaveLayer,
                child: Image.asset('assets/images/clinic_logo.png',height:  MediaQuery.sizeOf(context).height * 0.4,),
              ),
              Spacer(),
              InkWell(
                onTap: () {
                  DoctorCubit.get(
                    context,
                  ).selectappointmentsorpateints(boo: true);
                },
                child: Container(
                  height: MediaQuery.sizeOf(context).height * 0.08,
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
                        fontSize: MediaQuery.sizeOf(context).height * 0.026,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: MediaQuery.sizeOf(context).height * 0.02),
              InkWell(
                onTap: () {
                  DoctorCubit.get(
                    context,
                  ).selectappointmentsorpateints(boo: false);
                },
                child: Container(
                  height: MediaQuery.sizeOf(context).height * 0.08,
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
                        fontSize: MediaQuery.sizeOf(context).height * 0.026,
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

