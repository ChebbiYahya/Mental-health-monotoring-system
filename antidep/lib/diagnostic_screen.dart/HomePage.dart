import 'package:antidep/Title.dart';
import 'package:antidep/diagnostic_screen.dart/diagnostic_screen2.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  List<bool> isSelected1 = [true, false];
  List<bool> isSelected2 = [true, false];
  String Result = "";
  String Details = "";
  String Traitement = "";
  @override
  Widget build(BuildContext context) {
    content() {
      DatabaseReference db = FirebaseDatabase.instance.ref();
      db.child("Reponse").onValue.listen(
        (event) {
          setState(() {
            Result = event.snapshot.value.toString();
          });
        },
      );
      db.child("Details").onValue.listen(
        (event) {
          setState(() {
            Details = event.snapshot.value.toString();
          });
        },
      );
      db.child("Traitement").onValue.listen(
        (event) {
          setState(() {
            Traitement = event.snapshot.value.toString();
          });
        },
      );
      print("rrrrrrrrrr=$Result");
      print("ttttttttttttt=$Traitement");
      print("Details=$Details");
    }

    void initState() {
      content();
      super.initState();
    }

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
            TitleText(title: "Ressentez-vous de la tristesse ?", nb: "1"),
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
            TitleText(
                title:
                    "Avez-vous perdu de l interêt pour les activites que vous aimiez auparavant ?",
                nb: "2"),
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

                    await FirebaseDatabase.instance.ref().update({'Qs1': q1});
                    await FirebaseDatabase.instance.ref().update({'Qs2': q2});

                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Diagnostic_screen2()),
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
