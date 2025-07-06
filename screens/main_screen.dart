
import 'package:flutter/material.dart';
import 'subscriptions_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _navIndex = 0;

  final List<Widget> _screens = [
    Center(child: Text("Home")),
    Center(child: Text("Shorts")),
    Center(child: Text("+")),
    const SubscriptionsScreen(),
    Center(child: Text("You")),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_navIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _navIndex,
        onTap: (index) {
          setState(() {
            _navIndex = index;
          });
        },
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.red,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.play_arrow), label: "Shorts"),
          BottomNavigationBarItem(icon: Icon(Icons.add_circle_outline), label: "Post"),
          BottomNavigationBarItem(icon: Icon(Icons.subscriptions), label: "Subscriptions"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Account"),
        ],
      ),
    );
  }
}
