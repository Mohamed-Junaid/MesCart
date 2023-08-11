import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mes_kart/Bloc/Resetprfl/resetprfl_bloc.dart';
import 'package:mes_kart/Bloc/Resetpswd/resetpswd_bloc.dart';
import 'package:mes_kart/Bloc/Signin/mes_signin_bloc.dart';
import 'package:mes_kart/Bloc/Signup/meskartSignup_bloc.dart';
import 'Ui/splash_screen.dart';

const String basePath = 'http://62.72.12.251:9999/api';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(375, 829),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (BuildContext context, Widget? child) {
          return MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => MeskartBloc(),
              ),
              BlocProvider(create: (context) => MesSigninBloc()),
              BlocProvider(create: (context) => ResetpswdBloc()),
              BlocProvider(create: (context) => ResetprflBloc()),
            ],
            child: MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Mes-Cart',
              theme: ThemeData(
                colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
              ),
              home: const SplashScreen(),
            ),
          );
        });
  }
}
