import 'package:adpro/config/core/di/injector.dart';
import 'package:adpro/config/core/di/providers.dart';
import 'package:adpro/config/core/resources/size_c.dart';
import 'package:adpro/config/core/resources/theme_config.dart';
import 'package:adpro/config/core/route/r_route.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AdProApp extends StatefulWidget {
  const AdProApp({super.key});
  static final GlobalKey<ScaffoldState> scaffoldKey =
      GlobalKey(debugLabel: 'app-scaffoldkey');

  @override
  State<AdProApp> createState() => _AdProAppState();
}

class _AdProAppState extends State<AdProApp> {
  final approute = si<AdproofRouter>();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: allProviders,
      child: GestureDetector(
        onTap: () {
          WidgetsBinding.instance.focusManager.primaryFocus?.unfocus();
        },
        child: ScreenUtilInit(
            designSize: const Size(414, 896),
            minTextAdapt: true,
            splitScreenMode: true,
            builder: (context, child) {
              return LayoutBuilder(builder: (context, constraints) {
                SizeConfig().init(constraints);
                return MaterialApp.router(
                  debugShowCheckedModeBanner: false,
                  theme: getApplicationTheme(),
                  title: 'Adproof',
                  builder: (c, w) {
                    return Stack(
                      children: [
                        MediaQuery(
                          data: MediaQuery.of(c).copyWith(
                              textScaleFactor: 1.00,
                              systemGestureInsets: const EdgeInsets.all(400),
                              navigationMode: NavigationMode.directional),
                          child: Scaffold(
                              backgroundColor: Colors.white,
                              resizeToAvoidBottomInset: true,
                              key: AdProApp.scaffoldKey,
                              body: w),
                        ),
                        // const MaintenanceScreen(),
                        // const DeviceGuard(),
                      ],
                    );
                  },
                  routeInformationParser: approute.defaultRouteParser(),
                  routerDelegate: approute.delegate(),
                );
              });
            }),
      ),
    );
  }
}
