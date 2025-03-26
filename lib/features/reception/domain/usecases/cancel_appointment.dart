import 'package:clinic/features/reception/domain/repository/repository.dart';

class CancelAppointmentusecase {
  final ReceptionRepository receptionRepository;

  CancelAppointmentusecase(this.receptionRepository);
  Future <void>execute({required int id})async{
    await receptionRepository.cancelAppointment(id);
  }
}