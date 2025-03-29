import 'package:apexbiotics/features/home/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:apexbiotics/injection_container.dart' as di;

import '../domain/ usecases/auth/login_usecase.dart';
import '../domain/ usecases/auth/register_usecase.dart';
import '../features/ auth/login/login_bloc.dart';
import '../features/ auth/registrater/registration_bloc.dart';
import '../features/ auth/screens/login_screen.dart';
import '../features/ auth/screens/register_screen.dart';
import '../features/onboarding/screens/splash_screen.dart';
import '../features/onboarding/screens/welcome_screen.dart';
import 'app_routes.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.splash:
        return MaterialPageRoute(builder: (_) => const SplashScreen());

      case AppRoutes.welcome:
        return MaterialPageRoute(builder: (_) => const WelcomeScreen());

      case AppRoutes.home:
        return MaterialPageRoute(builder: (_) => const HomeScreen());

      case AppRoutes.register:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => RegistrationBloc(
              registerUseCase: di.sl<RegisterUseCase>(),
            ),
            child:  RegistrationScreen(),
          ),
        );
      case AppRoutes.login:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => di.sl<LoginBloc>(), // Get instance from service locator
            child: const LoginScreen(),
          ),
        );

      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}