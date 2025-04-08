import 'package:clinic/features/doctor/domain/entity/prescription.dart';
import 'package:supabase/src/supabase_client.dart';

abstract class DoctorRepository{
  DoctorRepository(SupabaseClient supabaseClient);

  Future<void>add_prescription({required Prescription prescription});
  Future<void>add_preparedprescription({required PreparedPrescription preparedPrescription});
  Future<List<PreparedPrescription>>getpreparedprescription();
}