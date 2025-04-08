import 'package:clinic/core/widgets/custom_bottom.dart';
import 'package:clinic/core/widgets/custom_text_fild.dart';
import 'package:clinic/features/doctor/presentation/cubit/doctor_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class addpreparedprescripton extends StatelessWidget {
  const addpreparedprescripton({super.key});

  @override
  Widget build(BuildContext context) {
    final TitleController = TextEditingController();
    final treatmentController = TextEditingController();
    final dosageController = TextEditingController();
    final noteController = TextEditingController();
    return custom_botton(
      text: 'Add a prepared recipe ',
      onTap: () {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text("Add Prepared Prescription      "),
              content: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextField(
                      controller: TitleController,
                      decoration: InputDecoration(labelText: "Title"),
                    ),
                    SizedBox(height: 10),
                    TextField(
                      controller: treatmentController,
                      decoration: InputDecoration(labelText: "Treatment"),
                    ),
                    SizedBox(height: 10),
                    TextField(
                      controller: dosageController,
                      decoration: InputDecoration(labelText: "Dosage"),
                    ),
                    SizedBox(height: 10),
                    TextField(
                      controller: noteController,
                      decoration: InputDecoration(labelText: "Note"),
                    ),
                  ],
                ),
              ),
              actions: [
                TextButton(
                  onPressed: () {
                   DoctorCubit.get(context).collect_preparedprescription(title: TitleController.text, treatment: treatmentController.text, dosage: dosageController.text, note: noteController.text);
               
                  treatmentController.clear();
                  dosageController.clear();
                  noteController.clear();
                  },
                  child: Text("Add"),
                ),
                TextButton(
                  onPressed: () {
                    DoctorCubit.get(context).add_preparedprescription();
                    DoctorCubit.get(context).Fetch_preparedPrescruotions();();
                   
                    Navigator.of(context).pop();
                  },
                  child: Text("Done"),
                ),
                TextButton(
                  onPressed: () {
                    // Close the dialog without adding
                    Navigator.of(context).pop();
                  },
                  child: Text("Cancel"),
                ),
              ],
            );
          },
        );
      },
    );
  }
}
