import 'package:flutter/material.dart';
import 'package:sdgproject/pages/login/login.dart';
import 'package:sdgproject/pages/login/signup.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({super.key});

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(12, 0, 12, 65),
        child: Column(mainAxisAlignment: MainAxisAlignment.end, children: [
          const SizedBox(height: 80),
          const Text(
            'welcome to',
            style: TextStyle(fontSize: 28.0, fontWeight: FontWeight.w500),
          ),
          const Text(
            'atmosphere',
            style: TextStyle(fontSize: 32.0, fontWeight: FontWeight.bold),
          ),
          // SizedBox(
          //   height: 30,
          // ),
          // Text(
          //   'Your personal sustainability guide.',
          //   style: TextStyle(fontSize: 16.0),
          // ),
          const SizedBox(
            height: 75,
          ),
          Image.asset('assets/environment2.png'),
          const Spacer(),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                  minimumSize: const Size.fromHeight(50),
                  primary: const Color(0xAA00BFA6),
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20)))
                  // padding: const EdgeInsets.fromLTRB(15, 0, 15, 32)
                  ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Login()),
                );
              },
              child: const Text(
                'Login',
                style: TextStyle(color: Colors.white),
              )),
          const SizedBox(
            height: 10,
          ),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                  minimumSize: const Size.fromHeight(50),
                  backgroundColor: const Color(0xAA00BFA6),
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20)))
                  // padding: const EdgeInsets.fromLTRB(15, 0, 15, 32)
                  ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Signup()),
                );
              },
              child: const Text(
                'Sign Up',
                style: TextStyle(color: Colors.white),
              )),
        ]),
      ),
    ));
  }
}
