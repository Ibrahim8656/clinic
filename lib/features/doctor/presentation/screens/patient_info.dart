import 'package:clinic/features/doctor/presentation/cubit/doctor_cubit.dart';
import 'package:clinic/features/doctor/presentation/widgets/divider.dart';
import 'package:clinic/features/doctor/presentation/widgets/patient_info_item.dart';
import 'package:clinic/features/reception/domain/entity/appointment.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class patient_info extends StatelessWidget {
  const patient_info({
    super.key,
    required this.patient,
  });

  final Appointment patient;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25.0, top: 25),
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
          SizedBox(width: MediaQuery.sizeOf(context).width * .05),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              patient_info_item(
                title: 'Name',
                data: patient.name,
              ),
              divider(),
              patient_info_item(
                title: 'Age',
                data: patient.age.toString(),
              ),
              divider(),
              patient_info_item(title: 'Job', data: patient.job),
              divider(),
              patient_info_item(
                title: 'Gender',
                data: patient.gender,
              ),
              divider(),
              patient_info_item(
                title: 'Phone',
                data: patient.phone,
              ),
              divider(),
              patient_info_item(
                title: 'Address',
                data: patient.address,
              ),
            ],
          ),
          SizedBox(width: MediaQuery.sizeOf(context).width * .02),
          BlocBuilder<DoctorCubit, DoctorState>(
            builder: (context, state) {
              return state is GetprescriptionSuccessState&&state.treatments.isNotEmpty
                  ? Expanded(
                    child: SizedBox(
                      height:
                          MediaQuery.sizeOf(context).height * .7,
                      width:
                          MediaQuery.sizeOf(context).width * .30,
                      child: ListView.builder(
                        itemBuilder: (context, index) {
                          return Stack(
                            alignment: Alignment.center,
                            children: [
                              Image(
                                image: AssetImage(
                                  "assets/images/prescription.jpg",
                                ),
                                fit: BoxFit.fill,
                                height:
                                    MediaQuery.sizeOf(
                                      context,
                                    ).height *
                                    .7,
                                width:
                                    MediaQuery.sizeOf(
                                      context,
                                    ).width *
                                    .28,
                              ),
                              Column(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(
                                      left:
                                          MediaQuery.sizeOf(
                                            context,
                                          ).width *
                                          .05,
                                    ),
                                    child: Row(
                                      children: [
                                        SizedBox(
                                          width: MediaQuery.sizeOf(context).width*.12,
                                          child: Text(
                                            state
                                                .treatments[index],
                                                
                                            style: TextStyle(
                                              fontFamily: "Satisfy",
                                              fontWeight:
                                                  FontWeight.bold,
                                              fontSize: 18,
                                            ),
                                          ),
                                        ),
                                        SizedBox(width: 20),
                                        SizedBox(
                                           width: MediaQuery.sizeOf(context).width*.12,
                                          child: Text(
                                            state
                                                .dosages[index]
                                                ,
                                            style: TextStyle(
                                              fontFamily: "Satisfy",
                                              fontWeight:
                                                  FontWeight.bold,
                                              fontSize: 18,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Text(
                                    state
                                        .notes[index],
                                        
                                    style: TextStyle(
                                      fontFamily: "Satisfy",
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          );
                        },
                        itemCount: state.treatments.length,
                      ),
                    ),
                  )
                  : SizedBox(width: 10);
            },
          ),
        ],
      ),
    );
  }
}
