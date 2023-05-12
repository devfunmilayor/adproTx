import 'package:adpro/config/core/route/r_route.gr.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@module
abstract class ModuleApp {
  @preResolve
  Future<SharedPreferences> get prefs => SharedPreferences.getInstance();

  @lazySingleton
  AdproofRouter get router => AdproofRouter();
}
