import 'package:clinic/features/reception/domain/entity/entity.dart';

abstract class ReceptionRepository {
  Future<void> addPatient(Patient patient);
  Future<List<Patient>> getPatients();
}
