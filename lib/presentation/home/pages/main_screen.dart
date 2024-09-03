// ignore_for_file: prefer_const_constructors, unused_element, prefer_const_literals_to_create_immutables

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myapp/presentation/home/pages/home_screen.dart';
import 'package:myapp/presentation/home/pages/stats.dart';

class MainScreen extends StatefulWidget {
  MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;

  final widgetList = [
    HomePage(),
    StatScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      floatingActionButton: _buildFloatingActionButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: _buildBottomNavBar(),
      body: widgetList[_currentIndex], // Menggunakan widget sesuai index
    );
  }

  Widget _buildFloatingActionButton() {
    return FloatingActionButton(
      shape: CircleBorder(),
      onPressed: () {},
      child: Container(
        width: 60,
        height: 60,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient: LinearGradient(
            colors: [
              Color(0xFF9C3FE4), // Warna ungu
              Color(0xFFC65647), // Warna merah
            ],
            begin: Alignment.topLeft, // Awal gradasi dari kiri atas
            end: Alignment.bottomRight, // Akhir gradasi ke kanan bawah
          ),
        ),
        child: const Icon(
          Icons.add,
          size: 28,
        ),
      ),
    );
  }

  Widget _buildBottomNavBar() {
    return ClipRRect(
      borderRadius: const BorderRadius.vertical(top: Radius.circular(30)),
      child: BottomNavigationBar(
        currentIndex: _currentIndex, // Mengatur index saat ini
        onTap: (int index) {
          setState(() {
            _currentIndex = index;
          });
        },
        backgroundColor: Colors.white,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              CupertinoIcons.home,
              color: _currentIndex == 0
                  ? Colors.blue
                  : Colors.grey, // Warna berubah sesuai index
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              CupertinoIcons.graph_square_fill,
              color: _currentIndex == 1
                  ? Colors.blue
                  : Colors.grey, // Warna berubah sesuai index
            ),
            label: '',
          ),
        ],
      ),
    );
  }
}
