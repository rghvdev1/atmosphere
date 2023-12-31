import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(
          "Profile",
          style: TextStyle(
              fontWeight: FontWeight.bold, color: Colors.black, fontSize: 25.0),
        ),
        centerTitle: false,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () {},
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Positioned(
              top: 150.0, // (background container size) - (circle height / 2)
              child: Container(
                height: 150.0,
                width: 150.0,
                decoration: const BoxDecoration(
                    shape: BoxShape.circle, color: Colors.green),
              ),
            ),
            const SizedBox(height: 25),
            const Center(
              child: Text(
                "Raghav Sarin",
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.w600),
              ),
            ),
            const Text("Date Joined: 12/12/23"),
            const Text("Email Address: xyz123@gmail.com"),
            const SizedBox(
              height: 25,
            ),
            const Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: EdgeInsets.fromLTRB(15, 10, 8, 8),
                child: Text(
                  "Achievements",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 18.0,
                      fontWeight: FontWeight.w400),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
