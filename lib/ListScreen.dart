import 'package:GTNM_CSKH/DetailScreen.dart';
import 'package:GTNM_CSKH/ListEmailScreen.dart';
import 'package:GTNM_CSKH/LoginScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:GTNM_CSKH/FakeData.dart';
import 'package:flutter/scheduler.dart';

class ListScreen extends StatefulWidget {
  @override
  _ListScreenState createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  String _Search='';
  final searchcontroller = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  void handleClick(String value,BuildContext context)
  {
    switch(value)
    {
      case 'Email':
        Navigator.push(context, MaterialPageRoute(builder: (context) => ListEmailScreen()));
        break;
      case 'Logout':
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginScreen()));
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
        title: Text('Home Screen'),
        backgroundColor: Colors.teal,
        actions: <Widget>[
           PopupMenuButton<String>(
             onSelected: (choice)=>handleClick(choice, context),
             itemBuilder: (BuildContext context){
               return {'Email','Logout'}.map((String choice){
                return PopupMenuItem<String>(
                  value: choice,
                  child: Text(choice),
                );
               }).toList();
             },
           )
        ],
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextField(
                controller: searchcontroller,
                onChanged: (value) {
                  this.setState(() {
                    _Search = value;
                  });
                },

                decoration: InputDecoration(
                  hintText: "Search...",
                  suffixIcon: IconButton(icon: Icon(Icons.search),onPressed: (){FocusScope.of(context).requestFocus(FocusNode());},),
                  border: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.black,width: 1.0,style: BorderStyle.solid),
                  ),
                  // contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                ),
              ),
            ),
            Expanded(
                child: ListView.builder(
                  itemCount: fakeData.length,
                  itemBuilder: (context, i) {
                    if(fakeData[i].name.contains(_Search)==true || fakeData[i].email.contains(_Search)==true)
                      {
                        return new Column(
                          children: <Widget>[
                            ListTile(
                              leading: new CircleAvatar(
                                foregroundColor: Colors.grey, //Theme.of(context).primaryColor,
                                backgroundColor: Colors.grey,
                                backgroundImage: NetworkImage(fakeData[i].avatarUrl),
                              ),
                              title: Transform(
                                transform: Matrix4.translationValues(20, 0.0, 0.0),
                                child: Text(
                                  fakeData[i].name,
                                  style: TextStyle(fontSize: 20),
                                ),
                              ),
                              subtitle: Transform(
                                transform: Matrix4.translationValues(20, 0.0, 0.0),
                                child: Text(
                                  fakeData[i].email,
                                  style: TextStyle(fontSize: 20),
                                ),
                              ),
                              onTap:(){
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => DetailScreen(fakeData[i])));
                              },
                            )
                          ],
                        );
                      }
                    else
                      {
                        return null;
                      }
                  },
                ),
              ),
          ],
        ),
      ),
    );
  }
}