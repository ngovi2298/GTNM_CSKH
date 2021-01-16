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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Home Screen'),
        backgroundColor: Colors.teal,
        actions: <Widget>[
           PopupMenuButton<String>(
             onSelected: null,
             itemBuilder: (BuildContext context){
               return {'Logout','Setting'}.map((String choice){
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
                  shrinkWrap: true,
                  itemBuilder: (context, i) {
                    if(fakeData[i].name.contains(_Search)==true || fakeData[i].email.contains(_Search)==true)
                      {
                        return new Column(
                          children: <Widget>[
                            ExpansionTile(
                              leading: new CircleAvatar(
                                foregroundColor:
                                Colors.grey, //Theme.of(context).primaryColor,
                                backgroundColor: Colors.grey,
                              ),
                              title: Text(
                                fakeData[i].name,
                                style: TextStyle(fontSize: 20),
                              ),
                              subtitle: Text(
                                fakeData[i].email,
                                style: TextStyle(fontSize: 20),
                              ),
                              children: <Widget>[
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 8.0, horizontal: 50.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: <Widget>[
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Text(
                                            'Ngày sinh :',
                                            style: TextStyle(fontSize: 20),
                                          ),
                                          Text(
                                            'Giới tính :',
                                            style: TextStyle(fontSize: 20),
                                          )
                                        ],
                                      ),
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Text(
                                            fakeData[i].DOB,
                                            style: TextStyle(fontSize: 20),
                                          ),
                                          Text(
                                            fakeData[i].gender,
                                            style: TextStyle(fontSize: 20),
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ],
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