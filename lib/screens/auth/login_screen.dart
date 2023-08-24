import 'package:flutter/material.dart';
import 'package:todo_app/main.dart';
import 'package:todo_app/screens/home_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _isAnimate = false;
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 500), () {
      setState(() {
        _isAnimate = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    mq = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text("Welcome to TOdo's")),
        backgroundColor: Colors.cyan,
      ),
      body: Stack(
        children: [
          AnimatedPositioned(
            duration: const Duration(seconds: 1),
            top: mq.height * .15,
            right: _isAnimate ? mq.width * .25 : -mq.width * .5,
            width: mq.width * .5,
            child: Image.asset('assets/images/icon1.png'),
          ),
          AnimatedPositioned(
            duration: const Duration(seconds: 1),
            bottom: _isAnimate ? mq.height * .15 : -mq.height * .06,
            left: mq.width * .05,
            width: mq.width * .9,
            height: mq.height * .06,
            child: ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 223, 255, 187),
                  shape: const StadiumBorder(),
                  elevation: 1),
              onPressed: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (_) => const HomeScreen()));
              },
              icon: Image.asset(
                'assets/images/google.png',
                height: mq.height * .03,
              ),
              label: RichText(
                  text: const TextSpan(
                      style: TextStyle(color: Colors.black, fontSize: 16),
                      children: [
                    TextSpan(text: 'Log In with '),
                    TextSpan(
                        text: "Google",
                        style: TextStyle(fontWeight: FontWeight.w500)),
                  ])),
            ),
          ),
        ],
      ),
    );
  }
}
