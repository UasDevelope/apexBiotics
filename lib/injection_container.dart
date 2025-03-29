import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:dio/dio.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

// Core
import ' core/network/network_info.dart';

// Data sources
import 'data/datasources/remote/auth_api.dart';

// Repositories
import 'data/models/repositories/auth_repository_impl.dart';

// Domain
import 'domain/ usecases/auth/login_usecase.dart';
import 'domain/ usecases/auth/register_usecase.dart';
import 'domain/repositories/auth_repository.dart';


// BLoCs
import 'features/ auth/login/login_bloc.dart';
import 'features/ auth/registrater/registration_bloc.dart';


final GetIt sl = GetIt.instance;

Future<void> init() async {
  // External packages
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton(() => Dio());
  sl.registerLazySingleton(() => InternetConnectionChecker());

  // Core
  sl.registerLazySingleton<NetworkInfo>(
        () => NetworkInfoImpl(sl<InternetConnectionChecker>()),
  );

  // Data sources
  sl.registerLazySingleton<AuthApi>(
        () => AuthApiImpl(dio: sl()),
  );

  // Repositories
  sl.registerLazySingleton<AuthRepository>(
        () => AuthRepositoryImpl(
      authApi: sl(),
      networkInfo: sl(),
    ),
  );

  // Use cases - Grouped together
  sl.registerLazySingleton(() => RegisterUseCase(sl()));
  sl.registerLazySingleton(() => LoginUseCase(sl()));

  // BLoCs - Grouped together
  sl.registerFactory(() => RegistrationBloc(registerUseCase: sl()));
  sl.registerFactory(() => LoginBloc(loginUseCase: sl()));
}