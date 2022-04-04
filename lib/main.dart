
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:infoquario/firebase_options.dart';
import 'package:infoquario/services/auth_service.dart';
import 'package:infoquario/view/auth/auth_check.dart';

import 'package:provider/provider.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => AuthService()),
        ],
        child: MyApp(),
      )

  );
}




class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Infoquario',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: AuthCheck(),
    );
  }
}

