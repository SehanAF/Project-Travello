// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myapp/data/sources/data/data_list.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
        child: Column(
          children: [
            _buildHeader(context),
            const SizedBox(height: 20),
            _buildInformationBar(context),
            const SizedBox(height: 20),
            _buildNavTransaction(),
            const SizedBox(height: 20),
            _buildListView(),
          ],
        ),
      ),
    );
  }

  /// Membuat ListView untuk menampilkan data transaksi
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
                    _buildIconContainer(i),
                    const SizedBox(width: 10),
                    Text(
                      transactionData[i]['name'],
                      style: const TextStyle(fontSize: 16, color: Colors.black),
                    ),
                    const Spacer(),
                    _buildTransactionDetails(i),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  /// Membuat kontainer untuk ikon transaksi
  Widget _buildIconContainer(int i) {
    return Stack(
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
        transactionData[i]['icon'],
      ],
    );
  }

  /// Membuat detail transaksi (totalAmount dan date)
  Widget _buildTransactionDetails(int i) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          transactionData[i]['totalAmount'],
          style: const TextStyle(fontSize: 16, color: Colors.black),
        ),
        Text(
          transactionData[i]['date'],
          style: const TextStyle(color: Colors.grey),
        ),
      ],
    );
  }

  /// Membuat navigasi untuk transaksi
  Widget _buildNavTransaction() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          "Transaction",
          style: TextStyle(
              fontWeight: FontWeight.bold, color: Colors.black, fontSize: 16),
        ),
        GestureDetector(
          onTap: () {},
          child: const Text(
            "View All",
            style: TextStyle(
                fontWeight: FontWeight.w400, fontSize: 14, color: Colors.grey),
          ),
        ),
      ],
    );
  }

  /// Membuat bar informasi dengan gradient dan total balance
  Widget _buildInformationBar(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.width / 2,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [
            Color(0xFF9C3FE4), // Warna ungu
            Color(0xFFC65647), // Warna merah
          ],
          begin: Alignment.topLeft, // Awal gradasi dari kiri atas
          end: Alignment.bottomRight, // Akhir gradasi ke kanan bawah
        ),
        borderRadius: BorderRadius.circular(25),
        boxShadow: const [
          BoxShadow(
              blurRadius: 2,
              color: Color.fromARGB(255, 201, 201, 201),
              offset: Offset(5, 5))
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          children: [
            const Text(
              "Total Balance",
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text(
              "\$ 48000.00",
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            const SizedBox(height: 20),
            _buildIncomeExpenseRow(),
          ],
        ),
      ),
    );
  }

  /// Membuat row untuk menampilkan income dan expenses
  Widget _buildIncomeExpenseRow() {
    return Row(
      children: [
        _buildIncomeExpenseItem(
            CupertinoIcons.arrow_down, "Income", "\$ 2.500.000"),
        const Spacer(),
        _buildIncomeExpenseItem(
            CupertinoIcons.arrow_up, "Expenses", "\$ 500.00",
            isExpense: true),
      ],
    );
  }

  /// Membuat item untuk income/expense
  Widget _buildIncomeExpenseItem(IconData icon, String title, String amount,
      {bool isExpense = false}) {
    return Row(
      children: [
        Container(
          width: 20,
          height: 20,
          decoration:
              BoxDecoration(shape: BoxShape.circle, color: Colors.white30),
          child: Center(
            child: Icon(
              icon,
              size: 12,
              color: isExpense ? Colors.red : null,
            ),
          ),
        ),
        const SizedBox(width: 10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title,
                style: const TextStyle(
                    color: Colors.white, fontWeight: FontWeight.bold)),
            Text(amount,
                style: const TextStyle(
                    color: Colors.white, fontWeight: FontWeight.bold))
          ],
        ),
      ],
    );
  }

  /// Membuat header dengan profil pengguna dan tombol pengaturan
  Widget _buildHeader(BuildContext context) {
    return Row(
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            Container(
              height: 50,
              width: 50,
              decoration: const BoxDecoration(
                  shape: BoxShape.circle, color: Colors.indigo),
            ),
            const Icon(CupertinoIcons.person_fill),
          ],
        ),
        const SizedBox(width: 8),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              "Welcome",
              style: TextStyle(color: Colors.grey),
            ),
            Text(
              "Sehan Alfarisi",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
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
            icon: const Icon(
              Icons.settings,
              color: Colors.white,
              size: 20,
            ),
          ),
        ),
      ],
    );
  }
}
