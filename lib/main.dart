import 'package:flutter/material.dart';
import 'package:instagram_clone/screens/activity_screen.dart';
import 'package:instagram_clone/screens/add_screen.dart';
import 'package:instagram_clone/screens/home_screen.dart';
import 'package:instagram_clone/screens/main_screen.dart';
import 'package:instagram_clone/screens/search_screen.dart';
import 'package:instagram_clone/screens/share_bottomsheet.dart';
import 'package:instagram_clone/screens/user_profile_screen.dart';
import 'screens/login_screen.dart';
import 'package:instagram_clone/screens/switch_account.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          textTheme: TextTheme(
            headline4:
                TextStyle(fontFamily: 'GB', fontSize: 16, color: Colors.white),
          ),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xffF35383),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                textStyle: TextStyle(fontFamily: 'GB', fontSize: 16)),
          ),
        ),
        home: SplashScreen());
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Future<void> delayedFun() async {
      await Future.delayed(Duration(seconds: 5));
      Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => LoginScreen()),
      );
    }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    delayedFun();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          repeat: ImageRepeat.repeat,
          image: AssetImage('images/pattern.png'),
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: SizedBox(
            width: double.infinity,
            child: Stack(
              alignment: AlignmentDirectional.bottomCenter,
              children: [
                Center(
                  child: Container(
                    width: 155,
                    height: 77,
                    child: Image(
                      image: AssetImage('images/logo_splash.png'),
                      width: 200,
                    ),
                  ),
                ),
                Positioned(
                  bottom: 32,
                  child: Column(
                    children: [
                      Text(
                        'from',
                        style: TextStyle(color: Colors.grey),
                      ),
                      Text(
                        'Arsham',
                        style: TextStyle(color: Colors.blueAccent),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
