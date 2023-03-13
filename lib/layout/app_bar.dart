import 'package:flutter/material.dart';

class TopBar extends StatelessWidget {
  const TopBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
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
    );
  }
}
