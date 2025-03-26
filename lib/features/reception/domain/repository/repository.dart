import 'package:clinic/features/reception/domain/entity/appointment.dart';
import 'package:clinic/features/reception/domain/entity/entity.dart';

abstract class ReceptionRepository {
  Future<void> addPatient(Patient patient);
  Future<List<Patientres>> getPatients();
   Future<void>deleteClint(int id);
  Future<void> makeAppointment(Appointment appointment);
  Future<List<Appointment>>getAppointers();
  Future<void>cancelAppointment(int id);
 
}
