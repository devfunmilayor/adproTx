// ignore_for_file: await_only_futures

import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'injector.config.dart';

final GetIt si = GetIt.I;

@injectableInit
Future<void> adProDependcies(String env) async =>
    await $initGetIt(si, environment: env);
