import "package:flutter/material.dart";
import "package:font_awesome_flutter/font_awesome_flutter.dart";

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: [
        BottomNavigationBarItem(
            icon: Icon(
              FontAwesomeIcons.route,
              size: 20,
            ),
            label: "Percorsi"),
        BottomNavigationBarItem(
            icon: Icon(
              FontAwesomeIcons.info,
              size: 20,
            ),
            label: "Info"),
      ],
      fixedColor: Colors.deepPurple[200],
      onTap: (int idx) {
        switch (idx) {
          case 0:
            Navigator.pushNamed(context, "/topics");
            break;
          case 1:
            Navigator.pushNamed(context, "/about");
            break;
        }
      },
    );
  }
}
