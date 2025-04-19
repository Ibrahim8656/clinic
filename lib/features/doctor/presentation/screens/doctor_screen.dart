import 'package:clinic/core/colos/colors.dart';
import 'package:clinic/core/widgets/box_.dart';
import 'package:clinic/features/doctor/presentation/cubit/doctor_cubit.dart';
import 'package:clinic/features/doctor/presentation/screens/patient_info.dart';
import 'package:clinic/features/doctor/presentation/screens/visit_info.dart';
import 'package:clinic/features/doctor/presentation/widgets/add_prepered_prescrioption.dart';
import 'package:clinic/features/doctor/presentation/widgets/patientinfo_more.dart';
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
      },
      builder: (context, state) {
        return Scaffold(
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.all(
                  MediaQuery.sizeOf(context).width * 0.02,
                ),
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
                          SizedBox(
                            width: MediaQuery.sizeOf(context).width * .05,
                          ),

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
                          SizedBox(
                            width: MediaQuery.sizeOf(context).width * .05,
                          ),
                          InkWell(
                            onTap: () {
                              DoctorCubit.get(
                                context,
                              ).changing_info(ispatientinfoo: true);
                              DoctorCubit.get(
                                context,
                              ).GetPatientprescripton(patinet_id: patient.id);

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
                  ? patient_info(patient: patient)
                  : visit_info(medicines: medicines, patient: patient),
            ],
          ),
        );
      },
    );
  }
}