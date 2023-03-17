import 'dart:ffi';

import 'package:complaint_management_system/layout/bottom_navigation.dart';
import 'package:complaint_management_system/main.dart';
import 'package:complaint_management_system/views/pending_complaints.dart';
import 'package:complaint_management_system/your-complaints/complaint_card.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import '../firebase_options.dart';
import 'package:flutter/material.dart';

import '../global_state/state.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool isOTP = false;

  String verify = "";
  bool _isloding = false;

  @override
  Widget build(BuildContext context) {
    // dart simple function code
    final GetUid controller = Get.find<GetUid>();
    String phone = '';
    String smsCode = '';
    PhoneLogin(number) async {
      print(number);
      setState(() {
        _isloding = true;
      });
      await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: '+91$number',
        verificationCompleted: (PhoneAuthCredential credential) {},
        verificationFailed: (FirebaseAuthException e) {},
        codeSent: (String verificationId, int? resendToken) async {
          setState(() {
            verify = verificationId;
          });
          setState(() {
            isOTP = true;
          });
        },
        codeAutoRetrievalTimeout: (String verificationId) {},
      );
      setState(() {
        _isloding = false;
      });
    }

    VerifyOTP(otp) async {
      // Create a PhoneAuthCredential with the code
      PhoneAuthCredential credential =
          PhoneAuthProvider.credential(verificationId: verify, smsCode: otp);
      print(credential.token);
      await FirebaseAuth.instance.signInWithCredential(credential);
      controller.storeUid(FirebaseAuth.instance.currentUser!.uid);
      Get.to(() => PendingComplaint());
      // Sign the user in (or link) with the credential
    }

    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Visibility(
                visible: !isOTP,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image(
                      image: AssetImage('assets/amc.png'),
                      height: 200,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 10, bottom: 10, right: 30, left: 30),
                      child: TextField(
                        keyboardType: TextInputType.phone,
                        onChanged: (text) {
                          phone = text;
                        },
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Phone Number',
                        ),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        PhoneLogin(phone);
                      },
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.black),
                        padding: MaterialStateProperty.all(EdgeInsets.all(10)),
                      ),
                      child: _isloding
                          ? CircularProgressIndicator(
                              color: Colors.white,
                            )
                          : const Text(
                              'Login',
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                    ),
                  ],
                ),
              ),
              Visibility(
                visible: isOTP,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image(
                      image: AssetImage('assets/amc.png'),
                      height: 200,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 10, bottom: 10, right: 30, left: 30),
                      child: PinCodeTextField(
                        appContext: context,
                        length: 6,
                        onChanged: (text) {
                          smsCode = text;
                        },
                        keyboardType: TextInputType.number,
                        pinTheme: PinTheme(
                          shape: PinCodeFieldShape.box,
                          borderRadius: BorderRadius.circular(5),
                          fieldHeight: 50,
                          fieldWidth: 40,
                          activeColor: Colors.green,
                          activeFillColor: Colors.white,
                          inactiveColor: Colors.black,
                        ),
                        animationType: AnimationType.fade,
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        VerifyOTP(smsCode);
                      },
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.black),
                          padding:
                              MaterialStateProperty.all(EdgeInsets.all(10))),
                      child: _isloding
                          ? CircularProgressIndicator(color: Colors.white)
                          : const Text('CONFIRM OTP'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
