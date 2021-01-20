import 'package:flutter/material.dart';

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
              padding: const EdgeInsets.only(top: 20.0),
              child: CircleAvatar(
                backgroundImage: NetworkImage('https://i.imgur.com/msQKgvv.jpeg'),
                radius: 50.0,
              ),
            ),
            Container(
                alignment: AlignmentDirectional.center,
                padding: const EdgeInsets.only(bottom: 20.0),
                child: IconButton(
                    icon: Icon(
                        Icons.camera_alt_outlined
                    ), onPressed: null
                )
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
