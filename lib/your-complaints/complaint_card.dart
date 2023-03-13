import 'package:flutter/material.dart';

class ComplaintCard extends StatelessWidget {
  const ComplaintCard({
    Key? key,
    String? this.phone,
  }) : super(key: key);
  final phone;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 30, right: 5, left: 5),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 5,
            offset: const Offset(0, 2), // changes position of shadow
          ),
        ],
        border: Border.all(color: Colors.grey[200]!),
        borderRadius: BorderRadius.circular(10),
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            flex: 4,
                            child: Text(
                              "Kankaria Lakefront - Level of Housekeeping – Cleanliness Is Not Up To The Mark - KLF",
                              softWrap: true,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 20, left: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            flex: 4,
                            child: Text(
                              "Kankaria Lakefront - Level of Housekeeping – Cleanliness Is Not Up To The Mark - KLF",
                              softWrap: true,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Table(
                        border: TableBorder.all(
                            color: Colors.grey[300]!,
                            width: 1.5,
                            borderRadius: BorderRadius.circular(10)),
                        children: [
                          TableRow(children: [
                            Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text(
                                "Ticket No.",
                                style: TextStyle(fontSize: 15.0),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text(
                                "vyKsH6qMHKeOWY1JJsqF",
                                style: TextStyle(fontSize: 15.0),
                              ),
                            ),
                          ]),
                          TableRow(children: [
                            Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text(
                                "Department",
                                style: TextStyle(fontSize: 15.0),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text(
                                "Kankaria Lakefront",
                                style: TextStyle(fontSize: 15.0),
                              ),
                            ),
                          ]),
                          TableRow(children: [
                            Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text(
                                "Ward",
                                style: TextStyle(fontSize: 15.0),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text(
                                "karnavati",
                                style: TextStyle(fontSize: 15.0),
                              ),
                            ),
                          ]),
                          TableRow(children: [
                            Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text(
                                "Date",
                                style: TextStyle(fontSize: 15.0),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text(
                                "Mon Feb 13 2023",
                                style: TextStyle(fontSize: 15.0),
                              ),
                            ),
                          ]),
                          TableRow(children: [
                            Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text(
                                "Provided Name",
                                style: TextStyle(fontSize: 15.0),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text(
                                "Jaydeep Sharma",
                                style: TextStyle(fontSize: 15.0),
                              ),
                            ),
                          ]),
                          TableRow(children: [
                            Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text(
                                "Provided Phone",
                                style: TextStyle(fontSize: 15.0),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text(
                                "$phone",
                                style: TextStyle(fontSize: 15.0),
                              ),
                            ),
                          ]),
                          TableRow(children: [
                            Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text(
                                "Provided Email ",
                                style: TextStyle(fontSize: 15.0),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text(
                                "whywhathowblog1@gmail.com",
                                style: TextStyle(fontSize: 15.0),
                              ),
                            ),
                          ]),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 20),
                      child: ElevatedButton(
                        onPressed: () => {},
                        child: Text("CANCEL"),
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 30, vertical: 15),
                          primary: Colors.red,
                          onPrimary: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
