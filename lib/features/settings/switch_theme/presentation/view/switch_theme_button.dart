import 'package:circles/core/config/themes/app_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:circles/core/config/themes/theme_extensions/theme_extenstions.dart';
import 'package:circles/features/settings/switch_theme/presentation/view_model/cubit/theme_cubit.dart';

class SwitchThemeButton extends StatelessWidget {
  const SwitchThemeButton({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(AppIcons.nightMode),
      onPressed: () {
        if (context.isDarkMode) {
          context.read<ThemeCubit>().switchTheme(ThemeMode.light);
        } else {
          context.read<ThemeCubit>().switchTheme(ThemeMode.dark);
        }
      },
    );
  }
}
