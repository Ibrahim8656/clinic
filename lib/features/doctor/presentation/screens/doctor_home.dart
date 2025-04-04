import 'package:clinic/core/colos/colors.dart';
import 'package:clinic/core/widgets/appointment_itme.dart';
import 'package:clinic/core/widgets/patient_Item.dart';
import 'package:clinic/features/doctor/presentation/cubit/doctor_cubit.dart';
import 'package:clinic/features/reception/domain/entity/appointment.dart';
import 'package:clinic/features/reception/presentation/cubit/reception_cubit.dart';
import 'package:clinic/features/reception/presentation/cubit/reception_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DoctorHome extends StatelessWidget {
  const DoctorHome({super.key});

  @override
  Widget build(BuildContext context) {
    final _Searchcontroller = TextEditingController();
    return BlocConsumer<DoctorCubit, DoctorState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        List<Appointment> patients = [];
        return Scaffold(
          body: Row(
            children: [
              Expanded(
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
                            print(DoctorCubit.get(context).isappointment);
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
              ),
              Expanded(
                flex: 3,
                child: Container(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 40,
                          vertical: 20,
                        ),
                        child: Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Welcome,',
                                  style: TextStyle(
                                    fontSize: 50,
                                    fontWeight: FontWeight.bold,
                                    color: primarycolor,
                                  ),
                                ),
                                Text(
                                  'Dr/ mohamed',
                                  style: TextStyle(
                                    fontSize: 50,
                                    fontWeight: FontWeight.bold,
                                    color: primarycolor,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 40.0),
                        child: Container(
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 236, 236, 236),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Text(
                                  DoctorCubit.get(context).isappointment
                                      ? "All Appointments"
                                      : "All Patients",
                                  style: TextStyle(
                                    color: primarycolor,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 25,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      DoctorCubit.get(context).isappointment
                          ? Expanded(
                            child: BlocBuilder<ReceptionCubit, ReceptionState>(
                              builder: (context, state) {
                                if (state is AppointmetsLoaded) {
                                  patients = state.patients;
                                  return Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 40.0,
                                    ),
                                    child: Appointment_Itme(patients: patients, isdoctor: true,),
                                  );
                                } else if (patients.isNotEmpty) {
                                  return Appointment_Itme(patients: patients, isdoctor: true,);
                                }
                                return Padding(
                                  padding: const EdgeInsets.only(top: 100.0),
                                  child: Text(
                                    "Loading...",
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                );
                              },
                            ),
                          )
                          : Expanded(
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                    top: 10,
                                    bottom: 10,
                                    right: 50,
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 40.0 ),
                                    child: TextField(
                                      controller: _Searchcontroller,
                                      onChanged: (searchCharcter) {
                                        ReceptionCubit.get(
                                          context,
                                        ).AddSearchedCharcterTolist(
                                          searchCharcter,
                                        );
                                      },
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(10),
                                        ),
                                        hintText: 'search',
                                        prefixIcon: Icon(Icons.search),
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: BlocBuilder<
                                    ReceptionCubit,
                                    ReceptionState
                                  >(
                                    builder: (context, state) {
                                      if (state is searchsuccess) {
                                        return Padding(
                                          padding: const EdgeInsets.symmetric( horizontal: 40.0,),
                                          child: patient_Item(
                                            patients: state.searchedpatients,
                                          ),
                                        );
                                      } else if (ReceptionCubit.get(
                                        context,
                                      ).AllPatients.isNotEmpty) {
                                        return Padding(
                                          padding: const EdgeInsets.symmetric( horizontal: 40.0,),
                                          child: patient_Item(
                                            patients:
                                                ReceptionCubit.get(
                                                  context,
                                                ).AllPatients,
                                          ),
                                        );
                                      } else
                                        return Padding(
                                          padding: const EdgeInsets.only(
                                            top: 100.0,
                                          ),
                                          child: Text(
                                            "Loading...",
                                            style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        );
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
