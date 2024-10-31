import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xp_store/bindings/general_binding.dart';
import 'package:xp_store/routes/app_routes.dart';
import 'package:xp_store/utils/constants/colors.dart';
import 'package:xp_store/utils/theme/theme.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      theme: XPAppTheme.lightTheme,
      darkTheme: XPAppTheme.darkTheme,
      getPages: AppRoutes.pages,
      initialBinding: GeneralBinding(),
      home: const Scaffold(
        backgroundColor: XPColors.primary,
        body: Center(
          child: CircularProgressIndicator(
            color: XPColors.white,
          ),
        ),
      ),
    );
  }
}
