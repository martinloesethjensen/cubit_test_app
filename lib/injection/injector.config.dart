// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../domain/usecases/counter/decrement_use_case.dart' as _i3;
import '../domain/usecases/counter/increment_use_case.dart' as _i4;
import '../presentation/feature/home/cubit/home_cubit.dart'
    as _i5; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  gh.factory<_i3.DecrementUseCase>(() => _i3.DecrementUseCase());
  gh.factory<_i4.IncrementUseCase>(() => _i4.IncrementUseCase());
  gh.factory<_i5.HomeCubit>(() =>
      _i5.HomeCubit(get<_i4.IncrementUseCase>(), get<_i3.DecrementUseCase>()));
  return get;
}
