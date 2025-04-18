import 'package:clinic/features/reception/domain/entity/appointment.dart';
import 'package:clinic/features/reception/domain/entity/entity.dart';
import 'package:clinic/features/reception/domain/repository/repository.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ReceptionRepositoryImpl implements ReceptionRepository {
  final SupabaseClient _supabaseClient;

  ReceptionRepositoryImpl(this._supabaseClient);

  @override
  Future<void> addPatient(Patient patient) async {
    try {
      final Map<String, dynamic> patientData = patient.toMap();
      patientData['age'] = (patientData['age'] as num).toInt();
      final response =
          await _supabaseClient
              .from('patients')
              .insert([patientData]) // Insert the patient data
              .select()
              .single();

      if (response.isEmpty) {
        print('Error: Failed to add patient');
        throw Exception('Failed to add patient');
      } else {
        print('Patient added successfully');
        print(
          response.entries.first.value.toString(),
        ); // Print the inserted data (optional)
      }
    } catch (e) {
      print("Error during insert: $e");
      rethrow;
    }
  }

  @override
  Future<List<Patientres>> getPatients() async {
    try {
      final data = await Supabase.instance.client.from('patients').select();

      final List<Map<String, dynamic>> dataa = data;

      return dataa
          .map((patientData) => Patientres.fromMap(patientData))
          .toList();
    } catch (e) {
      print("Error fetching patients: $e");
      rethrow;
    }
  }

  @override
  Future<void> makeAppointment(Appointment appointment) async {
    try {
      final Map<String, dynamic> Appointment_dada = appointment.toMap();
      final response =
          await _supabaseClient
              .from('appointments')
              .insert([Appointment_dada]) // Insert the patient data
              .select()
              .single();
      if (response.isEmpty) {
        print("nodata");
      }
    } catch (e) {
      print(e.toString());
      throw Exception('Failed to make appointment');
    }
  }

  @override
  Future<List<Appointment>> getAppointers() async {
    try {
      final data = await Supabase.instance.client.from('appointments').select();
      return data
          .map((patientData) => Appointment.fromMap(patientData))
          .toList();
    } catch (e) {
      print("Error fetching patients: $e");
      rethrow;
    }
  }

  @override
  Future<void> deleteClint(int id) async {
    try {
      final response = await _supabaseClient
          .from('patients')
          .delete()
          .eq('id', id);
      if (response.error != null) {
        print('Error deleting appointment: ${response.error!.message}');
      } else {
        print('Appointment deleted successfully');
      }
    } catch (error) {
      throw Exception('Failed to delete clint');
    }
  }
  
  @override
  Future<void> cancelAppointment(int id) async{
   try {
      final response = await _supabaseClient
          .from('appointments')
          .delete()
          .eq('id', id);
      if (response.error != null) {
        print('Error deleting appointment: ${response.error!.message}');
      } else {
        print('Appointment appointment successfully');
      }
    } catch (error) {
      throw Exception('Failed to cancel appointment');
    }
  }
  }

