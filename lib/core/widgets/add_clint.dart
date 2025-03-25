import 'package:clinic/core/colos/colors.dart';
import 'package:clinic/core/widgets/custom_text_fild.dart';
import 'package:clinic/features/reception/presentation/cubit/reception_cubit.dart';
import 'package:clinic/features/reception/presentation/cubit/reception_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Add_clint extends StatelessWidget {
  const Add_clint({
    super.key,
    required this.padding,
    required GlobalKey<FormState> formKey,
    required TextEditingController nameController,
    required TextEditingController PhoneController,
    required TextEditingController ageController,
    required TextEditingController genderController,
    required TextEditingController jobController,
    required TextEditingController addressController,
  }) : _formKey = formKey, _nameController = nameController, _PhoneController = PhoneController, _ageController = ageController, _genderController = genderController, _jobController = jobController, _addressController = addressController;

  final double padding;
  final GlobalKey<FormState> _formKey;
  final TextEditingController _nameController;
  final TextEditingController _PhoneController;
  final TextEditingController _ageController;
  final TextEditingController _genderController;
  final TextEditingController _jobController;
  final TextEditingController _addressController;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(left: padding, bottom: 25, top: 25),
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
                          final age = int.parse(_ageController.text);
                          final gender = _genderController.text;
                          final phone = _PhoneController.text;
                          final job = _jobController.text;
                          final address = _addressController.text;
    
                          context.read<ReceptionCubit>().addPatient(
                            name,
                            age,
                            gender,
                            address,
                            phone,
                            job,
                          );
                          context.read<ReceptionCubit>().fetchPatients();
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
    );
  }
}

