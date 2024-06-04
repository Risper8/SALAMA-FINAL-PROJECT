import 'package:flutter/material.dart'; //provides widgets implementing the Material Design structure
import 'home.dart';
import 'login.dart';
import 'splash.dart';
import 'signup.dart';
import 'notification.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await NotificationService.initializeNotification();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

   static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

 // This widget is the root of the application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(           //root widget for a Material Design application
      title: 'Salama App',
      theme: ThemeData(
         primarySwatch: Colors.blue,
      ),
      home: SplashScreen(),

      initialRoute: '/splash', // Set initial route to splash
      routes: {
        '/splash': (context) => SplashScreen(), // Define splash screen route
        '/login': (context) => const LoginPage(), // Define login page route
        '/home': (context) =>  const HomePage(), // Define home page route
        '/signup': (context) =>  const SignupPage(), // Define sign up page route
      },
    );
  }
}

