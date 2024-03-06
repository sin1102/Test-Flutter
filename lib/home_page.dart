import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:test/progress_bar.dart';
import 'package:test/weather.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int tab = 0;
  List<Widget> screen = [ProgressBar(), Weather()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screen[tab],
      bottomNavigationBar: Container(
        color: Color.fromARGB(255, 224, 224, 224),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 12.0),
          child: GNav(
              backgroundColor: Color.fromARGB(255, 224, 224, 224),
              tabBackgroundColor: Color.fromARGB(255, 206, 205, 205),
              padding: EdgeInsets.all(10),
              gap: 8,
              onTabChange: (value) {
                switch (value) {
                  case 0:
                    setState(() {
                      tab = value;
                    });
                    print(value);
                    break;
                  case 1:
                    setState(() {
                      tab = value;
                    });
                    print(value);
                    break;
                  default:
                }
              },
              tabs: const [
                GButton(
                  icon: Icons.bar_chart,
                  text: 'C1',
                ),
                GButton(
                  icon: Icons.cloud,
                  text: 'C2',
                ),
              ]),
        ),
      ),
    );
  }
}
