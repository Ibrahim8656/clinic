import 'package:bloc/bloc.dart';
import 'package:clinic/core/widgets/add_prescription.dart';
import 'package:clinic/core/widgets/patient_info.dart';
import 'package:clinic/features/doctor/domain/entity/prescription.dart';
import 'package:clinic/features/doctor/domain/usecases/add_preparedprescription_usecase.dart';
import 'package:clinic/features/doctor/domain/usecases/add_prescription_usecase.dart';
import 'package:clinic/features/doctor/domain/usecases/get_patientprescripton.dart';
import 'package:clinic/features/doctor/domain/usecases/get_prerpared_prescription.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'doctor_state.dart';

class DoctorCubit extends Cubit<DoctorState> {
  final AddPrescriptionUsecase addPrescriptionUsecase;
  final AddPreparedprescriptionUsecase addPreparedprescriptionUsecase;
  final GetPrerparedPrescriptionUsecase getPrerparedPrescriptionUsecase;
  final GetPatientprescriptonusecase getPatientprescripton;
  DoctorCubit(
    this.addPreparedprescriptionUsecase,
    this.getPrerparedPrescriptionUsecase, this.getPatientprescripton, {
    required this.addPrescriptionUsecase,
  }) : super(DoctorInitial());
  static DoctorCubit get(context) => BlocProvider.of(context);

  List<Map<String, String>> treatments = [];
  bool isappointment = true;
  String treatmenttosave = '';
  List<String> treatmentList = [];
  List<String> notelist = [];
  String dosagetosave = '';
  String Titletosave = '';
  String notetosave = '';
  List<String> dosagetList = [];
  bool ispatientinfo = false;
  TextEditingController Notecontroller = TextEditingController();
  List<Widget> choissofdoctor = [PatientInfo(), AddPrescription()];

  selectappointmentsorpateints({required bool boo}) {
    emit(selectappointmentsorpateintsstateLoading());
    try {
      isappointment = boo;
      emit(selectappointmentsorpateintsstate());
    } catch (error) {
      emit(selectappointmentsorpateintsstateerror());
    }
  }

  void changing_info({required bool ispatientinfoo}) {
    try {
      ispatientinfo = ispatientinfoo;
      if (ispatientinfo) {
        emit(patient_infosuccess());
      } else
        emit(visit_infosuccess());

      print(ispatientinfo);
    } catch (e) {
      emit(visit_infosuccess());
    }
  }

  List<String> items = [
    "Otrivin nasal drops for children",
    "Otrivin baby saline nasal drops",
    "CAPOTRIL 50 MG 20 TABS",
    "CLOTRISONE 15 GM CREAM",
    "Amotril",
    "Rivotril",
  ];
  List<String> filteredItems = [];
  List<PreparedPrescription> preparedprescriptionslist = [];
  void filterItems(String query) {
    filteredItems =
        items
            .where((item) => item.toLowerCase().contains(query.toLowerCase()))
            .toList();
  }

  addRow({
    required String treatment,
    required String dosage,
    required String? note,
  }) {
    emit(AddTreatmentLoading());
    try {
      treatments.add({
        "treatment": treatment,
        "dosage": dosage,
        "notes": note ?? '',
      });
      treatmentList.add(treatment);
      dosagetList.add(dosage);
      notelist.add(note ?? '');
      emit(AddTreatmentsuccess());
    } catch (error) {
      emit(AddTreatmentfailuer(error.toString()));
    }
  }

  deleteRow(int index) {
    emit(DeleteTreatmentLoading());
    try {
      treatments.removeAt(index); //delete in ui

      treatmentList.removeAt(index);
      dosagetList.removeAt(index);
      notelist.removeAt(index);

      emit(DeleteTreatmentsuccess());
    } catch (error) {
      emit(DeleteTreatmentfailuer(error.toString()));
    }
  }

  Future<void> add_prescriptiontodatabase({
    required int patinet_id,
    required String treatmenttosave,
    required String doasage,
    required String note,
  }) async {
    for (var i in treatmentList) {
      treatmenttosave += "$i|";
    }
    for (var i in dosagetList) {
      dosagetosave += "$i|";
    }
    for (var i in notelist) {
      note += "$i|";
    }
    treatmentList = [];
    dosagetList = [];
    notelist = [];
    final prescription = Prescription(
      patinet_id: patinet_id,
      treatment: treatmenttosave,
      doasage: dosagetosave,
      note: note 
    );
    print(treatmenttosave);
    treatmenttosave = '';
    dosagetosave = '';
    note = '';
    emit(AddprescriptionLoading());
    try {
      await addPrescriptionUsecase.execute(prescription: prescription);
      emit(Addprescriptionsuccess());
    } catch (error) {
      emit(Addprescriptionfailuer(error.toString()));
    }
  }

  DeletePrescriptiondatat() {
    Notecontroller.text = '';
    treatments = [];
    emit(DeletePrescriptiondatatstate());
  }

  Future<void> collect_preparedprescription({
    required String title,
    required String treatment,
    required String dosage,
    required String note,
  }) async {
    Titletosave = title;
    treatmenttosave += '$treatment|';
    dosagetosave += '$dosage|';
    notetosave += '$note|';
    emit(CollectPreparedprescriptionState());
  }

  Future<void> add_preparedprescription() async {
    emit(LoadingAddPreparedprescriptionState());
    try {
      final prescription = PreparedPrescription(
        treatment: treatmenttosave,
        doasage: dosagetosave,
        note: notetosave,
        title: Titletosave,
      );
      await addPreparedprescriptionUsecase.execute(
        preparedPrescription: prescription,
      );
      treatmenttosave = '';
      dosagetosave = '';
      Titletosave = '';
      notetosave = '';

      emit(SuccessAddPreparedprescriptionstate());
      Fetch_preparedPrescruotions();
    } catch (error) {
      print(error.toString());
      emit(ErrorAddPreparedprescriptionstate(error.toString()));
    }
  }

  Future<void> Fetch_preparedPrescruotions() async {
    emit(LoadingFetchPreparedprescriptionState());
    try {
      final Prescriptions = await getPrerparedPrescriptionUsecase.execute();
      preparedprescriptionslist = Prescriptions;
      emit(SuccessFetchPreparedprescriptionstate());
    } catch (error) {
      print(error.toString());
      emit(ErrorFetchPreparedprescriptionstate(error.toString()));
    }
  }
 
 int vesitnumber=1;
  Future<void> GetPatientprescripton({required patinet_id}) async {
    emit(GetprescriptionLoadingState());
    try{
      final prescriptions = await getPatientprescripton.execute(patinet_id: patinet_id);
      vesitnumber=prescriptions.length;
      List<String> treatmentList = [];
      List<String> doasageList = [];
      List<String> notelist = [];
      for( var i in prescriptions){
        treatmentList.add(i.treatment);
        doasageList.add(i.doasage);
        notelist.add(i.note);
      }
      emit(GetprescriptionSuccessState(treatmentList,doasageList,notelist));
    }catch(error){
      print(error.toString());
      emit(GetprescriptionErrorState(error.toString()));
    }


  }
}
