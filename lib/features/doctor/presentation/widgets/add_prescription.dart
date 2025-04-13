import 'package:clinic/core/widgets/custom_bottom.dart';
import 'package:clinic/core/widgets/show_snack_bar.dart';
import 'package:clinic/features/doctor/presentation/cubit/doctor_cubit.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';


String? treatment;

String? dosage;

Row add_prescription({
  required BuildContext context,
  required List<String> medicines,
  required int patinet_id,
}) {
  return Row(
    children: [
      SizedBox(
        width: MediaQuery.sizeOf(context).width * .2,
        child: DropdownSearch<String>(
          items: medicines, // قائمة الأدوية
          popupProps: PopupProps.dialog(
            showSearchBox: true, // تفعيل البحث داخل القائمة
            searchFieldProps: TextFieldProps(
              padding: EdgeInsets.only(left: 15, right: 15, top: 30),
              decoration: InputDecoration(
                labelText: "Search Medicine",
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ),
          dropdownDecoratorProps: DropDownDecoratorProps(
            dropdownSearchDecoration: InputDecoration(
              labelText: "Treatment",
              border: OutlineInputBorder(),
            ),
          ),
          onChanged: (value) {
            treatment = value;
           
          },
          selectedItem: null,
        ),
      ),
      SizedBox(width: 20),
      SizedBox(
        width: MediaQuery.sizeOf(context).width * .2,
        child: DropdownSearch<String>(
          items: medicines, // قائمة الأدوية
          popupProps: PopupProps.dialog(
            showSearchBox: true, // تفعيل البحث داخل القائمة
            searchFieldProps: TextFieldProps(
              padding: EdgeInsets.only(left: 15, right: 15, top: 30),
              decoration: InputDecoration(
                labelText: "Search doasage",
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ),
          dropdownDecoratorProps: DropDownDecoratorProps(
            dropdownSearchDecoration: InputDecoration(
              labelText: "doasage",
              border: OutlineInputBorder(),
            ),
          ),
          onChanged: (value) {
            dosage = value;
            print(
              "Selectedggggggggggggggg: $patinet_id",
            ); //this will be in the table of prescription
          },
        ),
      ),
      SizedBox(width: 20),
      SizedBox(
        width: MediaQuery.sizeOf(context).width * .2,
        child: TextField(
          maxLines: 1,
          controller:DoctorCubit.get(context).Notecontroller,
          decoration: InputDecoration(
            label: Text("Note"),
            border: OutlineInputBorder(),
          ),
        ),
      ),
      SizedBox(width: 50),
      custom_botton(
        text: " Add to prescription ",
        onTap: () {
       print(DoctorCubit.get(context).treatmenttosave);
          DoctorCubit.get(context).addRow(
            treatment: treatment!,
            dosage: dosage!,
            note: DoctorCubit.get(context).Notecontroller.text,
          );
          DoctorCubit.get(context). Notecontroller.clear();
        },
      ),
      SizedBox(width: 20),
      custom_botton(
        text: " save ",
        onTap: () {
          DoctorCubit.get(context).add_prescriptiontodatabase(
            patinet_id: patinet_id,
            treatmenttosave: DoctorCubit.get(context).treatmenttosave,
            doasage:DoctorCubit.get(context). dosagetosave,
            note: DoctorCubit.get(context).Notecontroller.text,
          );
           DoctorCubit.get(context).DeletePrescriptiondatat();
           showSnackBar(context, "Added successfully", Colors.green);
        },
      ),
    ],
  );
}
