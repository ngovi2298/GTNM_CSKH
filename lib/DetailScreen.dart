import 'package:GTNM_CSKH/FakeCategory.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DetailScreen extends StatefulWidget {
  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    var size=MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(minHeight: size.height),
          child: Column(
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Colors.teal, Colors.tealAccent],
                )),
                child: Container(
                    width: double.infinity,
                    height: 350.0,
                    child: Center(
                        child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        CircleAvatar(
                          backgroundImage:
                              NetworkImage('https://i.imgur.com/msQKgvv.jpeg'),
                          radius: 50.0,
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Text(
                          "TONY STARK",
                          style: TextStyle(
                            fontSize: 25.0,
                            color: Colors.white70,
                          ),
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Text(
                          "CATEGORY",
                          style: TextStyle(
                            fontSize: 20.0,
                            color: Colors.white70,
                          ),
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        ConstrainedBox(
                          constraints: BoxConstraints(maxHeight: 50.0),
                          child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: Category.length,
                              itemBuilder: (Context, index) {
                                return Container(
                                  child: Card(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    color: Colors.white,
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Container(
                                        child: Center(
                                            child: Text(
                                          Category[index].toString(),
                                          style: TextStyle(
                                              color: Colors.teal,
                                              fontSize: 24.0),
                                        )),
                                      ),
                                    ),
                                  ),
                                );
                              }),
                        ),
                      ],
                    ))),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Container(
                  alignment: Alignment.topLeft,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text("D.O.B:",
                          style: TextStyle(
                              color: Colors.blueGrey, fontSize: 25.0)),
                      SizedBox(
                        height: 10.0,
                      ),
                      Text(
                        "12/08/2016",
                        style: TextStyle(fontSize: 25.0),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Text("Address:",
                          style: TextStyle(
                              color: Colors.blueGrey, fontSize: 25.0)),
                      SizedBox(
                        height: 10.0,
                      ),
                      Text(
                        "123 England, Street Noway",
                        style: TextStyle(fontSize: 25.0),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Text("Email:",
                          style: TextStyle(
                              color: Colors.blueGrey, fontSize: 25.0)),
                      SizedBox(
                        height: 10.0,
                      ),
                      Text(
                        "TonyStark1247@gmail.com",
                        style: TextStyle(fontSize: 25.0),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Text("WorkPlace",
                          style: TextStyle(
                              color: Colors.blueGrey, fontSize: 25.0)),
                      SizedBox(
                        height: 10.0,
                      ),
                      Text(
                        "RMIT",
                        style: TextStyle(fontSize: 25.0),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
