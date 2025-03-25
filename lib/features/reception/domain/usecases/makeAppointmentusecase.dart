import 'package:clinic/features/reception/domain/entity/appointment.dart';
import 'package:clinic/features/reception/domain/repository/repository.dart';

class Makeappointmentusecase {
  final ReceptionRepository receptionRepository;

  Makeappointmentusecase(this.receptionRepository);
  Future<void> execute({required Appointment appointment}) {
  return receptionRepository.makeAppointment(appointment);
  }
}