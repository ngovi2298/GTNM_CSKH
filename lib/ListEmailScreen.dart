import 'package:GTNM_CSKH/Fake%20Email.dart';
import 'package:GTNM_CSKH/LoginScreen.dart';
import 'package:GTNM_CSKH/SendEmail.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ListEmailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('Email Templates'),
        centerTitle: true,
        backgroundColor: Colors.teal,
      ),
      body: Container(
        child: ListView.builder(
            itemCount: MyEmail.length,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                margin: EdgeInsets.all(10),
                decoration:
                    BoxDecoration(border: Border.all(color: Colors.grey)),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: <Widget>[
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            MyEmail[index].emailName,
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            MyEmail[index].dateCreate,
                            style: TextStyle(fontSize: 10, color: Colors.grey),
                          ),
                        ],
                      ),
                      Expanded(
                          child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          FlatButton(
                              onPressed: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => SendEmail(MyEmail[index].emailName)));
                              },
                              child: Text(
                                "Use",
                                style: TextStyle(color: Colors.black),
                              )),
                        ],
                      ))
                    ],
                  ),
                ),
              );
            }),
      ),
    );
  }
}
