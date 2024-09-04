// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';

class AddExpense extends StatefulWidget {
  const AddExpense({super.key});

  @override
  State<AddExpense> createState() => _AddExpenseState();
}

class _AddExpenseState extends State<AddExpense> {
  final TextEditingController _expenseController = TextEditingController();
  final TextEditingController _categoryController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();
  DateTime selectedDate = DateTime.now();

  List<String> myCategoriesIcons = [
    "entertainment",
    "food",
    "home",
    "pet",
    "shopping",
    "tech",
    "travel",
  ];

  @override
  void initState() {
    _dateController.text = DateFormat('dd/MM/yy').format(DateTime.now());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        backgroundColor: Colors.grey.shade200,
        appBar: AppBar(
          backgroundColor: Colors.grey.shade200,
          iconTheme: IconThemeData(color: Colors.black),
        ),
        body: SingleChildScrollView(
          child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text("Add Expenses",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                          fontSize: 20)),
                  SizedBox(
                    height: 16,
                  ),
                  _buildTextFieldExpenses(context),
                  SizedBox(
                    height: 36,
                  ),
                  _buildTextFieldCategory(context),
                  SizedBox(
                    height: 16,
                  ),
                  _buildTextFieldDate(context),
                  SizedBox(
                    height: 36,
                  ),
                  _buildButtonSave()
                ],
              )),
        ),
      ),
    );
  }

  Widget _buildButtonSave() {
    return SizedBox(
        width: double.infinity,
        height: kToolbarHeight,
        child: TextButton(
            onPressed: () {},
            style: TextButton.styleFrom(
              backgroundColor: Colors.blueAccent,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(15)),
              ),
            ),
            child: Text("Save",
                style: TextStyle(color: Colors.white, fontSize: 18))));
  }

  Widget _buildTextFieldDate(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.08,
      child: TextFormField(
        controller: _dateController,
        textAlignVertical: TextAlignVertical.bottom,
        readOnly: true,
        onTap: () async {
          DateTime? newDate = await showDatePicker(
            context: context,
            initialDate: selectedDate,
            firstDate: DateTime.now(),
            lastDate: DateTime(2030),
          );

          if (newDate != null) {
            setState(() {
              _dateController.text = DateFormat('dd/MM/yy').format(newDate);
              selectedDate = newDate;
            });
          }
        },
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          prefixIcon: const Icon(
            FontAwesomeIcons.clock,
            size: 20,
            color: Colors.grey,
          ),
          hintText: "Date",
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15.0),
              borderSide: BorderSide.none),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.0),
              borderSide: BorderSide.none),
        ),
        style: TextStyle(color: Colors.grey),
      ),
    );
  }

  Widget _buildTextFieldCategory(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.08,
      child: TextFormField(
        controller: _categoryController,
        textAlignVertical: TextAlignVertical.bottom,
        readOnly: true,
        decoration: InputDecoration(
          hintText: "Category",
          filled: true,
          fillColor: Colors.white,
          prefixIcon: const Icon(
            FontAwesomeIcons.list,
            size: 20,
            color: Colors.grey,
          ),
          suffixIcon: IconButton(
              onPressed: () {
                bool isExpended = false;
                showDialog(
                    context: context,
                    builder: (ctx) {
                      return StatefulBuilder(builder: (context, setState) {
                        return AlertDialog(
                            title: Text("Create a Category"),
                            backgroundColor:
                                const Color.fromARGB(255, 171, 228, 250),
                            content: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                TextFormField(
                                  // controller: _dateController,
                                  onTap: () {
                                    setState(() {
                                      isExpended = !isExpended;
                                    });
                                  },
                                  textAlignVertical: TextAlignVertical.bottom,
                                  readOnly: true,
                                  decoration: InputDecoration(
                                    isDense: true,
                                    filled: true,
                                    suffixIcon: Icon(
                                      CupertinoIcons.chevron_down,
                                    ),
                                    fillColor: Colors.white,
                                    hintText: "Name",
                                    enabledBorder: OutlineInputBorder(
                                        borderRadius: isExpended
                                            ? BorderRadius.vertical(
                                                top: Radius.circular(12))
                                            : BorderRadius.circular(12),
                                        borderSide: BorderSide.none),
                                    focusedBorder: OutlineInputBorder(
                                        borderRadius: isExpended
                                            ? BorderRadius.vertical(
                                                top: Radius.circular(12))
                                            : BorderRadius.circular(12),
                                        borderSide: BorderSide.none),
                                  ),
                                  style: TextStyle(color: Colors.grey),
                                ),
                                isExpended
                                    ? Container(
                                        width:
                                            MediaQuery.of(context).size.width,
                                        height: 200,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.vertical(
                                              bottom: Radius.circular(12)),
                                        ),
                                        child: GridView.builder(
                                          gridDelegate:
                                              SliverGridDelegateWithFixedCrossAxisCount(
                                            crossAxisCount: 3,
                                          ),
                                          itemCount: myCategoriesIcons.length,
                                          itemBuilder: (context, int i) {
                                            return Container(
                                                decoration: BoxDecoration(
                                              image: DecorationImage(
                                                  image: AssetImage(
                                                      'assets/images/categories/${myCategoriesIcons[i]}.png'),
                                                  fit: BoxFit.cover),
                                            ));
                                          },
                                        ),
                                      )
                                    : Container(),
                                SizedBox(
                                  height: 16,
                                ),
                                TextFormField(
                                  // controller: _dateController,
                                  onTap: () {
                                    setState(() {
                                      isExpended = !isExpended;
                                    });
                                  },
                                  textAlignVertical: TextAlignVertical.bottom,
                                  readOnly: true,
                                  decoration: InputDecoration(
                                    isDense: true,
                                    filled: true,
                                    fillColor: Colors.white,
                                    suffixIcon: Icon(
                                      CupertinoIcons.chevron_down,
                                    ),
                                    hintText: "Icon",
                                    enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.vertical(
                                            top: Radius.circular(12)),
                                        borderSide: BorderSide.none),
                                    focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.vertical(
                                            top: Radius.circular(12)),
                                        borderSide: BorderSide.none),
                                  ),
                                  style: TextStyle(color: Colors.grey),
                                ),
                                isExpended
                                    ? Container(
                                        width: double.infinity,
                                        height: 200,
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.vertical(
                                                bottom: Radius.circular(12))),
                                      )
                                    : Container(),
                                SizedBox(
                                  height: 16,
                                ),
                                TextFormField(
                                  // controller: _dateController,
                                  onTap: () {
                                    setState(() {
                                      isExpended = !isExpended;
                                    });
                                  },
                                  textAlignVertical: TextAlignVertical.bottom,
                                  readOnly: true,
                                  decoration: InputDecoration(
                                    isDense: true,
                                    filled: true,
                                    fillColor: Colors.white,
                                    suffixIcon: Icon(
                                      CupertinoIcons.chevron_down,
                                    ),
                                    hintText: "Color",
                                    enabledBorder: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(15.0),
                                        borderSide: BorderSide.none),
                                    focusedBorder: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(12.0),
                                        borderSide: BorderSide.none),
                                  ),
                                  style: TextStyle(color: Colors.grey),
                                ),
                                isExpended
                                    ? Container(
                                        width: double.infinity,
                                        height: 200,
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.vertical(
                                                bottom: Radius.circular(12))),
                                      )
                                    : Container(),
                              ],
                            ));
                      });
                    });
              },
              icon: Icon(
                Icons.add,
              )),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15.0),
              borderSide: BorderSide.none),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.0),
              borderSide: BorderSide.none),
        ),
        style: TextStyle(color: Colors.grey),
      ),
    );
  }

  Widget _buildTextFieldExpenses(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.7,
      child: TextFormField(
        controller: _expenseController,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          prefixIcon: const Icon(
            FontAwesomeIcons.dollarSign,
            size: 20,
            color: Colors.grey,
          ),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(50.0),
              borderSide: BorderSide.none),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(50.0),
              borderSide: BorderSide.none),
        ),
      ),
    );
  }
}
