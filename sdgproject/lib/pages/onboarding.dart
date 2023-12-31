import 'package:flutter/material.dart';
import 'package:sdgproject/nav.dart';
import 'package:sdgproject/pages/home.dart';

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
          SizedBox(height: 80),
          Text(
            'welcome to',
            style: TextStyle(fontSize: 28.0, fontWeight: FontWeight.w500),
          ),
          Text(
            'atmosphere',
            style: TextStyle(fontSize: 32.0, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 75,
          ),
          // Text(
          //   'A place to keep your data safe.',
          //   style: TextStyle(fontSize: 16.0),
          // ),
          Image.asset('assets/environment2.png'),
          Spacer(),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                  minimumSize: const Size.fromHeight(50),
                  primary: Color(0xAA00BFA6),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20)))
                  // padding: const EdgeInsets.fromLTRB(15, 0, 15, 32)
                  ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Nav()),
                );
              },
              child: const Text(
                'Continue',
                style: TextStyle(color: Colors.white),
              )),
          SizedBox(
            height: 20,
          )
        ]),
      ),
    ));
  }
}
