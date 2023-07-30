import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:najot_shop/provider/tab_box_provider.dart';
import 'package:provider/provider.dart';

import 'data/firebase/auth_service.dart';
import 'data/firebase/category_service.dart';
import 'data/firebase/profile_service.dart';
import 'provider/auth_provider.dart';
import 'provider/category_provider.dart';
import 'provider/profile_provider.dart';
import 'splash/splash_screen.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => AuthProvider(firebaseServices: AuthService()),
          lazy: true,
        ),
        ChangeNotifierProvider(
          create: (context) =>
              ProfileProvider(profileService: ProfileService()),
          lazy: true,
        ),
        ChangeNotifierProvider(
          create: (context) =>
              CategoryProvider(categoryService: CategoryService()),
          lazy: true,
        ),
        ChangeNotifierProvider(
          create: (context) =>
              TabBoxProvider(),
          lazy: true,
        ),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
