import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget fetchData(String collectionName) {
  return StreamBuilder(
    stream: FirebaseFirestore.instance
        .collection(collectionName)
        .doc(FirebaseAuth.instance.currentUser!.email)
        .collection("items")
        .snapshots(),
    builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
      if (snapshot.hasError) {
        return Center(
          child: Text("Something is wrong"),
        );
      }

      return ListView.builder(
          itemCount: snapshot.data == null ? 0 : snapshot.data!.docs.length,
          itemBuilder: (_, index) {
            DocumentSnapshot _documentSnapshot = snapshot.data!.docs[index];

            return Card(
                elevation: 5,
                child: Container(
                  margin:
                      EdgeInsets.only(left: 5, right: 5, top: 15, bottom: 15),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Column(
                    children: [
                      Text(_documentSnapshot['name']),
                      SizedBox(
                        height: 10.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            "\$ ${_documentSnapshot['price']}",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, color: Colors.red),
                          ),
                          GestureDetector(
                            child: CircleAvatar(
                              child: Icon(Icons.remove_circle),
                            ),
                            onTap: () {
                              FirebaseFirestore.instance
                                  .collection(collectionName)
                                  .doc(FirebaseAuth.instance.currentUser!.email)
                                  .collection("items")
                                  .doc(_documentSnapshot.id)
                                  .delete();
                            },
                          )
                        ],
                      ),
                    ],
                  ),
                ));
          });
    },
  );
}
