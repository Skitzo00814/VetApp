import 'package:flutter/material.dart';

class Services extends StatelessWidget {
  final String imahe;
  final String pangalan;
  final String view1;

  Services(
      {super.key,
      required this.imahe,
      required this.pangalan,
      required this.view1});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25.0),
      child: Expanded(
        child: Container(
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Color(0xffe1bf90),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Expanded(
            child: Column(
              children: [
                Image.asset(
                  imahe,
                  height: 50,
                ),
                SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  pangalan,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(view1)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
