import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vet/login.dart';
import 'package:vet/model/user_model.dart';
import 'package:vet/services.dart';
import 'package:vet/vetpage.dart';
import 'package:vet/vetpage2.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Ito yung codeline para marecognize ng app yung nakalogin na user.
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
        backgroundColor: Color(0xfff8f3ec),
        body: SafeArea(
            child: Expanded(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 25,
                ),
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Hello,',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 4,
                        ),
                        Text(
                          '${loggedInUser.firstName}',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              // Upper Box Design
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Container(
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                        color: Color(0xfff8e4c8),
                        borderRadius: BorderRadius.circular(12)),
                    child: Row(
                      children: [
                        Container(
                          height: 100,
                          width: 100,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('assets/logo1.png'),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Welcome to Paws & Claws Clinic',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                              SizedBox(
                                height: 12,
                              ),
                              Text(
                                'Please have a look around',
                                style: TextStyle(
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    )),
              ),
              SizedBox(
                height: 25,
              ),
              // Search bar
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Container(
                  padding: EdgeInsets.all(1),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12)),
                  child: TextField(
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.search),
                      border: InputBorder.none,
                      hintText: 'How can we help you?',
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 25,
              ),
              // TIPS FOR YOU
              Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: SizedBox(
                  height: 80,
                  child: ListView(scrollDirection: Axis.horizontal, children: [
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: Color(0xffefc488),
                        ),
                        width: 350,
                        child: Wrap(
                          children: [
                            Text(
                              "Medicines made for humans can kill your pet. As a matter of fact, in 2010 the ASPCA listed human drugs in the top 10 pet toxins.",
                              maxLines: 5,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Container(
                      padding: EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Color(0xffefc488),
                      ),
                      child: Row(
                        children: [
                          Icon(Icons.pets_rounded),
                          SizedBox(
                            width: 5,
                          ),
                          Text('Pet Shop'),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Container(
                      padding: EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Color(0xffefc488),
                      ),
                      child: Row(
                        children: [
                          Icon(Icons.medical_services_outlined),
                          SizedBox(
                            width: 5,
                          ),
                          Text('Pharmacy'),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Container(
                      padding: EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Color(0xffefc488),
                      ),
                      child: Row(
                        children: [
                          Icon(Icons.cloud_rounded),
                          SizedBox(
                            width: 5,
                          ),
                          Text('Others'),
                        ],
                      ),
                    ),
                  ]),
                ),
              ),
              SizedBox(
                height: 25,
              ),

              // SERVICES
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Services'),
                  ],
                ),
              ),
              Expanded(
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    // Press to be in Pet shop page.
                    GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: ((context) => VetPage2())));
                        },
                        child: Services(
                          imahe: 'assets/dog.png',
                          pangalan: 'Veterinary',
                          view1: ' See More',
                        )),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: ((context) => VetPage())));
                      },
                      child: Services(
                        imahe: 'assets/dog.png',
                        pangalan: 'Pet Shop',
                        view1: ' See More',
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 25,
              ),
            ],
          ),
        )),
        //App Bar ng mga gwapo
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
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
                  leading: Icon(Icons.home),
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
                  leading: Icon(Icons.home),
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
}
