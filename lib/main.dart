import 'package:dio/dio.dart';
import 'package:facts_project_g1/Remote/dio_helper.dart';
import 'package:facts_project_g1/cubit/fact_cubit.dart';
import 'package:facts_project_g1/screen/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubit/FavCubit.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => FactCubit()),
        BlocProvider(create: (_) => FavCubit()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: const HomeScreen(),
      ),
    );
  }
}
