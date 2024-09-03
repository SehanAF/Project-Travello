// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myapp/data/sources/data/data_list.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey.shade200,
        bottomNavigationBar: _buildBottomNavBar(),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: _buildFloatingActionButton(),
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
            child: Column(
              children: [
                _buildHeader(context),
                SizedBox(
                  height: 20,
                ),
                _buildInformationBar(context),
                SizedBox(
                  height: 20,
                ),
                _buildNavTransaction(),
                SizedBox(
                  height: 20,
                ),
                _buildListView(),
              ],
            ),
          ),
        ));
  }

  Widget _buildListView() {
    return Expanded(
      child: ListView.builder(
        itemCount: transactionData.length,
        itemBuilder: (context, i) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 16),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  children: [
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                            color: transactionData[i]['color'],
                            shape: BoxShape.circle,
                          ),
                        ),
                        transactionData[i]['icon '],
                        // Icon(
                        //   Icons.food_bank,
                        //   size: 26,
                        // )
                      ],
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      transactionData[i]['name'],
                      style: TextStyle(fontSize: 16, color: Colors.black),
                    ),
                    Spacer(),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          transactionData[i]['totalAmount'],
                          style: TextStyle(fontSize: 16, color: Colors.black),
                        ),
                        Text(
                          transactionData[i]['date'],
                          style: TextStyle(color: Colors.grey),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildNavTransaction() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Transaction",
          style: TextStyle(
              fontWeight: FontWeight.bold, color: Colors.black, fontSize: 16),
        ),
        GestureDetector(
          onTap: () {},
          child: Text(
            "View All",
            style: TextStyle(
                fontWeight: FontWeight.w400, fontSize: 14, color: Colors.grey),
          ),
        )
      ],
    );
  }

  Widget _buildInformationBar(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.width / 2,
      decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFF9C3FE4), // Warna ungu
              Color(0xFFC65647), // Warna merah
            ],
            begin: Alignment.topLeft, // Awal gradasi dari kiri atas
            end: Alignment.bottomRight, // Akhir gradasi ke kanan bawah
          ),
          borderRadius: BorderRadius.circular(25),
          boxShadow: [
            BoxShadow(
                blurRadius: 2,
                color: const Color.fromARGB(255, 201, 201, 201),
                offset: Offset(5, 5))
          ]),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(children: [
          Text("Total Balance"),
          SizedBox(
            height: 10,
          ),
          Text(
            "\$ 48000.00",
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            children: [
              Container(
                width: 20,
                height: 20,
                decoration: BoxDecoration(
                    shape: BoxShape.circle, color: Colors.white30),
                child: Center(
                  child: Icon(
                    CupertinoIcons.arrow_down,
                    size: 12,
                  ),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [Text("Income"), Text("\$ 2.500.000")],
              ),
              Spacer(),
              Container(
                width: 20,
                height: 20,
                decoration: BoxDecoration(
                    shape: BoxShape.circle, color: Colors.white30),
                child: Center(
                  child: Icon(
                    CupertinoIcons.arrow_up,
                    size: 12,
                    color: Colors.red,
                  ),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [Text("Expenses"), Text("\$ 500.00")],
              ),
            ],
          )
        ]),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Row(
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            Container(
              height: 50,
              width: 50,
              decoration:
                  BoxDecoration(shape: BoxShape.circle, color: Colors.indigo),
            ),
            Icon(CupertinoIcons.person_fill)
          ],
        ),
        const SizedBox(
          width: 8,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Welcome",
              style: TextStyle(color: Colors.grey),
            ),
            Text("Sehan Alfarisi",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                )),
          ],
        ),
        const Spacer(),
        Container(
            height: 40,
            width: 40,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Theme.of(context).colorScheme.outline),
            child: IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.settings,
                  color: Colors.white,
                  size: 20,
                ))),
      ],
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
          )),
    );
  }

  Widget _buildBottomNavBar() {
    return ClipRRect(
      borderRadius: const BorderRadius.vertical(top: Radius.circular(30)),
      child: BottomNavigationBar(
        backgroundColor: Colors.grey,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              CupertinoIcons.graph_square_fill,
            ),
            label: 'Stats',
          ),
        ],
      ),
    );
  }
}
