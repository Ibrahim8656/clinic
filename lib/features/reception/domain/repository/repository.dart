import 'package:clinic/features/reception/domain/entity/appointment.dart';
import 'package:clinic/features/reception/domain/entity/entity.dart';
import 'package:clinic/features/reception/presentation/cubit/reception_state.dart';

abstract class ReceptionRepository {
  Future<void> addPatient(Patient patient);
  Future<List<Patientres>> getPatients();
  Future<void> makeAppointment(Appointment appointment);
  Future<List<Appointment>>getAppointers();
}
