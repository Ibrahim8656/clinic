import 'package:clinic/features/reception/domain/entity/appointment.dart';
import 'package:clinic/features/reception/presentation/cubit/reception_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Appointment_Itme extends StatelessWidget {
  const Appointment_Itme({super.key, required this.patients});
  final List<Appointment> patients;
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
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
              Spacer(),
              cancel_bottom(patients: patients, color: Color.fromARGB(255, 252, 77, 65), text: 'الغاء', index: index,),
              SizedBox(width: 20,),
              cancel_bottom(patients: patients, color:Colors.green, text: 'تم', index: index,),
                  
            ],
          ),
        );
      },
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
  // return ListTile(
  //         leading: 
  //         title: Text(
  //           patients[index].name,
  //           style: TextStyle(fontWeight: FontWeight.bold),
  //         ),
  //         subtitle:
  //         trailing: Container(
  //           child: Row(
  //             children: [
                
            
  //           InkWell(onTap: (){
  //           ReceptionCubit.get(context).cancelAppointment(id:patients[index].id );
  //         },
  //           child: Container(
  //             height: 30,
  //             width: 50,
  //             decoration: BoxDecoration(
  //               borderRadius:  BorderRadius.circular(10),
  //               color:Colors.green
  //             ),
  //             child: Center(child: Text("تم",style:TextStyle(color:Colors.white,fontWeight: FontWeight.bold,fontSize: 13),)),
  //           ),
  //         )
  //        ],
  //           ),
  //         )
  //       );
      