import 'package:bloc/bloc.dart';
import 'package:clinic/features/reception/domain/entity/appointment.dart';
import 'package:clinic/features/reception/domain/entity/entity.dart';
import 'package:clinic/features/reception/domain/usecases/add_patient_usecase.dart';
import 'package:clinic/features/reception/domain/usecases/cancel_appointment.dart';
import 'package:clinic/features/reception/domain/usecases/delete_clint_usecase.dart';
import 'package:clinic/features/reception/domain/usecases/getAppoiners.dart';
import 'package:clinic/features/reception/domain/usecases/get_patinet_data.dart';
import 'package:clinic/features/reception/domain/usecases/makeAppointmentusecase.dart';
import 'package:clinic/features/reception/presentation/cubit/reception_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ReceptionCubit extends Cubit<ReceptionState> {
  final AddPatientUsecase addPatientUsecase;
  final GetPatinetData getPatinetData;
  final Makeappointmentusecase makeappointmentusecase;
  final GetappoinersUsecase getappoinersUsecase;
  final DeleteClintUsecase deleteClintUsecase;
  final CancelAppointmentusecase cancelAppointmentusecase;
  ReceptionCubit(
    this.addPatientUsecase,
    this.getPatinetData,
    this.makeappointmentusecase,
    this.getappoinersUsecase,
    this.deleteClintUsecase,
    this.cancelAppointmentusecase,
  ) : super(ReceptionInitial());
  static ReceptionCubit get(context) => BlocProvider.of(context);
  List<Patientres> AllPatients = [];

  Future<void> addPatient(
    String name,
    int age,
    String gender,
    String address,
    String phone,
    String job,
  ) async {
    emit(AddPatientLoading());
    try {
      final patient = Patient(
        name: name,
        age: age,
        gender: gender,
        address: address,
        phone: phone,
        job: job,
      );
      await addPatientUsecase.execute(patient: patient);
      emit(AddPatientSuccess());
      fetchPatients();
    } catch (e) {
      emit(AddPatientFailure(e.toString()));
    }
  }

  Future<void> fetchPatients() async {
    emit(PatientLoading());
    try {
      final patients = await getPatinetData.execute();
      emit(PatientLoaded(patients));
      AllPatients = patients;
      fetchAppointers();
    } catch (e) {
      emit(PatientError('Failed to load patients: $e'));
    }
  }

  Future<void> deleteClint({required int id}) async {
    emit(deleteloading());
    try {
      await deleteClintUsecase.execute(id: id);
      emit(deletesuccess());
      fetchPatients();
    } catch (error) {
      print(error.toString());
      emit(deleteError(error.toString()));
      fetchPatients();
    }
  }

  Future<void> makeAppointment({
    required int id,
    required String veisit_type,
    required String name,
    required String gender,
    required int age,
    required String address,
    required String phone,
    required String job,
  }) async {
    emit(appointmentLoading());
    try {
      final appointment = Appointment(
        id: id,
        veisit_type: veisit_type,
        age: age,
        gender: gender,
        address: address,
        phone: phone,
        job: job,
        name: name,
      );
      await makeappointmentusecase.execute(appointment: appointment);
      emit(appointmentLoaded());
      fetchPatients();
    } catch (e) {
      print(e.toString());
      emit(appointmentError(e.toString()));
    }
  }

  Future<void> fetchAppointers() async {
    emit(AppointmetsLoading());
    try {
      final patients = await getappoinersUsecase.execute();
      emit(AppointmetsLoaded(patients));
    } catch (e) {
      emit(AppointmetsError('Failed to load Appointments: $e'));
    }
  }

  void AddSearchedCharcterTolist(String _searchCharcter) {
    emit(searchloading());
    try {
      final searchedpatients =
          AllPatients.where(
            (Patientres) =>
                Patientres.name.toLowerCase().startsWith(_searchCharcter),
          ).toList();
      emit(searchsuccess(searchedpatients));
    } catch (e) {
      emit(searchError(e.toString()));
    }
  }

  Future<void> cancelAppointment({required int id}) async {
    emit(cancelloading());
    try {
      await cancelAppointmentusecase.execute(id: id);
      emit(cancelsuccess());
      fetchAppointers();
    } catch (e) {
      print(e.toString());
      emit(cancelError(e.toString()));
      fetchAppointers();
    }
  }
}
