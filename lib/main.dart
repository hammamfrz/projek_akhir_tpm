import 'package:flutter/material.dart';
import 'login_page.dart';
import 'profile_page.dart';
import 'testimonial_page.dart';
import 'money_conversion.dart';
import 'time_conversion.dart';
import 'movies_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: const LoginPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({super.key});

  @override
  _BottomNavigationState createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[ProfilePage(), TestiPage(), MoviesPage(), MoneyConversion(), TimeConversion()];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
            backgroundColor: Color.fromARGB(255, 255, 44, 44)
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.mail),
            label: 'Testimonial',
            backgroundColor: Color.fromARGB(255, 255, 44, 44)
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.movie),
            label: 'Movies',
            backgroundColor: Color.fromARGB(255, 255, 44, 44)
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.money),
            label: 'Money',
            backgroundColor: Color.fromARGB(255, 255, 44, 44)
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.watch),
            label: 'Time',
            backgroundColor: Color.fromARGB(255, 255, 44, 44)
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.black,
        onTap: _onItemTapped,
      ),
    );
  }
}
