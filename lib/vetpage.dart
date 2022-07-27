import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vet/home.dart';
import 'package:vet/login.dart';
import 'package:vet/market.dart';
import 'package:vet/model/user_model.dart';
import 'package:vet/shop.dart';
import 'package:vet/veterinary_main.dart';

class VetPage extends StatefulWidget {
  const VetPage({Key? key}) : super(key: key);

  @override
  State<VetPage> createState() => _VetPageState();
}

class _VetPageState extends State<VetPage> {
  final List mType = [
    [
      'Dog Foods',
      true,
    ],
    [
      'Cat Foods',
      false,
    ],
    [
      'Bowls',
      false,
    ],
    [
      'Cage',
      false,
    ],
    [
      'Pet Meds',
      false,
    ],
  ];

  void mTypeSelected(int index) {
    setState(() {
      mType[index][1] = true;
    });
  }

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
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Text(
              'Welcome To Paws and Claws Shop',
              style: GoogleFonts.bebasNeue(
                fontSize: 56,
              ),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: TextField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.search),
                hintText: 'Search here..',
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey.shade600),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey.shade600),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 25,
          ),
          SizedBox(
            height: 40,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: mType.length,
                itemBuilder: ((context, index) {
                  return Market(
                    mType: mType[index][0],
                    isSelected: mType[index][1],
                    onTap: () {
                      mTypeSelected(index);
                    },
                  );
                })),
          ),
          Expanded(
              child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              Shop(),
              Shop(),
              Shop(),
              Shop(),
            ],
          ))
        ],
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
      ),
    );
  }

  Future<void> logout(BuildContext context) async {
    await FirebaseAuth.instance.signOut();
    // ignore: use_build_context_synchronously
    Navigator.of(context)
        .pushReplacement(MaterialPageRoute(builder: (context) => Login()));
  }
}
