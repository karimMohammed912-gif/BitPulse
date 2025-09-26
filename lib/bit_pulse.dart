import 'package:bitpulse/Features/AuthFeature/Cubit/auth_cubit.dart';
import 'package:bitpulse/core/Routes/router_config.dart';
import 'package:bitpulse/core/Themes/theme_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BitPulse extends StatelessWidget {
  const BitPulse({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AuthCubit()),
        BlocProvider(create: (context) => ThemeCubit()),
      ],
      child: BlocBuilder<ThemeCubit, ThemeState>(
        builder: (context, themeState) {
       
          
          return MaterialApp.router(
            debugShowCheckedModeBanner: false,
            title: 'BitPulse',
            routerConfig: appRouter,
            theme: themeState.themeData,
          );
        },
      ),
    );
  }
}
