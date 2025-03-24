import 'package:clinic/core/colos/colors.dart';
import 'package:clinic/core/widgets/custom_text_fild.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:clinic/features/reception/presentation/cubit/reception_cubit.dart';
import 'package:clinic/features/reception/presentation/cubit/reception_state.dart';

class ReceptionScreen extends StatefulWidget {
  @override
  _ReceptionScreenState createState() => _ReceptionScreenState();
}

class _ReceptionScreenState extends State<ReceptionScreen> {
  final _nameController = TextEditingController();
  final _ageController = TextEditingController();
  final _genderController = TextEditingController();
  final _addressController = TextEditingController();
  final _PhoneController = TextEditingController();
  final _jobController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    double pading = MediaQuery.sizeOf(context).width * .05;
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            "Reception",
            style: TextStyle(
              color: Colors.white,
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        backgroundColor: primarycolor,
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(left: pading, bottom: 25, top: 25),
                child: Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Container(
                        child: Form(
                          key: _formKey,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "ْاضافه عميل",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 20),
                              custom_text_fild(
                                Controller: _nameController,
                                labelText: "الاسم",
                                prefixIcon: Icons.person,
                                validatemessage: 'برجاء ادخال الاسم ',
                              ),
                              SizedBox(height: 20),
                              custom_text_fild(
                                Controller: _PhoneController,
                                labelText: "رقم الهاتف",
                                prefixIcon: Icons.phone,
                                validatemessage: 'برجاءادخال رقم الهاتف',
                              ),
                              SizedBox(height: 20),
                              custom_text_fild(
                                Controller: _ageController,
                                labelText: "العمر",
                                prefixIcon: Icons.numbers_rounded,
                                validatemessage: 'برجاء اخال العمر',
                              ),
                              SizedBox(height: 20),
                              custom_text_fild(
                                Controller: _genderController,
                                labelText: "النوع",
                                prefixIcon: Icons.person,
                                validatemessage: 'برجاء ادخال النوع ',
                              ),
                              SizedBox(height: 20),
                              custom_text_fild(
                                Controller: _jobController,
                                labelText: "الوظيفه",
                                prefixIcon: Icons.work,
                                validatemessage: 'برجاء ادخال الوظيفه',
                              ),
                              SizedBox(height: 20),
                              custom_text_fild(
                                Controller: _addressController,
                                labelText: "العنوان",
                                prefixIcon: Icons.location_city,
                                validatemessage: 'برجاء ادخال العنوان',
                              ),

                              SizedBox(height: 30),
                              BlocConsumer<ReceptionCubit, ReceptionState>(
                                listener: (context, state) {
                                  if (state is AddPatientSuccess) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text('تمت الاضافه بنجاح'),
                                        backgroundColor: Colors.green,
                                      ),
                                    );
                                  } else if (state is AddPatientFailure) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(state.message),
                                        backgroundColor: Colors.red,
                                      ),
                                    );
                                  }
                                },
                                builder: (context, state) {
                                  if (state is AddPatientLoading) {
                                    return CircularProgressIndicator();
                                  }
                                  return InkWell(
                                    onTap: () {
                                      if (_formKey.currentState!.validate()) {
                                        final name = _nameController.text;
                                        final age = int.parse(
                                          _ageController.text,
                                        );
                                        final gender = _genderController.text;
                                        final phone = _PhoneController.text;
                                        final job = _jobController.text;
                                        final address = _addressController.text;

                                        context
                                            .read<ReceptionCubit>()
                                            .addPatient(
                                              name,
                                              age,
                                              gender,
                                              address,
                                              phone,
                                              job,
                                            );
                                     ;
                                      context
                                            .read<ReceptionCubit>().fetchPatients();
                                     }
                                      _nameController.clear();
                                      _ageController.clear();
                                      _addressController.clear();
                                      _PhoneController.clear();
                                      _jobController.clear();
                                      _genderController.clear();
                                    },
                                    child: Container(
                                      width: 200,
                                      height: 50,
                                      decoration: BoxDecoration(
                                        color: primarycolor,
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                      child: Center(
                                        child: Text(
                                          "حفظ",
                                          style: TextStyle(
                                            fontSize: 18,
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Container(
                        child: Column(children: [
                          
                          Text("Make an appointment"),
                          
                          BlocBuilder<ReceptionCubit, ReceptionState>(
                            builder: (context, state) {
                             if(state is PatientLoaded){
                              return Text("${state.patients[2].name}");
                             }return Text("data");
                             
                            },
                          )
                          ]),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
