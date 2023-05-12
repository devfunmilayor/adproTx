// ignore_for_file: depend_on_referenced_packages

import 'package:adpro/features/auth/presentation/cubit/auth/auth_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/single_child_widget.dart';

final allProviders = <SingleChildWidget>[
  BlocProvider(create: (_) => AuthCubit()),
];
