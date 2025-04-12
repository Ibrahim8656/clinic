import 'package:clinic/core/colos/colors.dart';
import 'package:clinic/core/widgets/box_.dart';
import 'package:clinic/features/doctor/presentation/cubit/doctor_cubit.dart';
import 'package:clinic/features/doctor/presentation/widgets/add_prepered_prescrioption.dart';
import 'package:clinic/features/doctor/presentation/widgets/add_prescription.dart';
import 'package:clinic/features/doctor/presentation/widgets/patientinfo_more.dart';
import 'package:clinic/features/doctor/presentation/widgets/prepeard_prescriptions.dart';
import 'package:clinic/features/doctor/presentation/widgets/table.dart';
import 'package:clinic/features/reception/domain/entity/appointment.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class DoctorScreen extends StatelessWidget {
  const DoctorScreen({super.key, required this.patient});
  final Appointment patient;
  @override
  Widget build(BuildContext context) {
    DateTime today = DateTime.now();

    final List<String> medicines = [
      "Augmentin 312 mg suspension",
      "Augmentin 457 mg suspension",
      "Augmentin 1 gm tab",
      "Augmentin 625 mg tab",
      "Augmentin 375 mg tab",
      "Augmentin ES - 600 susp",
      "Augmentin 156 mg suspension",
      "Augmentin Drops",
      "AUGMENTIN 156 MG / 5 ML SUSP 80 ML",
      "AUGMENTIN 156 MG / 5 ML SUSP 80 ML",
      "AUGMENTIN 156 MG / 5 ML SUSP 80 ML",
      "AUGMENTIN 156 MG / 5 ML SUSP 80 ML",
      "AUGMENTIN 156 MG / 5 ML SUSP 80 ML",
      "AUGMENTIN 156 MG / 5 ML SUSP 80 ML",
      "AUGMENTIN 156 MG / 5 ML SUSP 80 ML",
      "AUGMENTIN 156 MG / 5 ML SUSP 80 ML",
      "AUGMENTIN 156 MG / 5 ML SUSP 80 ML",
      "AUGMENTIN 156 MG / 5 ML SUSP 80 ML",
      "AUGMENTIN 156 MG / 5 ML SUSP 80 ML",
      "AUGMENTIN 156 MG / 5 ML SUSP 80 ML",
      "AUGMENTIN 156 MG / 5 ML SUSP 80 ML",
      "AUGMENTIN 156 MG / 5 ML SUSP 80 ML",
      "AUGMENTIN 156 MG / 5 ML SUSP 80 ML",
    ];

    String formattedDate = DateFormat('dd-MM-yyyy').format(today);

    return BlocConsumer<DoctorCubit, DoctorState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Scaffold(
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(25.0),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: patientinfoandmore(
                    patient: patient,
                    formattedDate: formattedDate,
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  border: Border.all(color: Color.fromARGB(255, 143, 143, 143)),
                ),
                child: BlocBuilder<DoctorCubit, DoctorState>(
                  builder: (context, state) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          SizedBox(width: 15),

                          InkWell(
                            onTap: () {
                              DoctorCubit.get(
                                context,
                              ).changing_info(ispatientinfoo: false);
                              print(DoctorCubit.get(context).ispatientinfo);
                            },
                            child: box(
                              first_text: "Visit info ",
                              color:
                                  DoctorCubit.get(context).ispatientinfo
                                      ? Colors.grey
                                      : primarycolor,
                            ),
                          ),
                          SizedBox(width: 50),
                          InkWell(
                            onTap: () {
                              DoctorCubit.get(
                                context,
                              ).changing_info(ispatientinfoo: true);
                              print(DoctorCubit.get(context).ispatientinfo);
                            },
                            child: box(
                              first_text: "patient info ",
                              color:
                                  DoctorCubit.get(context).ispatientinfo
                                      ? primarycolor
                                      : Colors.grey,
                            ),
                          ),

                          Spacer(),
                          DoctorCubit.get(context).ispatientinfo
                              ? SizedBox(width: 70)
                              : addpreparedprescripton(),
                          SizedBox(width: 70),
                        ],
                      ),
                    );
                  },
                ),
              ),
              DoctorCubit.get(context).ispatientinfo
                  ? Padding(
                    padding: const EdgeInsets.all(25.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Image(
                              image: AssetImage("assets/images/person.jpg"),
                              width: MediaQuery.sizeOf(context).width * .1,
                            ),
                          ],
                        ),
                        SizedBox(width: 30),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            pationt_info_item(
                              title: 'Name',
                              data: patient.name,
                            ),
                            divider(),
                            pationt_info_item(
                              title: 'Age',
                              data: patient.age.toString(),
                            ),
                            divider(),
                            pationt_info_item(title: 'Job', data: patient.job),
                            divider(),
                            pationt_info_item(
                              title: 'Gender',
                              data: patient.gender,
                            ),
                            divider(),
                            pationt_info_item(
                              title: 'Phone',
                              data: patient.phone,
                            ),
                            divider(),
                            pationt_info_item(
                              title: 'Address',
                              data: patient.address,
                            ),
                          ],
                        ),
                      ],
                    ),
                  )
                  : Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        prepeared_prescriptons(),
                        Padding(
                          padding: const EdgeInsets.only(left: 20.0),
                          child: add_prescription(
                            context: context,
                            medicines: medicines,
                            patinet_id: patient.id,
                          ),
                        ),
                        SizedBox(height: 20),
                        prescription_table(),
                      ],
                    ),
                  ),
            ],
          ),
        );
      },
    );
  }
}

class divider extends StatelessWidget {
  const divider({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Container(
        width: MediaQuery.sizeOf(context).width * .5,
        color: Colors.grey,
        child: SizedBox(height: 1),
      ),
    );
  }
}

class pationt_info_item extends StatelessWidget {
  const pationt_info_item({super.key, required this.title, required this.data});
  final String title;
  final String data;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          SizedBox(
            width: 100,
            child: Text(
              title,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: const Color.fromARGB(255, 131, 131, 131),
              ),
            ),
          ),
          SizedBox(width: 15),
          Text(
            data,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: const Color.fromARGB(255, 44, 44, 44),
            ),
          ),
        ],
      ),
    );
  }
}
