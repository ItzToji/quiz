import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MainScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    HomePage(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) => setState(() => _selectedIndex = index),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("University Portal")),
      drawer: Drawer(
        child: ListView(
          children: const [
            DrawerHeader(child: Text('Menu', style: TextStyle(fontSize: 24))),
            ListTile(title: Text('Dashboard')),
            ListTile(title: Text('Settings')),
            ListTile(title: Text('Logout')),
          ],
        ),
      ),
      body: Center(
        child: GestureDetector(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (_) => DetailPage()));
          },
          child: Hero(
            tag: 'course',
            child: Card(
              elevation: 4,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.network('https://foundr.com/wp-content/uploads/2021/09/Best-online-course-platforms.png', width: 300),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("Flutter Development", style: TextStyle(fontSize: 18)),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class DetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Course Details")),
      body: Center(
        child: Hero(
          tag: 'course',
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.network('https://www.classcentral.com/report/wp-content/uploads/2022/09/BCG-Flutter-Featured-Banner-768x384.png', width: 300),
              SizedBox(height: 16),
              Text("Flutter Development", style: TextStyle(fontSize: 24)),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text("Welcome to the Flutter course!"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Profile")),
      body: Center(child: Text("User Profile Info")),
    );
  }
}
  