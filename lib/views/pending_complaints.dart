import 'package:complaint_management_system/layout/bottom_navigation.dart';
import 'package:complaint_management_system/your-complaints/complaint_card.dart';
import 'package:flutter/material.dart';

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
                const Text(
                  "PENDING COMPLANITS",
                  style: TextStyle(
                      color: Colors.orange,
                      fontSize: 25,
                      fontWeight: FontWeight.bold),
                ),
                const ComplaintCard(
                  phone: "3124342332324",
                ),
                const ComplaintCard(
                  phone: "3124342332324",
                ),
                const ComplaintCard(
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
