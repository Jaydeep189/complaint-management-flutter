import 'package:flutter/material.dart';

class BottomNavigation extends StatelessWidget {
  const BottomNavigation({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: const [
            Icon(
              Icons.home,
              size: 30,
            ),
            Icon(Icons.search, size: 30),
            Icon(Icons.add, size: 30),
            Icon(Icons.favorite, size: 30),
            Icon(Icons.person, size: 30),
          ],
        ),
      ),
    );
  }
}
