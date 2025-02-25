//lib/main.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning_spiders/core/theme/theme_cubit.dart';
import 'package:learning_spiders/core/theme/theme_state.dart';
import 'package:learning_spiders/core/user/user_cubit.dart';
import 'package:learning_spiders/core/config/app_routes.dart';
import 'dart:io' show Platform;
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:get_it/get_it.dart';
import 'package:learning_spiders/core/di/app_module.dart' as di;
import 'package:learning_spiders/core/services/audio_service.dart';
import 'package:learning_spiders/quizzes_section/nouns/blocs/choose_correct_answer/choose_correct_answer_bloc.dart';
import 'package:learning_spiders/quizzes_section/nouns/blocs/choose_word_correct/choose_word_correct_bloc.dart';

final getIt = GetIt.instance;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  if (Platform.isWindows) {
    sqfliteFfiInit();
    databaseFactory = databaseFactoryFfi;
  }

  await di.configureDependencies();

  runApp(const MyApp());
  await getIt<AudioService>().dispose();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<UserCubit>(create: (context) => getIt<UserCubit>()),
        BlocProvider<ThemeCubit>(create: (context) => getIt<ThemeCubit>()),
        BlocProvider<ChooseCorrectAnswerBloc>(
            create: (context) => getIt<ChooseCorrectAnswerBloc>()),
        BlocProvider<ChooseWordCorrectBloc>(
            create: (context) => getIt<ChooseWordCorrectBloc>()),
      ],
      child: BlocBuilder<ThemeCubit, ThemeState>(
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Learning Spiders',
            theme: state.themeData,
            themeMode: ThemeMode.system,
            initialRoute: AppRoutes.home,
            routes: AppRoutes.getRoutes(),
          );
        },
      ),
    );
  }
}