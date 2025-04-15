import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:var_dashboard/firebase_options.dart';
import 'package:var_dashboard/services/app_routes.dart';
import 'package:var_dashboard/services/dependency_injection.dart';
import 'package:var_dashboard/views/home_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  setupGetIt();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: onGenerateRoute,
      initialRoute: HomeView.routeName,
    );
  }
}
