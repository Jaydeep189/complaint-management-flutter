import 'dart:io';
import 'package:complaint_management_system/layout/bottom_navigation.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:developer';
import 'package:get/get.dart';
import '../util/dropdown_search.dart';

class NewComplaint extends StatefulWidget {
  const NewComplaint({Key? key}) : super(key: key);

  @override
  State<NewComplaint> createState() => _NewComplaintState();
}

class _NewComplaintState extends State<NewComplaint> {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  CollectionReference problem =
      FirebaseFirestore.instance.collection('Problems');
  CollectionReference ward = FirebaseFirestore.instance.collection('Ward');

  final List<String> items = [
    'Item1',
    'Item2',
    'Item3',
    'Item4',
    'Item5',
    'Item6',
    'Item7',
    'Item8',
  ];
  String problemid = '';
  String wardid = '';
  String departmentid = '';
  String area = '';
  String nameid = '';
  String description = '';
  String email = '';
  String address = '';
  String contactPhone = '';
  String contactName = '';
  String tenantNo = '';
  String imageUrl = '';

  void FilePicking() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    if (result != null) {
      File file = File(result.files.single.path!);
      print(file);
    } else {
      // User canceled the picker
    }
  }

  void SubmitForm() {
    print({
      problemid,
      wardid,
      departmentid,
      area,
      nameid,
      description,
      email,
      address,
      contactPhone,
      contactName,
      tenantNo,
      imageUrl
    });
  }

  String? selectedValue;
  List problems = [];
  List wardData = [];

  Future<void> getProblems() async {
    await problem.get().then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        setState(() {
          problems.add(doc.data());
        });
      });
    });
  }

  Future<void> getWard() async {
    await ward.get().then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        setState(() {
          wardData.add(doc.data());
        });
      });
    });
  }

  @override
  void initState() {
    super.initState();
    getProblems();
    getWard();
  }

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
            reverse: true,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: Text(
                    "NEW COMPLANITS",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 25,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                SingleChildScrollView(
                  reverse: true,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 20, bottom: 20, right: 10, left: 10),
                        child: Form(
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.only(top: 4, bottom: 4),
                                  child: DropDownSearch(
                                    items: problems
                                        .map((e) => e['statement'].toString())
                                        .toList(),
                                    changeFunction: (value) => () {
                                      print(value);
                                      FirebaseFirestore.instance
                                          .collection('Problem')
                                          .where('statement', isEqualTo: value)
                                          .get()
                                          .then((value) {
                                        value.docs.forEach((element) {
                                          element.data();
                                          setState(() {
                                            dynamic data = element.data();
                                            setState(() {
                                              problemid = data['id'];
                                              departmentid = data['department'];
                                            });
                                            print(problemid);
                                            print(departmentid);
                                          });
                                        });
                                      });
                                    },
                                    lableText: "Select A Problem",
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(top: 4, bottom: 4),
                                  child: DropDownSearch(
                                    items: wardData
                                        .map((e) => e['name'].toString())
                                        .toList(),
                                    lableText: "Select A Ward",
                                    changeFunction: (value) => () {
                                      FirebaseFirestore.instance
                                          .collection('Ward')
                                          .where("name", isEqualTo: value)
                                          .get()
                                          .then(
                                              (value) => log(value.toString()));
                                    },
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(top: 4, bottom: 4),
                                  child: TextField(
                                    enabled: false,
                                    onChanged: (value) => setState(() {
                                      departmentid = value;
                                    }),
                                    controller: departmentid == ''
                                        ? null
                                        : TextEditingController(
                                            text: departmentid),
                                    decoration: const InputDecoration(
                                      labelText: 'Department',
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(top: 4, bottom: 4),
                                  child: DropDownSearch(
                                    items: wardData
                                        .map((e) => e['name'].toString())
                                        .toList(),
                                    lableText: "Select A Area",
                                    changeFunction: (value) => setState(() {
                                      area = value;
                                    }),
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(top: 4, bottom: 4),
                                  child: TextField(
                                    maxLines: 4,
                                    keyboardType: TextInputType.multiline,
                                    onChanged: (value) => setState(() {
                                      description = value;
                                    }),
                                    decoration: const InputDecoration(
                                      labelText: 'Description',
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(top: 4, bottom: 4),
                                  child: TextField(
                                    onChanged: (value) => setState(() {
                                      nameid = value;
                                    }),
                                    decoration: const InputDecoration(
                                      labelText: 'Name',
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(top: 4, bottom: 4),
                                  child: TextField(
                                    keyboardType: TextInputType.emailAddress,
                                    onChanged: (value) => setState(() {
                                      email = value;
                                    }),
                                    decoration: const InputDecoration(
                                      labelText: 'Email',
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(top: 4, bottom: 4),
                                  child: TextField(
                                    maxLines: 4,
                                    onChanged: (value) => setState(() {
                                      address = value;
                                    }),
                                    keyboardType: TextInputType.multiline,
                                    decoration: const InputDecoration(
                                      labelText: 'Residential Address',
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(top: 4, bottom: 4),
                                  child: TextField(
                                    onChanged: (value) => setState(() {
                                      contactPhone = value;
                                    }),
                                    decoration: const InputDecoration(
                                      labelText: 'Contact Person Name',
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(top: 4, bottom: 4),
                                  child: TextField(
                                    keyboardType: TextInputType.phone,
                                    onChanged: (value) => setState(() {
                                      contactName = value;
                                    }),
                                    decoration: const InputDecoration(
                                      labelText: 'Contact Person Number',
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(top: 4, bottom: 4),
                                  child: TextField(
                                    onChanged: (value) => setState(() {
                                      tenantNo = value;
                                    }),
                                    keyboardType: TextInputType.number,
                                    decoration: const InputDecoration(
                                      labelText: 'Tenent Number',
                                    ),
                                  ),
                                ),
                                Padding(
                                    padding: const EdgeInsets.only(
                                        top: 20, bottom: 20),
                                    child: Align(
                                      alignment: Alignment.centerLeft,
                                      child: OutlinedButton(
                                        onPressed: FilePicking,
                                        child: const Text("Upload Image"),
                                        style: OutlinedButton.styleFrom(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 50, vertical: 15),
                                          primary: Colors.blue,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                          ),
                                        ),
                                      ),
                                    )),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(top: 4, bottom: 4),
                                  child: ElevatedButton(
                                    onPressed: SubmitForm,
                                    child: Text("Submit Complaint"),
                                    style: ElevatedButton.styleFrom(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 100, vertical: 15),
                                      primary: Colors.green,
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
