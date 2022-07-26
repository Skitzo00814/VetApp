import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vet/model/user_model.dart';
import 'package:vet/vet_location1.dart';
import 'package:vet/vet_location3.dart';
import 'package:vet/vet_location2.dart';
import 'package:vet/vetpage.dart';
import 'home.dart';
import 'login.dart';

class VetPage2 extends StatefulWidget {
  const VetPage2({super.key});

  @override
  State<VetPage2> createState() => _VetPage2State();
}

class _VetPage2State extends State<VetPage2> {
  User? user = FirebaseAuth.instance.currentUser;
  UserModel loggedInUser = UserModel();

  @override
  void initState() {
    super.initState();

    FirebaseFirestore.instance
        .collection("users")
        .doc(user!.uid)
        .get()
        .then((value) {
      loggedInUser = UserModel.fromMap(value.data());
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Color(0xfff8f3ec),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.fromLTRB(30, 5, 20, 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Hello,',
                      style: TextStyle(fontWeight: FontWeight.w900),
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    Text(
                      '${loggedInUser.firstName}',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      'Finding A Veterinary Clinic can be a hassle.',
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: 14,
                  right: 10,
                ),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 120,
                  margin: EdgeInsets.only(top: 10),
                  child: ListView(
                    physics: BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    children: <Widget>[
                      categoryContainer(
                        "vaccine.png",
                        "Vaccine",
                      ),
                      categoryContainer("check_up.png", "Check Up"),
                      categoryContainer("med.png", "Medicines"),
                      categoryContainer("phonebook.png", "Phonebook"),
                      categoryContainer("appointment.png", "Appointment"),
                    ],
                  ),
                ),
              ),
              Text(
                '\nVeterinary Clinics',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w300,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                height: 400,
                child: SingleChildScrollView(
                    physics: BouncingScrollPhysics(),
                    child: Column(
                      children: <Widget>[
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: ((context) => VetLoc())));
                          },
                          child: createDocWidget(
                              "south_logo.png",
                              "South Paw Animal Clinic",
                              "Clinic Hours: \n\nOpens everyday 10 A.M - 6 P.M \nexcept Tuesday."),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: ((context) => VetLoc2())));
                          },
                          child: createDocWidget(
                              "ormanes.png",
                              "Ormanes Veterinary Clinic",
                              "Clinic Hours: \n\nOpens everyday 9 A.M - 5 P.M \nSunday 9 A.M - 2 P.M ."),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: ((context) => VetLoc3())));
                          },
                          child: createDocWidget(
                              "MEOW.png",
                              "BOW MEOW Animal Clinic",
                              "Clinic Hours: \n\nOpens everyday 9 A.M - 4 P.M \nexcept Wednesday."),
                        ),
                      ],
                    )),
              ),
            ],
          ),
        ),
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          actions: [
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 10, 20, 0),
              child: Image.asset('assets/logo.png'),
            ),
          ],
        ),
        drawer: Drawer(
          child: Container(
            color: Color(0xfff8f3ec),
            child: ListView(
              children: [
                Builder(builder: (context) {
                  return DrawerHeader(
                    decoration: BoxDecoration(
                      color: Color(0xfff4c789),
                      image: DecorationImage(
                        image: AssetImage("assets/simula.png"),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Text(""),
                  );
                }),
                ListTile(
                  leading: Icon(Icons.home),
                  title: Text(
                    'Home',
                    style: GoogleFonts.cairo(
                      textStyle: TextStyle(fontSize: 20),
                    ),
                  ),
                  onTap: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: ((context) => HomePage())));
                  },
                ),
                ListTile(
                  leading: Icon(Icons.add_shopping_cart_rounded),
                  title: Text(
                    'Pet Shop',
                    style: GoogleFonts.cairo(
                      textStyle: TextStyle(fontSize: 20),
                    ),
                  ),
                  onTap: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: ((context) => VetPage())));
                  },
                ),
                ListTile(
                  leading: Icon(Icons.medical_services_rounded),
                  title: Text(
                    'Veterinaries',
                    style: GoogleFonts.cairo(
                      textStyle: TextStyle(fontSize: 20),
                    ),
                  ),
                  onTap: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: ((context) => VetPage2())));
                  },
                ),
                Divider(
                  color: Colors.white,
                ),
                ListTile(
                  leading: Icon(Icons.logout),
                  title: Text(
                    'Logout',
                    style: GoogleFonts.cairo(
                      textStyle: TextStyle(fontSize: 20),
                    ),
                  ),
                  onTap: () {
                    logout(context);
                  },
                )
              ],
            ),
          ),
        ));
  }

  Future<void> logout(BuildContext context) async {
    await FirebaseAuth.instance.signOut();
    // ignore: use_build_context_synchronously
    Navigator.of(context)
        .pushReplacement(MaterialPageRoute(builder: (context) => Login()));
  }

  Container categoryContainer(String imgName, String title) {
    return Container(
      width: 100,
      child: Column(
        children: <Widget>[
          Image.asset('assets/$imgName'),
          Text(
            "$title",
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 17,
            ),
          ),
        ],
      ),
    );
  }

  Container createDocWidget(String imgName, String docName, String s) {
    return Container(
      child: InkWell(
        child: Container(
          margin: EdgeInsets.only(bottom: 15),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Color(0xffe7d7c0),
          ),
          child: Container(
            padding: EdgeInsets.all(7),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                Container(
                  width: 90,
                  height: 100,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/$imgName'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      docName,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      width: 250,
                      height: 70,
                      child: Text(
                        s,
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                        ),
                        overflow: TextOverflow.clip,
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
