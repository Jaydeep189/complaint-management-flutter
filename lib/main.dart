import 'dart:developer';
import 'dart:ffi';

import 'package:complaint_management_system/global_state/state.dart';
import 'package:complaint_management_system/layout/bottom_navigation.dart';
import 'package:complaint_management_system/views/new_complaints.dart';
import 'package:complaint_management_system/views/pending_complaints.dart';
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

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String uid = '';
  final GetUid controller = Get.find<GetUid>();
  bool is_user = true;
  @override
  Widget build(BuildContext context) {
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user != null) {
        controller.storeUid(user.uid);
        // print(controller.uid.value);
        setState(() {
          is_user = true;
        });
      } else {
        is_user = false;
        print(user);
      }
    });
    final routes = [
      GetPage(name: '/pending-complaints', page: () => PendingComplaint()),
      GetPage(name: '/login', page: () => Login()),
      GetPage(name: '/new-complaints', page: () => NewComplaint()),
    ];
    return GetMaterialApp(
      title: 'AMC Complaint Management System',
      initialRoute: '/pending-complaints',
      getPages: routes,
    );
  }
}
