import 'package:chat_app/Res/colors.dart';
import 'package:chat_app/Res/constants.dart';
import 'package:chat_app/Res/routes.dart';
import 'package:chat_app/View/splash_view.dart';
import 'package:chat_app/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: appName,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Poppins',
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.blue,
          backgroundColor: AppColor.light,
        ),
        appBarTheme: AppBarTheme(
            centerTitle: false,
            elevation: 0,
            backgroundColor: AppColor.light,
            foregroundColor: AppColor.blue,
            titleTextStyle: Theme.of(context)
                .textTheme
                .headlineMedium!
                .copyWith(color: AppColor.blue)),
      ),
      initialRoute: SplashView.viewID,
      onGenerateRoute: Routes.generateRoute,
    );
  }
}
