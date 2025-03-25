import 'package:clinic/features/reception/domain/entity/appointment.dart';
import 'package:clinic/features/reception/domain/repository/repository.dart';

class GetappoinersUsecase {
    final ReceptionRepository receptionRepository;

  GetappoinersUsecase(this.receptionRepository);
 Future<List<Appointment>>execute()async{
  return await receptionRepository.getAppointers();
 }
}