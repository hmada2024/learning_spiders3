// lib/core/theme/theme_cubit.dart
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning_spiders/core/config/theme.dart';
import 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit() : super(ThemeLight(AppTheme.lightTheme));

  void toggleTheme() {
    emit(state is ThemeLight
        ? ThemeDark(AppTheme.darkTheme)
        : ThemeLight(AppTheme.lightTheme));
  }
}
