// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:math';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController weightController = TextEditingController();
  TextEditingController heightController = TextEditingController();
  double bmi = 0;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Color(0xffF7E2E2),
      appBar: AppBar(
        title: Text(
          "BMI CALCULATOR ",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.pink,
      ),
      drawer: Drawer(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            UserAccountsDrawerHeader(
              decoration: BoxDecoration(color: Colors.pink),
              accountName: null,
              accountEmail: null,
            ),
            Column(
              children: [
                CircleAvatar(
                  backgroundColor: Colors.pink,
                  child: Text(
                    "D",
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  radius: 35,
                ),
                SizedBox(height: 30),
                Text(
                  "Dnyaneshwar Shinde",
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            SizedBox(),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 28.0),
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(height: size.height * 0.1),
              Center(
                child: Text(
                  'PRN: 2020BTEIT00032',
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: size.height * 0.06),
              Row(
                children: [
                  Text(
                    "Enter your weight (kg): ",
                    style: TextStyle(fontSize: 20),
                  ),
                  Expanded(
                    child: TextField(
                      keyboardType: TextInputType.number,
                      controller: weightController,
                      style: TextStyle(fontSize: 20),
                      cursorColor: Colors.pink,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(left: 18),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.pink),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.pink),
                        ),
                        border: UnderlineInputBorder(
                          // borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: Colors.pink),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    "Enter your height (cm): ",
                    style: TextStyle(fontSize: 20),
                  ),
                  Expanded(
                    child: TextField(
                      keyboardType: TextInputType.number,
                      controller: heightController,
                      style: TextStyle(fontSize: 20),
                      cursorColor: Colors.orangeAccent,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(left: 18),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.pink),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.pink),
                        ),
                        border: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.pink),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 30),
              InkWell(
                onTap: () {
                  setState(() {
                    bmi = double.parse(weightController.text) /
                        (pow(double.parse(heightController.text) / 100, 2));
                  });
                  print(bmi);
                  weightController.text = "";
                  heightController.text = "";
                },
                child: Container(
                  alignment: Alignment.center,
                  height: 50,
                  width: size.width * 0.45,
                  decoration: BoxDecoration(
                    color: Colors.pink,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Text(
                    "Calculate My BMI",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 60),
              Text(
                "Your BMI: ${bmi.toStringAsFixed(3)}",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 60),
              Text(
                bmi >= 25
                    ? 'Overweight'
                    : bmi > 18.5
                        ? 'Normal'
                        : bmi == 0
                            ? "BMI Result"
                            : 'Underweight',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 60),
            ],
          ),
        ),
      ),
    );
  }
}
