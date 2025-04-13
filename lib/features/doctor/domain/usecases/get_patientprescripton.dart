import 'package:clinic/features/doctor/domain/entity/prescription.dart';
import 'package:clinic/features/doctor/domain/repository/repository.dart';

class GetPatientprescriptonusecase {
  final DoctorRepository doctorRepository;

  GetPatientprescriptonusecase(this.doctorRepository);
  Future<List<Prescription>> execute({required int patinet_id}) async {
    return await doctorRepository.getprescription(patientid: patinet_id);
  }
}