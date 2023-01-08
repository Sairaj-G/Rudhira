import 'dart:io';

import 'package:flutter/material.dart';
import 'package:rudhira/components/request_widget.dart';
import 'new_requests.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'post_open_up.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("On Going Requests"),
        backgroundColor: Colors.redAccent,
      ),
      body: Container(
          child: Material(
        child: StreamBuilder(
          stream: FirebaseFirestore.instance.collection("Requests").snapshots(),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasError) {
              return Text('Something went wrong');
            }

            if (snapshot.connectionState == ConnectionState.waiting) {
              return Text("Loading");
            }

            return ListView(
              children: snapshot.data!.docs.map((DocumentSnapshot document) {
                Map<String, dynamic> data =
                    document.data()! as Map<String, dynamic>;
                return GestureDetector(
                  child: RequestWidget(
                      needyName: data['Name'],
                      contactNumber: data['PhoneNumber'],
                      bloodGroup: data['BloodGroup']),
                  onTap: (){Navigator.push(context,
                      MaterialPageRoute(builder: (context) =>  PostOpenUp(needyName: data['Name'], phoneNumber: data['PhoneNumber'],
                          bloodGroup: data['BloodGroup'] ) ) );},
                );
              }).toList(),
            );
          },
        ),
      )),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const NewRequests()));
        },
        backgroundColor: Colors.redAccent,
        child: Icon(Icons.add),
      ),
    );
  }
}
