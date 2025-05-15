import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pocketPath/controller/auth/auth_controller.dart';
import 'package:pocketPath/firebase_options.dart';
import 'package:pocketPath/pages/Login/login.dart';
import 'package:pocketPath/pages/Menu/menu.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pocketPath/services/ad_service.dart';
import 'package:pocketPath/services/locale_services.dart';
import 'package:pocketPath/utils/localization/app_translations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  final adService = AdService();
  await adService.initialize();

  final LocaleService localeService = LocaleService();
  Locale? savedLocale = await localeService.getLocale();
  Locale initialAppLocale;

  if (savedLocale != null) {
    initialAppLocale = savedLocale;
  } else {
    Locale? deviceLocale = Get.deviceLocale;
    if (deviceLocale != null && deviceLocale.languageCode == 'tr') {
      initialAppLocale = const Locale('tr', 'TR');
    } else if (deviceLocale != null && deviceLocale.languageCode == 'de') {
      initialAppLocale = const Locale('de', 'DE');
    } else if (deviceLocale != null && deviceLocale.languageCode == 'fr') {
      initialAppLocale = const Locale('fr', 'FR');
    } else if (deviceLocale != null && deviceLocale.languageCode == 'es') {
      initialAppLocale = const Locale('es', 'ES');
    } else if (deviceLocale != null && deviceLocale.languageCode == 'pt') {
      initialAppLocale = const Locale('pt', 'BR');
    } else if (deviceLocale != null && deviceLocale.languageCode == 'zh') {
      initialAppLocale = const Locale('zh', 'CN');
    } else if (deviceLocale != null && deviceLocale.languageCode == 'hi') {
      initialAppLocale = const Locale('hi', 'IN');
    } else if (deviceLocale != null && deviceLocale.languageCode == 'ar') {
      initialAppLocale = const Locale('ar', 'SA');
    } else if (deviceLocale != null && deviceLocale.languageCode == 'ru') {
      initialAppLocale = const Locale('ru', 'RU');
    } else if (deviceLocale != null && deviceLocale.languageCode == 'ms') {
      initialAppLocale = const Locale('ms', 'MY');
    } else if (deviceLocale != null && deviceLocale.languageCode == 'id') {
      initialAppLocale = const Locale('id', 'ID');
    } else if (deviceLocale != null && deviceLocale.languageCode == 'bn') {
      initialAppLocale = const Locale('bn', 'BD');
    } else if (deviceLocale != null && deviceLocale.languageCode == 'ja') {
      initialAppLocale = const Locale('ja', 'JP');
    } else if (deviceLocale != null && deviceLocale.languageCode == 'ko') {
      initialAppLocale = const Locale('ko', 'KR');
    } else if (deviceLocale != null && deviceLocale.languageCode == 'it') {
      initialAppLocale = const Locale('it', 'IT');
    } else {
      initialAppLocale = const Locale('en', 'US');
    }
    await localeService.saveLocale(initialAppLocale);
  }

  Get.put(AuthController());
  runApp(MyApp(initialLocale: initialAppLocale));
}

class MyApp extends StatelessWidget {
  final Locale initialLocale;
  const MyApp({super.key, required this.initialLocale});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(448, 997),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return Builder(
          builder: (context) {
            return MediaQuery(
              data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
              child: GetMaterialApp(
                title: 'Flutter Demo',
                locale: initialLocale,
                translations: AppTranslations(),
                fallbackLocale: const Locale('en', 'US'),
                debugShowCheckedModeBanner: false,
                theme: ThemeData(
                  colorScheme:
                      ColorScheme.fromSeed(seedColor: Colors.deepPurple),
                  useMaterial3: true,
                ),
                home: child,
              ),
            );
          },
        );
      },
      child: Obx(() {
        final authController = Get.find<AuthController>();
        return authController.user.value == null ? const Login() : Menu();
      }),
    );
  }
}
