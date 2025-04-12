import 'package:clinic/core/blocobserver/bloc_observer.dart';
import 'package:clinic/core/helpers/Cash_helper/shearedpref.dart';
import 'package:clinic/core/strings/strings.dart';
import 'package:clinic/features/auth/presentation/screens/loginscreen.dart';
import 'package:clinic/features/auth/presentation/screens/welcome_screen.dart';
import 'package:clinic/features/doctor/data/repository/repository.dart';
import 'package:clinic/features/doctor/domain/usecases/add_preparedprescription_usecase.dart';
import 'package:clinic/features/doctor/domain/usecases/add_prescription_usecase.dart';
import 'package:clinic/features/doctor/domain/usecases/get_prerpared_prescription.dart';
import 'package:clinic/features/doctor/presentation/cubit/doctor_cubit.dart';
import 'package:clinic/features/doctor/presentation/screens/doctor_home.dart';
import 'package:clinic/features/reception/data/repository/repository.dart';
import 'package:clinic/features/reception/domain/usecases/add_patient_usecase.dart';
import 'package:clinic/features/reception/domain/usecases/cancel_appointment.dart';
import 'package:clinic/features/reception/domain/usecases/delete_clint_usecase.dart';
import 'package:clinic/features/reception/domain/usecases/getAppoiners.dart';
import 'package:clinic/features/reception/domain/usecases/get_patinet_data.dart';
import 'package:clinic/features/reception/domain/usecases/makeAppointmentusecase.dart';
import 'package:clinic/features/reception/presentation/cubit/reception_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  await Supabase.initialize(url: supabase_Url, anonKey: anonKey);
   await CashHelper.init();
   bool is_logedin = CashHelper.Getdata("is_logedin") ?? false;
  runApp(MyApp(is_logedin: is_logedin,));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.is_logedin});
final bool is_logedin;
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) {
            final supabaseClient = Supabase.instance.client;
            return DoctorCubit(
              AddPreparedprescriptionUsecase(
                DoctorRepositoryimpl(supabaseClient),
              ),
              GetPrerparedPrescriptionUsecase(
                DoctorRepositoryimpl(supabaseClient),
              ),
              addPrescriptionUsecase: AddPrescriptionUsecase(
                DoctorRepositoryimpl(supabaseClient),
              ),
            )..Fetch_preparedPrescruotions();
          },
        ),
        BlocProvider(
          create: (context) {
            final supabaseClient = Supabase.instance.client;
            final repository = ReceptionRepositoryImpl(supabaseClient);
            final usecase = AddPatientUsecase(repository);
            final usecase2 = GetPatinetData(repository);
            final usecase3 = Makeappointmentusecase(repository);
            final usecase4 = GetappoinersUsecase(repository);
            final usecase5 = DeleteClintUsecase(repository);
            final usecase6 = CancelAppointmentusecase(repository);
            return ReceptionCubit(
                usecase,
                usecase2,
                usecase3,
                usecase4,
                usecase5,
                usecase6,
              )
              ..fetchPatients()
              ..fetchAppointers();
          },
        ),
      ],
      child: MaterialApp(home:DoctorHome() ),
    );
  }
}
