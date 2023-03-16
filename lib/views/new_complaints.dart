import 'dart:io';

import 'package:complaint_management_system/layout/bottom_navigation.dart';
import 'package:dropdown_search/dropdown_search.dart';
import '../layout/bottom_navigation.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import '../util/dropdown_search.dart';

class NewComplaint extends StatefulWidget {
  const NewComplaint({Key? key}) : super(key: key);

  @override
  State<NewComplaint> createState() => _NewComplaintState();
}

class _NewComplaintState extends State<NewComplaint> {
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
  String? selectedValue;
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
                const Text(
                  "NEW COMPLANITS",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 25,
                      fontWeight: FontWeight.bold),
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
                                    items: ["Item1", "Item2", "Item3", "Item4"],
                                    lableText: "Select A Problem",
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(top: 4, bottom: 4),
                                  child: DropDownSearch(
                                    items: ["Item1", "Item2", "Item3", "Item4"],
                                    lableText: "Select A Ward",
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(top: 4, bottom: 4),
                                  child: TextField(
                                    enabled: false,
                                    decoration: const InputDecoration(
                                      labelText: 'Department',
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(top: 4, bottom: 4),
                                  child: DropDownSearch(
                                    items: ["Item1", "Item2", "Item3", "Item4"],
                                    lableText: "Select A Area",
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(top: 4, bottom: 4),
                                  child: TextField(
                                    maxLines: 4,
                                    keyboardType: TextInputType.multiline,
                                    decoration: const InputDecoration(
                                      labelText: 'Description',
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(top: 4, bottom: 4),
                                  child: TextField(
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
                                    decoration: const InputDecoration(
                                      labelText: 'Contact Person Number',
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(top: 4, bottom: 4),
                                  child: TextField(
                                    keyboardType: TextInputType.number,
                                    decoration: const InputDecoration(
                                      labelText: 'Tenent Number',
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
