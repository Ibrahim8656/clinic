part of 'doctor_cubit.dart';

sealed class DoctorState extends Equatable {
  const DoctorState();

  @override
  List<Object> get props => [];
}

final class DoctorInitial extends DoctorState {}
class patient_infosuccess extends DoctorState {}
class visit_infosuccess extends DoctorState {}

class AddTreatmentLoading extends DoctorState {}
class AddTreatmentsuccess extends DoctorState {}

class AddTreatmentfailuer extends DoctorState {
  final String errormessage;

  AddTreatmentfailuer(this.errormessage);
}

class DeleteTreatmentLoading extends DoctorState {}
class DeleteTreatmentsuccess extends DoctorState {}

class DeleteTreatmentfailuer extends DoctorState {
  final String errormessage;

  DeleteTreatmentfailuer(this.errormessage);
}
class selectappointmentsorpateintsstate extends DoctorState{}
class selectappointmentsorpateintsstateLoading extends DoctorState{}
class selectappointmentsorpateintsstateerror extends DoctorState{}