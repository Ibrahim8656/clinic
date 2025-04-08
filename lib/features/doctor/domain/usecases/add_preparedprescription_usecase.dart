import 'package:clinic/features/doctor/domain/entity/prescription.dart';
import 'package:clinic/features/doctor/domain/repository/repository.dart';

class AddPreparedprescriptionUsecase {
final DoctorRepository doctorRepository;

  AddPreparedprescriptionUsecase(this.doctorRepository);
Future<void>execute({required PreparedPrescription preparedPrescription})async{
await doctorRepository.add_preparedprescription(preparedPrescription: preparedPrescription);
}

}