import 'package:circles/core/config/themes/theme_data/theme_data_light.dart';
import 'package:circles/core/config/themes/theme_data/theme_data_dark.dart';
import 'package:circles/core/config/localization/app_localization.dart';
import 'package:circles/features/auth/auth_landing/presentation/view/auth_landing.dart';
import 'package:circles/features/settings/switch_locale/presentation/view_model/cubit/switch_locale_cubit.dart';
import 'package:circles/features/settings/switch_theme/presentation/view_model/cubit/theme_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:circles/core/routing/app_router.dart';
import 'package:circles/core/routing/routes.dart';

class Circles extends StatelessWidget {
  const Circles({super.key});

  Widget _buildMaterialApp(
    BuildContext context,
    ThemeMode themeMode,
    Locale locale,
  ) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      builder: (_, child) {
        return MaterialApp(
          ////disable debug banner
          debugShowCheckedModeBanner: false,

          ///localization
          locale: locale,
          localizationsDelegates: AppLocalization.localizationsDelegates,
          supportedLocales: AppLocalization.supportedLocalesList,

          ///theme
          theme: getlightTheme(),
          darkTheme: getdarkTheme(),
          themeAnimationCurve: Curves.easeInOut,
          themeAnimationDuration: const Duration(milliseconds: 500),
          themeMode: themeMode,
          initialRoute: Routes.authLanding,
          onGenerateRoute: AppRouter().generateRoute,

          ///home
          home: child,
        );
      },
      child: const AuthLanding(),
    );
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => ThemeCubit()),
        BlocProvider(create: (context) => SwitchlocaleCubit()),
      ],
      child: BlocBuilder<ThemeCubit, ThemeMode>(
        builder: (context, themeMode) {
          return BlocBuilder<SwitchlocaleCubit, Locale>(
            builder: (context, locale) {
              return _buildMaterialApp(context, themeMode, locale);
            },
          );
        },
      ),
    );
  }
}
