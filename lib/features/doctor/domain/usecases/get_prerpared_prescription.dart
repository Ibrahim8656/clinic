import 'package:clinic/features/doctor/domain/entity/prescription.dart';
import 'package:clinic/features/doctor/domain/repository/repository.dart';

class GetPrerparedPrescriptionUsecase {
  final DoctorRepository doctorRepository;

  GetPrerparedPrescriptionUsecase(this.doctorRepository);
  Future<List<PreparedPrescription>>execute()async{
   return await doctorRepository.getpreparedprescription();
  }
}