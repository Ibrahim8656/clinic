import 'package:clinic/features/reception/domain/entity/entity.dart';
import 'package:clinic/features/reception/domain/repository/repository.dart';

class AddPatientUsecase {
    final ReceptionRepository receptionRepository;

  AddPatientUsecase(this.receptionRepository);
  Future<void> execute({required Patient patient}) {
    return receptionRepository.addPatient(patient);
  }
}