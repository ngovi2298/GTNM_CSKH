import 'package:GTNM_CSKH/FakeData.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import 'FakeCategory.dart';

class EditScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('EDITSCREEN'),
        backgroundColor: Colors.teal,
        actions: <Widget>[
          FlatButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text(
                'Save',
                style: TextStyle(fontSize: 20, color: Colors.black),
              ))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              alignment: AlignmentDirectional.center,
              padding: const EdgeInsets.symmetric(horizontal: 0.0,vertical: 20.0),
              child: CircleAvatar(
                backgroundImage: NetworkImage('https://i.imgur.com/msQKgvv.jpeg'),
                radius: 50.0,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Name :',
                style:TextStyle(fontSize: 20),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 0.0),
              child: TextField(
                obscureText: true,
                style: TextStyle(fontSize: 20),
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                ),
              )
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Email :',
                style:TextStyle(fontSize: 20),
              ),
            ),
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 0.0),
                child: TextField(
                  obscureText: true,
                  style: TextStyle(fontSize: 20),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                  ),
                )
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'D.O.B :',
                style:TextStyle(fontSize: 20),
              ),
            ),
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 0.0),
                child: TextField(
                  obscureText: true,
                  style: TextStyle(fontSize: 20),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                  ),
                )
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Gender :',
                style:TextStyle(fontSize: 20),
              ),
            ),
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 0.0),
                child: TextField(
                  obscureText: true,
                  style: TextStyle(fontSize: 20),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                  ),
                )
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Category :',
                style:TextStyle(fontSize: 20),
              ),
            ),
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 10.0),
                child: OutlineButton(
                  onPressed: (){},
                  textColor: Colors.teal,
                  borderSide: BorderSide(color: Colors.teal),
                  child: Text(
                    'Chance Category',
                    style:TextStyle(fontSize: 20),
                  ),
                )
            ),
          ],
        ),
      ),
    );
  }
}
