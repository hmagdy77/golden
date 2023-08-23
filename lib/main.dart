import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:upgrader/upgrader.dart';
import 'libraries.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Upgrader.clearSavedSettings();
  await initialService();
  initialization();
  runApp(const MyApp());
}

void initialization() async {
  await Future.delayed(const Duration(seconds: 2));
  FlutterNativeSplash.remove();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return GetMaterialApp(
      locale: const Locale('ar'), //controller.language,
      debugShowCheckedModeBanner: false,
      title: 'Golden Sports Academy',
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      themeMode: ThemeController().getThemeMode,
      initialBinding: AppBindings(),
      getPages: getRoutes!,
    );
  }
}
