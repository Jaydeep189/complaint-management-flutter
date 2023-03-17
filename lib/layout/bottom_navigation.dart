import 'package:complaint_management_system/auth/login.dart';
import 'package:complaint_management_system/views/new_complaints.dart';
import 'package:complaint_management_system/views/pending_complaints.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class BottomNavigation extends StatelessWidget {
  const BottomNavigation({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    void _signOut() async {
      await FirebaseAuth.instance.signOut();
      Get.to(Login());
    }

    return BottomAppBar(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            MaterialButton(
              onPressed: () => Get.to(() => PendingComplaint()),
              child: Icon(Icons.home, size: 30),
            ),
            MaterialButton(
              onPressed: () => Get.to(() => NewComplaint()),
              child: Icon(Icons.search, size: 30),
            ),
            Icon(Icons.add, size: 30),
            Icon(Icons.favorite, size: 30),
            // button in flutter
            MaterialButton(
                onPressed: _signOut, child: Icon(Icons.logout, size: 30))
          ],
        ),
      ),
    );
  }
}
