import 'package:clinic/features/doctor/domain/entity/prescription.dart';
import 'package:clinic/features/doctor/domain/repository/repository.dart';

class AddPrescriptionUsecase {
 final DoctorRepository doctorRepository;

  AddPrescriptionUsecase(this.doctorRepository);
  Future<void>execute({required Prescription prescription})async{
await doctorRepository.add_prescription(prescription: prescription);
  }
}