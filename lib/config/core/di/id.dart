import 'package:adpro/config/core/route/nav_keys.dart';
import 'package:adpro/config/core/route/r_route.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@module
abstract class ModuleApp {
  @preResolve
  Future<SharedPreferences> get prefs => SharedPreferences.getInstance();

  @lazySingleton
  AdProof get router => AdProof();

  @lazySingleton
  NavigationService get navigationService => NavigationService();
}
