import 'package:clinic/features/reception/domain/entity/appointment.dart';
import 'package:clinic/features/reception/domain/entity/entity.dart';
import 'package:equatable/equatable.dart';

abstract class ReceptionState extends Equatable {
  const ReceptionState();

  @override
  List<Object> get props => [];
}

class ReceptionInitial extends ReceptionState {}

class AddPatientLoading extends ReceptionState {}

class AddPatientSuccess extends ReceptionState {}

class AddPatientFailure extends ReceptionState {
  final String message;

  const AddPatientFailure(this.message);

  @override
  List<Object> get props => [message];
}

class PatientLoading extends ReceptionState {}

class PatientLoaded extends ReceptionState {
  final List<Patientres> patients;

  PatientLoaded(this.patients);
}

class PatientError extends ReceptionState {
  final String message;

  PatientError(this.message);
}

class appointmentLoading extends ReceptionState {}

class appointmentLoaded extends ReceptionState {}

class appointmentError extends ReceptionState {
  final String message;

  appointmentError(this.message);
}

class AppointmetsLoading extends ReceptionState {}

class AppointmetsLoaded extends ReceptionState {
  final List<Appointment> patients;

  AppointmetsLoaded(this.patients);
}

class AppointmetsError extends ReceptionState {
  final String message;

  AppointmetsError(this.message);
}

class searchloading extends ReceptionState {}

class searchsuccess extends ReceptionState {
  final List<Patientres> searchedpatients;

  searchsuccess(this.searchedpatients);
}

class searchError extends ReceptionState {
  final String message;

  searchError(this.message);
}

class deleteloading extends ReceptionState {}

class deletesuccess extends ReceptionState {}

class deleteError extends ReceptionState {
  final String message;

  deleteError(this.message);
}
class cancelloading extends ReceptionState {}

class cancelsuccess extends ReceptionState {}

class cancelError extends ReceptionState {
  final String message;

  cancelError(this.message);
}
