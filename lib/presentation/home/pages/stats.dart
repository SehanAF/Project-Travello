// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:myapp/data/sources/data/data_stats.dart';
import 'package:myapp/presentation/home/pages/chart.dart';

class StatScreen extends StatelessWidget {
  const StatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeader(),
            const SizedBox(height: 20),
            _buildChart(context),
            const SizedBox(height: 20),
            _buildInformation(),
            const SizedBox(height: 20),
            _buildListView(),
          ],
        ),
      ),
    );
  }

  Widget _buildListView() {
    return Expanded(
      child: ListView.builder(
        itemCount: transactionDataStats.length,
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
                      transactionDataStats[i]['name'],
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

  Widget _buildIconContainer(int i) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            color: transactionDataStats[i]['color'],
            shape: BoxShape.circle,
          ),
        ),
        transactionDataStats[i]['icon'],
      ],
    );
  }

  Widget _buildTransactionDetails(int i) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          transactionDataStats[i]['totalAmount'],
          style: const TextStyle(fontSize: 16, color: Colors.black),
        ),
      ],
    );
  }

  Widget _buildInformation() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          "Sat, 20 March 2021",
          style: TextStyle(color: Colors.black, fontSize: 16),
        ),
        GestureDetector(
          onTap: () {},
          child: const Text(
            "-\$500.00",
            style: TextStyle(
                fontWeight: FontWeight.w400, fontSize: 14, color: Colors.grey),
          ),
        ),
      ],
    );
  }

  Widget _buildChart(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(12)),
        child: const Padding(
          padding: EdgeInsets.fromLTRB(12, 20, 12, 12),
          child: MyChart(),
        ));
  }

  Widget _buildHeader() {
    return Text(
      'Transactions',
      style: TextStyle(
          fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
    );
  }
}
