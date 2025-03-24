import 'package:clinic/features/reception/domain/entity/entity.dart';
import 'package:clinic/features/reception/domain/repository/repository.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ReceptionRepositoryImpl implements ReceptionRepository {
  final SupabaseClient _supabaseClient;


  ReceptionRepositoryImpl(this._supabaseClient,);

  @override
  Future<void> addPatient(Patient patient) async {
    try {
      final Map<String, dynamic> patientData = patient.toMap();
      patientData['age'] = (patientData['age'] as num).toInt(); 
      final response = await _supabaseClient
          .from('patients')
          .insert([patientData])  // Insert the patient data
          .select()
          .single();

      if (response.isEmpty) {
        print('Error: Failed to add patient');
        throw Exception('Failed to add patient');
      } else {
        print('Patient added successfully');
        print(response.entries.first.value.toString());  // Print the inserted data (optional)
      }
    } catch (e) {
      print("Error during insert: $e");
      rethrow;
    }
  }
  
 @override
Future<List<Patient>> getPatients() async {
  try {
    final data = await Supabase.instance.client.from('patients')
  .select();

  
    final List<Map<String, dynamic>> dataa = data;

    return dataa.map((patientData) => Patient.fromMap(patientData)).toList();
  } catch (e) {
    print("Error fetching patients: $e");
    rethrow;
  }
}

}

