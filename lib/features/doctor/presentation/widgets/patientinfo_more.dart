import 'package:clinic/core/colos/colors.dart';
import 'package:clinic/core/widgets/custom_bottom.dart';
import 'package:clinic/core/widgets/row_box.dart';
import 'package:clinic/features/doctor/presentation/cubit/doctor_cubit.dart';
import 'package:clinic/features/reception/domain/entity/appointment.dart';
import 'package:flutter/material.dart';

class patientinfoandmore extends StatelessWidget {
  const patientinfoandmore({
    super.key,
    required this.patient,
    required this.formattedDate,
  });

  final Appointment patient;
  final String formattedDate;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
         IconButton(onPressed: (){
             DoctorCubit.get(context).DeletePrescriptiondatat();
                Navigator.pop(context);
               }, icon:  Icon(Icons.arrow_back,color: primarycolor,),),
               SizedBox(width: 15,),
        Container(
          decoration: BoxDecoration(
            border: Border.all(width: .7, color: Colors.grey),
            borderRadius: BorderRadius.circular(5),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Patient Name",
                  style: TextStyle(
                    color: Color.fromARGB(255, 143, 143, 143),
                  ),
                ),
                Text(
                  patient.name,
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ),
        SizedBox(width: 20),
        row_box(first_text: 'Visit number', second_text: '2'),
        SizedBox(width: 20),
        row_box(
          first_text: 'Visit type',
          second_text: patient.veisit_type,
        ),
        SizedBox(width: 20),
        row_box(
          first_text: 'Age',
          second_text: patient.age.toString(),
        ),
        SizedBox(width: 200),
        row_box(first_text: 'Date', second_text: formattedDate),
    
        SizedBox(width: MediaQuery.sizeOf(context).width * .298),
        custom_botton(text: 'More info', onTap: () {}),
      ],
    );
  }
}

