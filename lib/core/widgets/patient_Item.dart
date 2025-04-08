import 'package:clinic/features/reception/domain/entity/entity.dart';
import 'package:clinic/features/reception/presentation/cubit/reception_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class patient_Item extends StatelessWidget {
  const patient_Item({
    super.key, required this.patients, required this.isdoctor,
  });
  final bool isdoctor;
  final List<Patientres> patients;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 236, 236, 236),
        borderRadius: BorderRadius.circular(10)
      ),
      child: ListView.separated(
        itemCount: patients.length,
        separatorBuilder: (context, index) => Divider(),
        itemBuilder: (context, index) {
          return ListTile(
            leading: CircleAvatar(
              backgroundImage: AssetImage(
                "assets/images/person.jpg",
              ),
            ),
            title: Text(
              patients[index].name,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Text(patients[index].phone),
            trailing:isdoctor?  PopupMenuButton<String>(
              onSelected: (String value) {
                // Handle the selected option
                if (value == 'make appointment') {
                ReceptionCubit.get(context).makeAppointment(veisit_type: 'follow_up', gender:patients[index].gender, age: patients[index].age, address: patients[index].address, phone:patients[index].phone, job: patients[index].job, name: patients[index].name, id: patients[index].id);
                
                } else if (value == 'remove') {
                  ReceptionCubit.get(context).deleteClint(id: patients[index].id);
                }
              },
              itemBuilder:
                  (BuildContext context) => [
                    PopupMenuItem<String>(
                      value: 'make appointment',
                      child: Text('make appointment'),
                    ),
                    PopupMenuItem<String>(
                      value: 'remove',
                      child: Text('remove'),
                    ),
                    
                    PopupMenuItem<String>(
                      value: 'Medical history',
                      child: Text('Medical history'),
                    ),
                    
                  ],
            ): PopupMenuButton<String>(
              onSelected: (String value) {
                // Handle the selected option
                if (value == 'حجزكشف') {
                ReceptionCubit.get(context).makeAppointment(veisit_type: 'كشف', gender:patients[index].gender, age: patients[index].age, address: patients[index].address, phone:patients[index].phone, job: patients[index].job, name: patients[index].name, id: patients[index].id);
                
                } else if (value == 'ازاله') {
                  ReceptionCubit.get(context).deleteClint(id: patients[index].id);
                }
              },
              itemBuilder:
                  (BuildContext context) => [
                    PopupMenuItem<String>(
                      value: 'حجزكشف',
                      child: Text('حجز كشف'),
                    ),
                    PopupMenuItem<String>(
                      value: 'ازاله',
                      child: Text('ازاله'),
                    ),
                    
                  ],
            ),
          );
        },
      ),
    );
  }
}
