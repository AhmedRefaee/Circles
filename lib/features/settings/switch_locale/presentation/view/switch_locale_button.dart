import 'package:circles/core/config/themes/app_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:circles/features/settings/switch_locale/presentation/view_model/cubit/switch_locale_cubit.dart';

class SwitchLocaleButton extends StatelessWidget {
  const SwitchLocaleButton({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        context.read<SwitchlocaleCubit>().switchLanguage();
      },
      icon: Icon(AppIcons.globe),
    );
  }
}
