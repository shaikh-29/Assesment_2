import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gig_go_assesment/Screen/SignUpPage.dart';
import 'package:gig_go_assesment/repositery/gig_repository.dart';
import 'package:provider/provider.dart';
import 'Provider/booking_provider.dart';
import 'Provider/gig_provider.dart';
import 'Screen/LoginPage.dart';
import 'Screen/home_screen.dart';


Future<void> main() async {

  WidgetsFlutterBinding.ensureInitialized();
await Firebase.initializeApp(
    // options: DefaultFirebaseOptions.currentPlatform,
);
  runApp(const GigGoApp());
}

class GigGoApp extends StatelessWidget {
  const GigGoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => GigProvider(GigRepository())..loadGigs(),
        ),
        ChangeNotifierProvider(
          create: (_) => BookingProvider(),
        ),
      ],
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Gig-Go',
        theme: ThemeData(
          primarySwatch: Colors.indigo,
          scaffoldBackgroundColor: Colors.grey.shade100,
          appBarTheme: const AppBarTheme(
            backgroundColor: Colors.white,
            foregroundColor: Colors.black,
            elevation: 0,
          ),
          // cardTheme: CardTheme(
          //   shape: RoundedRectangleBorder(
          //     borderRadius: BorderRadius.circular(16),
          //   ),
          //   elevation: 3,
          // ),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.indigo,
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(14),
              ),
            ),
          ),
        ),
        home:  Loginpage(),
        routes: {
          '/login': (context)=> Loginpage(),
          '/signup': (context) => Signuppage(),
          'home': (context) => HomeScreen(),
        }
      ),
    );
  }
}