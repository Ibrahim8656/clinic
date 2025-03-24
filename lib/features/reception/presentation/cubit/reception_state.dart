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
  final List<Patient> patients;

  PatientLoaded(this.patients);
}

class PatientError extends ReceptionState {
  final String message;

  PatientError(this.message);
}

