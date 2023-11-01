import 'package:bright_app/screens/login_register/login_screen.dart';
import 'package:bright_app/util/routes/app_routes.dart';
import 'package:bright_app/util/routes/routes.dart';
import 'package:dart_openai/dart_openai.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:bright_app/screens/login_register/components/widget_tree.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    name: "Bright",
    options: const FirebaseOptions(
      apiKey: "AIzaSyDrDPHN5gnvs9qL0MTeLl2hz6_P32gD7FY",
      appId: "1:1038749233014:web:a32150af2f66561f4a1457",
      messagingSenderId: "1038749233014",
      projectId: "bright-9bd43",
    ),
  );
  OpenAI.apiKey = "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";

  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarBrightness: Brightness.light,
      statusBarIconBrightness: Brightness.dark));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: LoginScreen(),
    );
  }
}
