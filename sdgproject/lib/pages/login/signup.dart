// ignore_for_file: use_build_context_synchronously, library_private_types_in_public_api, unused_local_variable

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sdgproject/nav.dart';
import 'login.dart';

FirebaseAuth auth = FirebaseAuth.instance;

final FirebaseFirestore _firestore = FirebaseFirestore.instance;
final CollectionReference _mainCollection = _firestore.collection('users');

class Signup extends StatefulWidget {
  const Signup({Key? key}) : super(key: key);

  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final _emailSignupController = TextEditingController();
  final _passwordSignupController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_rounded,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SafeArea(
        child: Center(
            child: Padding(
          padding: const EdgeInsets.fromLTRB(12, 0, 12, 0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              const Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text('Create Account',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 28.0)),
                  Text('Enter your email address.'),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 180.0),
                child: Column(
                  children: [
                    TextField(
                      controller: _emailSignupController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(25.0))),
                        prefixIcon: Icon(Icons.email),
                        hintText: 'Email',
                      ),
                    ),
                    const SizedBox(height: 8),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 50, 20, 0),
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              minimumSize: const Size.fromHeight(50),
                              primary: const Color(0xAA00BFA6),
                              shape: const RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(28)))),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Scaffold(
                                    extendBodyBehindAppBar: true,
                                    appBar: AppBar(
                                      leading: IconButton(
                                        icon: const Icon(
                                          Icons.arrow_back_ios_rounded,
                                          color: Colors.black,
                                        ),
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                      ),
                                      backgroundColor: Colors.white,
                                      elevation: 0,
                                    ),
                                    body: SafeArea(
                                      child: Center(
                                          child: Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            12, 0, 12, 30),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            const Text(
                                              'Create a Password',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 28.0),
                                              textAlign: TextAlign.center,
                                            ),
                                            const SizedBox(
                                              height: 15,
                                            ),
                                            const Text(
                                                'Try to use symbols, letters, and numbers to make it secure. Minimum character count is 8.',
                                                textAlign: TextAlign.center),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 120.0),
                                              child: TextField(
                                                controller:
                                                    _passwordSignupController,
                                                decoration:
                                                    const InputDecoration(
                                                  border: OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.all(
                                                              Radius.circular(
                                                                  25.0))),
                                                  prefixIcon: Icon(Icons.email),
                                                  hintText: 'Master Password',
                                                ),
                                              ),
                                            ),
                                            const SizedBox(height: 8),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.fromLTRB(
                                                      20, 50, 20, 50),
                                              child: ElevatedButton(
                                                  style: ElevatedButton.styleFrom(
                                                      minimumSize:
                                                          const Size.fromHeight(
                                                              50),
                                                      primary: const Color(
                                                          0xAA00BFA6),
                                                      shape: const RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius.all(
                                                                  Radius
                                                                      .circular(
                                                                          28)))),
                                                  onPressed: signUpWithEmail,
                                                  child: const Text(
                                                    'Sign Up',
                                                    style: TextStyle(
                                                        color: Colors.white),
                                                  )),
                                            ),
                                          ],
                                        ),
                                      )),
                                    ),
                                  ),
                                ));
                          },
                          child: const Text(
                            'Continue',
                            style: TextStyle(color: Colors.white),
                          )),
                    ),
                  ],
                ),
              ),
            ],
          ),
        )),
      ),
    );
  }

  Future signUpWithEmail() async {
    try {
      UserCredential userCredential = await auth.createUserWithEmailAndPassword(
          email: _emailSignupController.text,
          password: _passwordSignupController.text);

      await _mainCollection
          .doc(userCredential.user!.uid)
          .set({'email': '${userCredential.user!.email}'});

      await storage.write(key: 'email', value: _emailSignupController.text);
      print('User created: ${userCredential.user}');

      User? user = FirebaseAuth.instance.currentUser;

      // if (user != null && !user.emailVerified) {
      //   await user.sendEmailVerification();
      //   print('sent user verification email');
      // }

      // if (user != null && !user.emailVerified == true) {
      //   print('user is verified');
      // }

      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Nav()),
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }
}
