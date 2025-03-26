import 'package:clinic/features/reception/domain/repository/repository.dart';

class DeleteClintUsecase {
  final ReceptionRepository receptionRepository;

  DeleteClintUsecase(this.receptionRepository);
  Future <void>execute({required int id})async{
    await receptionRepository.deleteClint(id);
  }
}