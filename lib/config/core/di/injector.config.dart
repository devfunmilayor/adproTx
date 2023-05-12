// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i5;

import '../route/nav_keys.dart' as _i4;
import '../route/r_route.dart' as _i3;
import 'id.dart' as _i6; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
Future<_i1.GetIt> $initGetIt(
  _i1.GetIt get, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) async {
  final gh = _i2.GetItHelper(
    get,
    environment,
    environmentFilter,
  );
  final moduleApp = _$ModuleApp();
  gh.lazySingleton<_i3.AdProof>(() => moduleApp.router);
  gh.lazySingleton<_i4.NavigationService>(() => moduleApp.navigationService);
  await gh.factoryAsync<_i5.SharedPreferences>(
    () => moduleApp.prefs,
    preResolve: true,
  );
  return get;
}

class _$ModuleApp extends _i6.ModuleApp {}
