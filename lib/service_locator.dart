import 'package:get_it/get_it.dart';
import 'package:myapp/data/repository/auth/auth_repository_impl.dart';
import 'package:myapp/data/sources/auth/auth_firebase_service.dart';
import 'package:myapp/domain/repository/auth/auth.dart';
import 'package:myapp/domain/repository/usecases/auth/signin.dart';
import 'package:myapp/domain/repository/usecases/auth/signup.dart';

final s1 = GetIt.instance;

Future<void> initializeDependencies() async {
  s1.registerSingleton<AuthFireBaseService>(AuthFirebaseServiceImpl());

  s1.registerSingleton<AuthRepository>(AuthRepositoryImpl());

  s1.registerSingleton<SignupUseCase>(SignupUseCase());

  s1.registerSingleton<SigninUseCase>(SigninUseCase());
}
