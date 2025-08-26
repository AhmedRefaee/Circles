import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:circles/features/settings/switch_locale/presentation/view_model/cubit/switch_locale_cubit.dart';

class SwitchLocaleButton extends StatelessWidget {
  const SwitchLocaleButton({super.key});

  @override
  Widget build(BuildContext context) {
    return
    ElevatedButton(
        style: ElevatedButton.styleFrom(
          minimumSize: Size(48.h, 48.h),
        ),
        onPressed: () {
          context.read<SwitchlocaleCubit>().switchLanguage();
        },
        child: const Icon(Icons.language),
        
      
    );
  }
}