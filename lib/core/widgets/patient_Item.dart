import 'package:clinic/features/reception/domain/entity/entity.dart';
import 'package:clinic/features/reception/presentation/cubit/reception_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class patient_Item extends StatelessWidget {
  const patient_Item({
    super.key, required this.patients,
  });
  final List<Patientres> patients;
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
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
          trailing: PopupMenuButton<String>(
            onSelected: (String value) {
              // Handle the selected option
              if (value == 'حجزكشف') {
              ReceptionCubit.get(context).makeAppointment(veisit_type: 'كشف', gender:patients[index].gender, age: patients[index].age, address: patients[index].address, phone:patients[index].phone, job: patients[index].job, name: patients[index].name);
              
              } else if (value == 'option2') {
                // Do something for option 2
                print('Option 2 selected');
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
    );
  }
}
