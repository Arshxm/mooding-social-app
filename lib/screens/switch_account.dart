import 'dart:ui';

import 'package:flutter/material.dart';

import 'main_screen.dart';

class SwitchScreen extends StatelessWidget {
  const SwitchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff1C1F2E),
      body: Column(
        children: [
          Expanded(
            child: Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image:
                            AssetImage('images/switch_account_background.png'),
                        fit: BoxFit.cover),
                  ),
                ),
                Positioned(
                  top: 270,
                  child: ClipRRect(
                    child: BackdropFilter(
                      filter: ImageFilter.blur(
                        sigmaX: 5.0,
                        sigmaY: 5.0,
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                              colors: [
                                Color.fromRGBO(
                                  255,
                                  255,
                                  255,
                                  0.5,
                                ),
                                Color.fromRGBO(
                                  255,
                                  255,
                                  255,
                                  0.2,
                                ),
                              ],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight),
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(
                            15,
                          ),
                        ),
                        width: 352,
                        height: 340,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              height: 32,
                            ),
                            ClipRRect(
                              borderRadius: BorderRadius.circular(
                                20,
                              ),
                              child: Image(
                                width: 100,
                                height: 100,
                                image: AssetImage('images/profile.png'),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                'Arsham',
                                style: Theme.of(context).textTheme.headline4,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: SizedBox(
                                height: 46,
                                width: 129,
                                child: ElevatedButton(
                                  style: Theme.of(context)
                                      .elevatedButtonTheme
                                      .style,
                                  onPressed: () {
                                    Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => MainScreen(),
                                ),
                              );
                                  },
                                  child: Text('Confirm'),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 30),
                              child: Text(
                                'switch account',
                                style: Theme.of(context).textTheme.headline4,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 63, top: 132),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Don't have an account ? /",
                  style: TextStyle(
                      fontFamily: 'GB', color: Colors.grey[700], fontSize: 20),
                ),
                SizedBox(
                  width: 5,
                ),
                Text("Sign Up", style: Theme.of(context).textTheme.headline4)
              ],
            ),
          )
        ],
      ),
    );
  }
}
