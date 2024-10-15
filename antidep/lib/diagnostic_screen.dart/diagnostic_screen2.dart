import 'package:antidep/diagnostic_screen.dart/diagnostic_screen3.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

import '../Title.dart';

class Diagnostic_screen2 extends StatefulWidget {
  const Diagnostic_screen2({super.key});

  @override
  State<Diagnostic_screen2> createState() => _Diagnostic_screen2State();
}

class _Diagnostic_screen2State extends State<Diagnostic_screen2> {
  List<bool> isSelected1 = [true, false];
  List<bool> isSelected2 = [true, false];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          flexibleSpace: Image.asset(
            "assets/logo2.png",
            height: 100,
          ),
          backgroundColor: Colors.transparent,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 50),
            TitleText(title: "Vous sentez-vous fatigue ?", nb: "3"),
            SizedBox(height: 20),
            Center(
              child: ToggleButtons(
                renderBorder: false,
                fillColor: Colors.transparent,
                children: [
                  Container(
                    margin: EdgeInsets.all(10),
                    width: 50.0,
                    height: 50.0,
                    decoration: BoxDecoration(
                      color: isSelected1[0]
                          ? Color(0xFF199A8E)
                          : Colors.transparent,
                      border: Border.all(
                        color: Color(0xFF199A8E),
                        width: 1.0,
                      ),
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: Text(
                        'Oui',
                        style: TextStyle(
                          color:
                              isSelected1[0] ? Colors.white : Color(0xFF199A8E),
                          fontSize: 20.0,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(10),
                    width: 50.0,
                    height: 50.0,
                    decoration: BoxDecoration(
                      color: isSelected1[1]
                          ? Color(0xFF199A8E)
                          : Colors.transparent,
                      border: Border.all(
                        color: Color(0xFF199A8E),
                        width: 1.0,
                      ),
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: Text(
                        'Non',
                        style: TextStyle(
                          color:
                              isSelected1[1] ? Colors.white : Color(0xFF199A8E),
                          fontSize: 20.0,
                        ),
                      ),
                    ),
                  ),
                ],
                onPressed: (index) {
                  setState(() {
                    for (int i = 0; i < isSelected1.length; i++) {
                      isSelected1[i] = i == index;
                    }
                  });
                },
                isSelected: isSelected1,
              ),
            ),
            SizedBox(height: 30),
            Divider(),
            SizedBox(height: 30),
            TitleText(title: "Êtes-vous souvent nerveux ?", nb: "4"),
            SizedBox(height: 20),
            Center(
              child: ToggleButtons(
                renderBorder: false,
                fillColor: Colors.transparent,
                children: [
                  Container(
                    margin: EdgeInsets.all(10),
                    width: 50.0,
                    height: 50.0,
                    decoration: BoxDecoration(
                      color: isSelected2[0]
                          ? Color(0xFF199A8E)
                          : Colors.transparent,
                      border: Border.all(
                        color: Color(0xFF199A8E),
                        width: 1.0,
                      ),
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: Text(
                        'Oui',
                        style: TextStyle(
                          color:
                              isSelected2[0] ? Colors.white : Color(0xFF199A8E),
                          fontSize: 20.0,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(10),
                    width: 50.0,
                    height: 50.0,
                    decoration: BoxDecoration(
                      color: isSelected2[1]
                          ? Color(0xFF199A8E)
                          : Colors.transparent,
                      border: Border.all(
                        color: Color(0xFF199A8E),
                        width: 1.0,
                      ),
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: Text(
                        'Non',
                        style: TextStyle(
                          color:
                              isSelected2[1] ? Colors.white : Color(0xFF199A8E),
                          fontSize: 20.0,
                        ),
                      ),
                    ),
                  ),
                ],
                onPressed: (index) {
                  setState(() {
                    for (int i = 0; i < isSelected2.length; i++) {
                      isSelected2[i] = i == index;
                    }
                  });
                },
                isSelected: isSelected2,
              ),
            ),
            Spacer(),
            Positioned(
              bottom: 20,
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(double.infinity, 50),
                    backgroundColor: Color(0xFF199A8E),
                  ),
                  onPressed: () async {
                    String q1 = isSelected1[0] ? 'oui' : 'non';
                    String q2 = isSelected2[0] ? 'oui' : 'non';

                    await FirebaseDatabase.instance.ref().update({'Qs3': q1});
                    await FirebaseDatabase.instance.ref().update({'Qs4': q2});
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Diagnostic_screen3()),
                    );
                  },
                  child: Text(
                    "Suivant",
                    style: Theme.of(context).textTheme.headline4!.copyWith(
                          color: Color(0xFFFFFFFF),
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
