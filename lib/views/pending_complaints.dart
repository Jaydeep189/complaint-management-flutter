import 'dart:math';

import 'package:complaint_management_system/layout/bottom_navigation.dart';
import 'package:complaint_management_system/your-complaints/complaint_card.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class PendingComplaint extends StatefulWidget {
  const PendingComplaint({Key? key}) : super(key: key);
  @override
  State<PendingComplaint> createState() => _PendingComplaintState();
}

class _PendingComplaintState extends State<PendingComplaint> {
  Query pendingComplaints = FirebaseFirestore.instance
      .collection('Complaint-Registration')
      .where('status', isEqualTo: 'PENDING');

  @override
  void initState() {
    super.initState();
    getPendingComplaints();
  }

  Future<void> getPendingComplaints() async {
    await pendingComplaints.get().then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        print(doc.data());
        setState(() {
          pending_complaints.add(doc.data());
        });
      });
    });
  }

  List pending_complaints = [];
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
                const Text(
                  "PENDING COMPLANITS",
                  style: TextStyle(
                      color: Colors.orange,
                      fontSize: 25,
                      fontWeight: FontWeight.bold),
                ),
                SingleChildScrollView(
                  child: Column(
                    children: pending_complaints
                        .map((c) => ComplaintCard(
                              phone: c['phone'],
                              name: c['name'],
                              ticketNo: c['docId'],
                              ward: c['wardName'],
                              status: c['status'],
                              problem: c['problemName'],
                              description: c['desc'],
                              date: c['date'],
                              department: c['departmentName'],
                              email: c['email'],
                            ))
                        .toList(),
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
