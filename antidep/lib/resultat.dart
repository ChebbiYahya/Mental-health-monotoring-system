import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class Resultat_screen extends StatefulWidget {
  const Resultat_screen({super.key});

  @override
  State<Resultat_screen> createState() => _Resultat_screenState();
}

class _Resultat_screenState extends State<Resultat_screen> {
  String Result = "";
  String Details = "";
  String Traitement = "";

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
          children: [
            SizedBox(height: 50),
            Container(
              margin: EdgeInsets.all(20),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Center(
                      child: Text("Vos symptômes correspondent:",
                          style:
                              Theme.of(context).textTheme.headline5!.copyWith(
                                    color: Color(0xFF091638),
                                    fontWeight: FontWeight.bold,
                                  )),
                    ),
                    Center(
                      child: Text(
                        Result,
                        style: Theme.of(context).textTheme.headline4!.copyWith(
                              color: Color(0xFF199A8E),
                              fontWeight: FontWeight.bold,
                            ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    SizedBox(height: 20),
                    Center(
                      child: Text("Une brève description de la maladie:",
                          style: Theme.of(context)
                              .textTheme
                              .headline5!
                              .copyWith(
                                  color: Color(0xFF091638),
                                  fontWeight: FontWeight.bold)),
                    ),
                    Center(
                      child: Text(
                        Details,
                        style: Theme.of(context).textTheme.headline6!.copyWith(
                              color: Color(0xFF199A8E),
                              fontWeight: FontWeight.bold,
                            ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    SizedBox(height: 20),
                    Center(
                      child: Text(
                        "Les médicaments et procédures couramment proposés:",
                        style: Theme.of(context).textTheme.headline5!.copyWith(
                              color: Color(0xFF091638),
                              fontWeight: FontWeight.bold,
                            ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Center(
                      child: Text(
                        Traitement,
                        style: Theme.of(context).textTheme.headline6!.copyWith(
                              color: Color(0xFF199A8E),
                              fontWeight: FontWeight.bold,
                            ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
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
                    DatabaseReference db = FirebaseDatabase.instance.ref();
                    final snapshotR = await db.child("Reponse").get();
                    final snapshotD = await db.child("Details").get();
                    final snapshotT = await db.child("Traitement").get();
                    if (snapshotR.exists) {
                      setState(() {
                        Result = snapshotR.value.toString();
                        Details = snapshotD.value.toString();
                        Traitement = snapshotT.value.toString();
                      });
                    } else {
                      Result = "No Data";
                      Details = "No Data";
                      Traitement = "No Data";
                    }
                  },
                  child: Text(
                    "Resultat",
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
