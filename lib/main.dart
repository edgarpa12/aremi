import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:aremi/view/clases.dart';
import 'package:aremi/view/perfil.dart';
import 'package:aremi/view/settings.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    print("build--MaterialApp------");
    return MaterialApp(
      initialRoute: "/",
      routes: {
        "/": (context) => MyHomePage(),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  int _selectedTab = 0;
    final _pageOptions = [
        Clases(),
        User(),
        MenuOptionsScreen()
    ];
    @override
    Widget build(BuildContext context) {
        return MaterialApp(
            theme: ThemeData(
            primarySwatch: Colors.grey
            ),
        debugShowCheckedModeBanner: false,
        home: Scaffold(
        appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          "Balneario Aremi".toUpperCase(),
          style: TextStyle(color: Colors.black),
        ),
        elevation: 0,
      ),
        body: _pageOptions[_selectedTab],
        bottomNavigationBar: BottomNavigationBar(
            currentIndex: _selectedTab,
            onTap: (int index) {
                setState(() {
                    _selectedTab = index;
                });
            },
            selectedItemColor: Colors.amber,
            items: [
                BottomNavigationBarItem(
                    icon: Icon(
                        Icons.calendar_today),
                    title: Text("Clases"),
                ),
                BottomNavigationBarItem(
                    icon: Icon(Icons.person_outline),
                    title: Text("Perfil"),
                ),
                BottomNavigationBarItem(
                    icon: Icon(Icons.settings),
                    title: Text("Configuracion"),
                ),
            ],
        ),
    ),
    );
  }
}
