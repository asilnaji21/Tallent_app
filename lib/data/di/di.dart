import 'package:get_it/get_it.dart';
import 'package:talants_valley_community/app/networks/remote/my_dio.dart';

import '../../app/networks/local/cache_helper.dart';

import '../../business_logic/login/login_cubit.dart';
import '../../business_logic/register/auth_cubit.dart';

final sl = GetIt.instance;

void init() {
  sl.registerLazySingleton<Supervisor>(
    () => Supervisor(),
  );
  sl.registerLazySingleton<MyDio>(
    () => MyDio(),
  );

  sl.registerFactory<RegisterCubit>(
    () => RegisterCubit(),
  );
  sl.registerFactory<LoginCubit>(
    () => LoginCubit(),
  );
}
