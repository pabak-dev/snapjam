import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:snapjam/screens/Controller/Authentication.dart';
import 'package:snapjam/screens/Landingpage/LandingUtils.dart';
import 'package:snapjam/services/FirebaseOperation.dart';
import 'screens/Design/SplashScreen.dart';
import 'constants/ConstantColors.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    ConstantColors cc = ConstantColors();

    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => LandingUtils()),
          ChangeNotifierProvider(create: (_) => FirebaseOperation()),
          ChangeNotifierProvider(create: (_) => Authentication())
        ],
        child: GetMaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            fontFamily: 'Freeman',
            secondaryHeaderColor: cc.blueColor,
            canvasColor: Colors.transparent,
          ),
          home: SplashScreen(),
        )
    );

  }
}
