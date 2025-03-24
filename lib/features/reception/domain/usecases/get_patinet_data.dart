import 'package:clinic/features/reception/domain/entity/entity.dart';
import 'package:clinic/features/reception/domain/repository/repository.dart';

class GetPatinetData {
  final ReceptionRepository receptionRepository;

  GetPatinetData(this.receptionRepository);
  Future<List<Patient>> execute()async{
    return await receptionRepository.getPatients();
  }

}