import 'dart:developer';
import 'dart:ffi';

import 'package:complaint_management_system/global_state/state.dart';
import 'package:complaint_management_system/layout/bottom_navigation.dart';
import 'package:complaint_management_system/your-complaints/complaint_card.dart';
import 'package:complaint_management_system/auth/login.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'firebase_options.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  Get.put(GetUid());
  runApp(MyApp());
}

class PendingComplaint extends StatefulWidget {
  const PendingComplaint({Key? key}) : super(key: key);

  @override
  State<PendingComplaint> createState() => _PendingComplaintState();
}

class _PendingComplaintState extends State<PendingComplaint> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black),
        title: Row(mainAxisAlignment: MainAxisAlignment.start, children: const [
          Image(
            image: AssetImage('assets/amc.png'),
            height: 60,
          ),
          Text('AMC',
              style: TextStyle(
                  fontWeight: FontWeight.w900,
                  color: Colors.black,
                  fontSize: 30)),
        ]),
      ),
      drawer: Drawer(),
      bottomNavigationBar: BottomNavigation(),
      body: Container(
        child: Padding(
          padding: EdgeInsets.all(10),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Text(
                  "PENDING COMPLANITS",
                  style: TextStyle(
                      color: Colors.orange,
                      fontSize: 25,
                      fontWeight: FontWeight.bold),
                ),
                ComplaintCard(
                  phone: "3124342332324",
                ),
                ComplaintCard(
                  phone: "3124342332324",
                ),
                ComplaintCard(
                  phone: "3124342332324",
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextField(
                    onChanged: (text) {},
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Phone Number',
                    ),
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

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String uid = '';
  final GetUid controller = Get.find<GetUid>();
  @override
  Widget build(BuildContext context) {
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      setState(() {
        if (user != null) {
          controller.storeUid(user.uid);
        }
      });
    });
    final routes = [
      GetPage(name: '/pending-complaints', page: () => PendingComplaint()),
      GetPage(name: '/login', page: () => Login()),
    ];
    return GetMaterialApp(
      title: 'AMC Complaint Management System',
      initialRoute: '/login',
      getPages: routes,
    );
  }
}
