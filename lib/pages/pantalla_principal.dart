import 'package:flutter/material.dart';
import 'package:flutter_application_1/widget/mas_populares_widget.dart';
import 'package:flutter_application_1/widget/lo_ultimo_widget.dart';
import 'package:flutter_application_1/widget/menu_widget.dart';

class PantallaPrincipal extends StatefulWidget {
  @override
  _PantallaPrincipalState createState() => _PantallaPrincipalState();
}

class _PantallaPrincipalState extends State<PantallaPrincipal> {
  int _currentIndex = 0;
  final List<Widget> _children = [
    MasPopularesWidget(),
    LoUltimo(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'The Movie DB',
        ),
      ),
      drawer: Menu(),
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTabTapped,
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(
            label: 'Más populares',
            icon: Icon(
              Icons.create_new_folder_sharp,
            ),
          ),
          BottomNavigationBarItem(
            label: 'Lo último',
            icon: Icon(
              Icons.folder_special,
            ),
          ),
        ],
      ),
      body: _children[_currentIndex],
    );
  }

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}
