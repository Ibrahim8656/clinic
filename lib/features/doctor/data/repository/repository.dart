import 'dart:convert';

import 'package:clinic/features/doctor/domain/entity/prescription.dart';
import 'package:clinic/features/doctor/domain/repository/repository.dart';
import 'package:clinic/features/doctor/presentation/widgets/prepeard_prescriptions.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class DoctorRepositoryimpl implements DoctorRepository {
  final SupabaseClient _supabaseClient;

  DoctorRepositoryimpl(this._supabaseClient);
  @override
  Future<void> add_prescription({required Prescription prescription}) async {
    try {
      final Map<String, dynamic> prescriptionmap = prescription.toMap();
      final response =
          await _supabaseClient
              .from('prescription')
              .insert([prescriptionmap])
              .select()
              .single();
      if (response.isEmpty) {
        print("no prescription");
      }
    } catch (e) {
      print(e.toString());
      throw Exception('Failed to add prescription');
    }
  }

  @override
  Future<void> add_preparedprescription({
    required PreparedPrescription preparedPrescription,
  }) async {
    try {
      final Map<String, dynamic> preparedPrescriptiononMap =
          preparedPrescription.toMap();
      final response =
          await _supabaseClient
              .from("preparedprescriptions")
              .insert([preparedPrescriptiononMap])
              .select()
              .single();
      if (response.isNotEmpty) {
        print("add prepared prescription sucssess");
      } else {
        print("fiaild to add prepared prescription");
      }
    } catch (e) {
      print("error:${e.toString()}");
    }
  }

  @override
  Future<List<PreparedPrescription>> getpreparedprescription() async {
    try {
      final data = await _supabaseClient.from("preparedprescriptions").select();
      return data.map((prescription) => PreparedPrescription.fromMap(prescription)).toList();
    } catch (error) {
      print(error.toString());
      rethrow;
    }
  }
}
