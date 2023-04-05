// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unnecessary_null_comparison, sized_box_for_whitespace

import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});
  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int tabIndex = 0;
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  PersistentBottomSheetController? _controller;

  void openEndDrawer() {
    scaffoldKey.currentState?.openEndDrawer();
  }

  void toggleBottomSheet() {
    if (_controller == null) {
      _controller =
          scaffoldKey.currentState!.showBottomSheet((context) => Container(
              padding: EdgeInsets.all(20),
              height: 180,
              color: Colors.white,
              child: Column(
                children: [
                  ListTile(
                    title: Text('Price', style: TextStyle(fontSize: 16)),
                    leading: Icon(Icons.credit_card),
                    trailing: Text('\$200', style: TextStyle(fontSize: 16)),
                  ),
                  SizedBox(height: 20),
                  Center(
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.zero),
                          backgroundColor: Colors.grey,
                          padding: EdgeInsets.fromLTRB(20, 8, 20, 8)),
                      child: Text(
                        'Pay',
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                    ),
                  )
                ],
              )));
    } else {
      _controller?.close();
      _controller = null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Colors.blue[800],
        title: const Text('Module 5', style: TextStyle(color: Colors.white)),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.person, color: Colors.white),
            onPressed: openEndDrawer,
          )
        ],
      ),
      drawer: Drawer(
        backgroundColor: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                DrawerHeader(
                  child: CircleAvatar(
                    radius: 48,
                    backgroundColor: Colors.blue[800],
                    backgroundImage: NetworkImage('https://picsum.photos/1200'),
                  ),
                ),
                ListTile(
                  title: Text('Profile'),
                  leading: Icon(Icons.person),
                  trailing: Icon(Icons.arrow_forward),
                ),
                ListTile(
                  title: Text('Images'),
                  leading: Icon(Icons.image),
                  trailing: Icon(Icons.arrow_forward),
                ),
                ListTile(
                  title: Text('Files'),
                  leading: Icon(Icons.folder),
                  trailing: Icon(Icons.arrow_forward),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 36),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.zero),
                        backgroundColor: Colors.grey,
                        padding: EdgeInsets.fromLTRB(20, 8, 20, 8)),
                    child: Text(
                      'Log out',
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.zero),
                        backgroundColor: Colors.grey,
                        padding: EdgeInsets.fromLTRB(20, 8, 20, 8)),
                    child: Text(
                      'Sign up',
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
      endDrawer: Drawer(
        backgroundColor: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 48,
              backgroundColor: Colors.blue[800],
              backgroundImage: const NetworkImage('https://picsum.photos/1200'),
            ),
            const SizedBox(height: 10),
            const Text('John Doe')
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        elevation: 0,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Photo',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            label: 'Chat',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.album),
            label: 'Albums',
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: toggleBottomSheet,
        backgroundColor: Colors.blue[800],
        shape: CircleBorder(),
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}
