import 'package:clinic/core/colos/colors.dart';
import 'package:clinic/features/doctor/presentation/screens/doctor_screen.dart';
import 'package:clinic/features/reception/domain/entity/appointment.dart';
import 'package:clinic/features/reception/presentation/cubit/reception_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Appointment_Itme extends StatelessWidget {
  const Appointment_Itme({super.key, required this.patients, required this.isdoctor});
  final List<Appointment> patients;
  final bool isdoctor;
  @override
  Widget build(BuildContext context) {
    return Container(

      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: const Color.fromARGB(255, 236, 236, 236),
      ),
      child: ListView.separated(
        itemCount: patients.length,
        separatorBuilder: (context, index) => Divider(),
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(left: 10.0,right: 50,top: 15,bottom: 15),
            child: Row(
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage("assets/images/person.jpg"),
                ),
                SizedBox(width: 10,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      patients[index].name,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(patients[index].phone),
                  ],
                ),
                Spacer(),isdoctor? InkWell(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>DoctorScreen(patient: patients[index],)));
                  },
                  child: Container(decoration: BoxDecoration(
                    color: primarycolor,
                    borderRadius: BorderRadius.circular(10)
                  ),
                  child: Center(child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("examine",style: TextStyle(color: Colors.white),),
                  )),
                  )):
                Row(children: [
                  cancel_bottom(patients: patients, color: Color.fromARGB(255, 252, 77, 65), text: 'الغاء', index: index,),
                SizedBox(width: 20,),
                cancel_bottom(patients: patients, color:Colors.green, text: 'تم', index: index,),
                ],)
                  
              ],
            )
          );
        },
      ),
    );
  }
}

class cancel_bottom extends StatelessWidget {
  const cancel_bottom({
    super.key,
    required this.patients, required this.text, required this.color, required this.index,
  });
  final String text;
  final int index;
  final Color color;
  final List<Appointment> patients;

  @override
  Widget build(BuildContext context) {
    return InkWell(onTap: (){
          ReceptionCubit.get(context).cancelAppointment(id:patients[index].id );
        },
          child: Container(
            height: 30,
            width: 50,
            decoration: BoxDecoration(
              borderRadius:  BorderRadius.circular(10),
              color: color
            ),
            child: Center(child: Text(text,style:TextStyle(color:Colors.white,fontWeight: FontWeight.bold,fontSize: 13),)),
          ),
        );
  }
}
