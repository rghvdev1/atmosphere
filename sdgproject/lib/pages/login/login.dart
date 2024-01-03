import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:sdgproject/nav.dart';

FirebaseAuth auth = FirebaseAuth.instance;
const storage = FlutterSecureStorage();

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _emailLoginController = TextEditingController();
  final _passwordLoginController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
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
            children: [
              Text(
                'Welcome Back!',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28.0),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 8,
              ),
              Text('Login using your Email and Password.',
                  textAlign: TextAlign.center),
              Padding(
                padding: const EdgeInsets.only(top: 130.0),
                child: TextField(
                  controller: _emailLoginController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(25.0))),
                    prefixIcon: Icon(Icons.email),
                    hintText: 'Email',
                  ),
                ),
              ),
              SizedBox(height: 8),
              TextField(
                controller: _passwordLoginController,
                obscureText: true,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(25.0))),
                  prefixIcon: Icon(Icons.lock),
                  hintText: 'Password',
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 50, 20, 0),
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        minimumSize: const Size.fromHeight(50),
                        primary: Color(0xAA00BFA6),
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(28)))),
                    onPressed: signInWithEmail,
                    child: const Text(
                      'Sign In',
                      style: TextStyle(color: Colors.white),
                    )),
              ),
            ],
          ),
        )),
      ),
    );
  }

  Future signInWithEmail() async {
    try {
      UserCredential userCredential = await auth.signInWithEmailAndPassword(
          email: _emailLoginController.text,
          password: _passwordLoginController.text);

      await storage.write(key: 'email', value: _emailLoginController.text);
      await storage.write(
          key: 'password', value: _passwordLoginController.text);
      print('signed in ${userCredential.user!.uid}');
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  // WithFabButton(user1: userCredential.user!.uid),
                  Nav()));
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }
  }
}
