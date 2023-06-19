import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:instagram_clone/screens/main_screen.dart';
import 'package:instagram_clone/screens/switch_account.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final FocusNode focusNode1 = FocusNode();
  final FocusNode focusNode2 = FocusNode();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    focusNode1.addListener(() {
      setState(() {});
    });
    focusNode2.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Color(0xff323A90), Color(0xffF968FC)],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Positioned(
                right: 0,
                left: 0,
                bottom: 0,
                top: 70,
                child: Column(
                  children: [
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('images/rocket.png'),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.black,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Column(
                children: [
                  Expanded(child: Container()),
                  Expanded(
                    child: Container(
                      height: 400,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(15),
                          topRight: Radius.circular(15),
                        ),
                        color: Color(0xff1C1F2E),
                      ),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 50,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Sign In to ",
                                style: Theme.of(context).textTheme.headline4,
                              ),
                              Image(
                                image: AssetImage('images/mood.png'),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 34,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 44),
                            child: TextField(
                              focusNode: focusNode1,
                              style: TextStyle(fontSize: 15, color: Colors.white),
                              decoration: InputDecoration(
                                labelText: 'Email',
                                labelStyle: TextStyle(
                                    fontFamily: 'GM',
                                    fontSize: 20,
                                    color: focusNode1.hasFocus
                                        ? Color(0xffF35383)
                                        : Colors.white),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  borderSide: BorderSide(
                                    color: Color(0xffF35383),
                                    width: 3,
                                  ),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  borderSide: BorderSide(
                                    color: Color(0xffC5C5C5),
                                    width: 3,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 34,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 44),
                            child: TextField(
                              focusNode: focusNode2,
                              style: TextStyle(fontSize: 15, color: Colors.white),
                              decoration: InputDecoration(
                                labelText: 'Password',
                                labelStyle: TextStyle(
                                    fontFamily: 'GM',
                                    fontSize: 20,
                                    color: focusNode2.hasFocus
                                        ? Color(0xffF35383)
                                        : Colors.white),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  borderSide: BorderSide(
                                    color: Color(0xffF35383),
                                    width: 3,
                                  ),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  borderSide: BorderSide(
                                    color: Color(0xffC5C5C5),
                                    width: 3,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 40,
                          ),
                          ElevatedButton(
                            onPressed: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => SwitchScreen(),
                                ),
                              );
                            },
                            child: Icon(
                              Icons.navigate_next,
                              size: 50,
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    focusNode1.dispose();
    focusNode2.dispose();
    super.dispose();
  }
}
