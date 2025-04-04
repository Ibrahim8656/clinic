import 'package:bloc/bloc.dart';
import 'package:clinic/core/widgets/add_prescription.dart';
import 'package:clinic/core/widgets/patient_info.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'doctor_state.dart';

class DoctorCubit extends Cubit<DoctorState> {
  DoctorCubit() : super(DoctorInitial());
  static DoctorCubit get(context)=> BlocProvider.of(context);
  
     List<Map<String, String>> treatments = [
   
  ];
  bool isappointment=true;
   
  int cuttrnt_choiss=0;
  List <Widget> choissofdoctor=[
  PatientInfo(),
  AddPrescription()
  ];

  selectappointmentsorpateints({required bool boo}){
    emit(selectappointmentsorpateintsstateLoading());
   try{
     isappointment=boo;
    emit(selectappointmentsorpateintsstate());
   }catch(error){
    emit(selectappointmentsorpateintsstateerror());
   }
  }
  void changing_info({required String info}){
    if( info=="patient"){
      cuttrnt_choiss=0;
      emit(patient_infosuccess());
    }else {
      cuttrnt_choiss=1;
      emit(visit_infosuccess());
    }
  }
   List<String> items = [
    "Otrivin nasal drops for children",
    "Otrivin baby saline nasal drops",
    "CAPOTRIL 50 MG 20 TABS",
    "CLOTRISONE 15 GM CREAM",
    "Amotril",
    "Rivotril"
  ];
  List<String>  filteredItems=[];
  void filterItems(String query) {
  
      filteredItems = items
          .where((item) => item.toLowerCase().contains(query.toLowerCase()))
          .toList();
 
  }
     addRow({required String treatmentController,required String dosageController,required String? note}) {
        emit(AddTreatmentLoading());
      try{
        treatments.add({
        "treatment": treatmentController,
        "dosage": dosageController,
        "notes": note??'',
      });
      emit( AddTreatmentsuccess());
      }catch(error){
        emit(AddTreatmentfailuer(error.toString()));
      }
  

    // Clear the input fields
    // treatmentController.clear();
    // dosageController.clear();
    // notesController.clear();
  }
   deleteRow(int index) {
      emit(DeleteTreatmentLoading());
      try{
        treatments.removeAt(index);
        emit(DeleteTreatmentsuccess());
      }catch(error){
        emit(DeleteTreatmentfailuer(error.toString()));
      }

  }

}
