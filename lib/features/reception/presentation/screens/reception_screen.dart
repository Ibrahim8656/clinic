import 'package:clinic/core/colos/colors.dart';
import 'package:clinic/core/widgets/add_clint.dart';
import 'package:clinic/core/widgets/appointment_itme.dart';
import 'package:clinic/core/widgets/patient_Item.dart';
import 'package:clinic/features/reception/domain/entity/appointment.dart';
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
  final _Searchcontroller = TextEditingController();
  final _jobController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  List<Appointment>patients=[];

  @override
  Widget build(BuildContext context) {
    double padding = MediaQuery.sizeOf(context).width * .05;
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
      body: Row(
        children: [
          Add_clint(
            padding: padding,
            formKey: _formKey,
            nameController: _nameController,
            PhoneController: _PhoneController,
            ageController: _ageController,
            genderController: _genderController,
            jobController: _jobController,
            addressController: _addressController,
          ),
          SizedBox(width: 50),
          Expanded(
            flex: 2,
            child: Padding(
              padding: EdgeInsets.only(top: 25, right: padding),
              child: Container(
                height: MediaQuery.sizeOf(context).height * .9,
                child: Column(
                  children: [
                    Text(
                      "المواعيد",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10),
                    Expanded(
                      child: BlocBuilder<ReceptionCubit, ReceptionState>(
                        builder: (context, state) {
                          if (state is AppointmetsLoaded) {
                             patients=state.patients;
                            return Appointment_Itme(patients: patients);
                          }else if(patients.isNotEmpty){
                            return Appointment_Itme(patients: patients);
                          }
                          return Padding(
                            padding: const EdgeInsets.only(top: 100.0),
                            child: Text(
                              "Loading...",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    SizedBox(height: 20),

                    Text(
                      "جميع العملاء",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 10,
                        bottom: 10,
                        right: 50,
                      ),
                      child: TextField(
                        controller: _Searchcontroller,
                        onChanged: (searchCharcter) {
                          ReceptionCubit.get(
                            context,
                          ).AddSearchedCharcterTolist(searchCharcter);
                        },
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          hintText: 'search',
                          prefixIcon: Icon(Icons.search),
                        ),
                      ),
                    ),
                    Expanded(
                      child: BlocBuilder<ReceptionCubit, ReceptionState>(
                        builder: (context, state) {
                          if (
                            state is searchsuccess
                          ) {
                            return patient_Item(
                              patients: state.searchedpatients ,
                            );
                          }else if(ReceptionCubit.get(context).AllPatients.isNotEmpty){
                            return patient_Item(patients: ReceptionCubit.get(context).AllPatients);
                          }else
                          return Padding(
                            padding: const EdgeInsets.only(top: 100.0),
                            child: Text(
                              "Loading...",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
