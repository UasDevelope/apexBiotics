import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

final GetIt sl = GetIt.instance;

Future<void> init() async {
  // Only initialize essentials for splash/welcome screens
  await _initExternalDependencies();
}

Future<void> _initExternalDependencies() async {
  // For future use (e.g., checking if it's first launch)
  // sl.registerFactory(() => RegistrationBloc(registerUseCase: sl()));
  // sl.registerLazySingleton(() => RegisterUseCase(sl()));
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
}
