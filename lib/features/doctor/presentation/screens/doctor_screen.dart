import 'package:clinic/core/colos/colors.dart';
import 'package:clinic/core/widgets/box_.dart';
import 'package:clinic/core/widgets/custom_bottom.dart';
import 'package:clinic/core/widgets/row_box.dart';
import 'package:clinic/features/doctor/presentation/cubit/doctor_cubit.dart';
import 'package:clinic/features/doctor/presentation/widgets/prepeard_prescriptions.dart';
import 'package:clinic/features/doctor/presentation/widgets/table.dart';
import 'package:clinic/features/reception/domain/entity/appointment.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class DoctorScreen extends StatelessWidget {
  const DoctorScreen({super.key, required this.patient});
  final Appointment patient;
  @override
  Widget build(BuildContext context) {
    DateTime today = DateTime.now();

    String? treatment;
    String? dosage;
    TextEditingController Notecontroller = TextEditingController();
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
                  child: Row(
                    children: [
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

                      SizedBox(width: MediaQuery.sizeOf(context).width * .35),
                      custom_botton(text: 'More info', onTap: () {}),
                    ],
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
                              ).changing_info(info: 'patient');
                            },
                            child: box(
                              first_text: "patient info ",
                              color:
                                  DoctorCubit.get(context).cuttrnt_choiss == 1
                                      ? Colors.grey
                                      : primarycolor,
                            ),
                          ),
                          SizedBox(width: 50),
                          InkWell(
                            onTap: () {
                              DoctorCubit.get(
                                context,
                              ).changing_info(info: "visit");
                            },
                            child: box(
                              first_text: "Visit info ",
                              color:
                                  DoctorCubit.get(context).cuttrnt_choiss == 0
                                      ? Colors.grey
                                      : primarycolor,
                            ),
                          ),
                          Spacer(),
                          custom_botton(
                            text: 'Add a prepared recipe ',
                            onTap: () {},
                          ),
                          SizedBox(width: 70),
                        ],
                      ),
                    );
                  },
                ),
              ),
              prepeared_prescriptons(),
              Row(
                children: [
                  SizedBox(
                    width: MediaQuery.sizeOf(context).width * .2,
                    child: DropdownSearch<String>(
                      items: medicines, // قائمة الأدوية
                      popupProps: PopupProps.dialog(
                        showSearchBox: true, // تفعيل البحث داخل القائمة
                        searchFieldProps: TextFieldProps(
                          padding: EdgeInsets.only(
                            left: 15,
                            right: 15,
                            top: 30,
                          ),
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
                        print(
                          "Selected: $value",
                        ); //this will be in the table of prescription
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
                          padding: EdgeInsets.only(
                            left: 15,
                            right: 15,
                            top: 30,
                          ),
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
                          "Selected: $value",
                        ); //this will be in the table of prescription
                      },
                    ),
                  ),
                  SizedBox(width: 20),
                  SizedBox(
                    width: MediaQuery.sizeOf(context).width * .2,
                    child: TextField(
                      maxLines: 1,
                      controller: Notecontroller,

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
                      DoctorCubit.get(context).addRow(
                        dosageController: treatment!,
                        treatmentController: dosage!,
                        note: Notecontroller.text,
                      );
                    },
                  ),
                ],
              ),
              SizedBox(height: 20),
              prescription_table(),
            ],
          ),
        );
      },
    );
  }
}

