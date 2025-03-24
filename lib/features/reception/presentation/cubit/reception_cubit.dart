import 'package:bloc/bloc.dart';
import 'package:clinic/features/reception/domain/entity/entity.dart';
import 'package:clinic/features/reception/domain/usecases/add_patient_usecase.dart';
import 'package:clinic/features/reception/domain/usecases/get_patinet_data.dart';
import 'package:clinic/features/reception/presentation/cubit/reception_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ReceptionCubit extends Cubit<ReceptionState> {
  final AddPatientUsecase addPatientUsecase;
  final GetPatinetData getPatinetData;
  ReceptionCubit(this.addPatientUsecase, this.getPatinetData) : super(ReceptionInitial());
  static ReceptionCubit get(context)=>BlocProvider.of(context);

  Future<void>addPatient(String name ,int age,String gender ,String address,String phone,String job)async{
    emit(AddPatientLoading());
    try{
      final patient = Patient(name: name, age: age, gender: gender, address: address,phone:phone, job: job);
      await addPatientUsecase.execute(patient: patient);
      emit( AddPatientSuccess());
    }catch(e){
      emit(AddPatientFailure(e.toString()));
    }
  }
   Future<void> fetchPatients() async {
    emit(PatientLoading());
    try {
      final patients = await getPatinetData.execute();
      emit(PatientLoaded(patients));
    } catch (e) {
      emit(PatientError('Failed to load patients: $e'));
    }
  }

}
