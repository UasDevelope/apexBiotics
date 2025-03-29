import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:apexbiotics/injection_container.dart' as di;
import 'package:apexbiotics/routes/app_routes.dart';

import '../login/login_bloc.dart';
import '../widgets/login_form.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: BlocProvider(
        create: (_) => di.sl<LoginBloc>(), // Get instance from service locator
        child: const LoginForm(),
      ),
    );
  }
}