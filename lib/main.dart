import 'package:clinic/core/blocobserver/bloc_observer.dart';
import 'package:clinic/core/strings/strings.dart';
import 'package:clinic/features/reception/data/repository/repository.dart';
import 'package:clinic/features/reception/domain/usecases/add_patient_usecase.dart';
import 'package:clinic/features/reception/domain/usecases/get_patinet_data.dart';
import 'package:clinic/features/reception/presentation/cubit/reception_cubit.dart';
import 'package:clinic/features/reception/presentation/screens/reception_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  await Supabase.initialize(url: supabase_Url, anonKey: anonKey);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) {
            final supabaseClient = Supabase.instance.client;
            final repository = ReceptionRepositoryImpl(supabaseClient);
            final usecase = AddPatientUsecase(repository);
            final usecase2 = GetPatinetData(repository);
            return ReceptionCubit(usecase, usecase2)..fetchPatients();
          },
        ),
      ],
      child: MaterialApp(home: ReceptionScreen()),
    );
  }
}
