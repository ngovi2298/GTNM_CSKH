import 'package:GTNM_CSKH/FakeCategory.dart';
import 'package:GTNM_CSKH/FakeData.dart';
import 'package:GTNM_CSKH/SearchScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SendEmail extends StatefulWidget {
  final String emailName;
  SendEmail(this.emailName);
  @override
  _SendEmailState createState() => _SendEmailState();
}

class _SendEmailState extends State<SendEmail> {
  List<String> _dynamicChips = new List<String>.from(Category1);
  String _Search = '';
  final searchcontroller = TextEditingController();
  var height = AppBar().preferredSize.height;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(widget.emailName),
        backgroundColor: Colors.teal,
        actions: [
          Builder(
            builder: (context) => IconButton(
                icon: Icon(Icons.send),
                onPressed: () {
                  Scaffold.of(context).showSnackBar(SnackBar(
                    content: Text('Email send successfully'),
                    action: SnackBarAction(
                        label: 'Ok',
                        onPressed: () =>
                            Scaffold.of(context).hideCurrentSnackBar()),
                  ));
                  setState(() {
                    _dynamicChips.clear();
                  });
                }),
          ),
        ],
      ),
      body: Container(
        width: size.width,
        height: size.height - height,
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                  showCursor: true,
                  readOnly: true,
                  decoration: InputDecoration(
                    hintText: "search...",
                    suffixIcon: Icon(Icons.search),
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                  ),
                  onTap: () async {
                    var result = await showSearch(
                        context: context,
                        delegate: DataSearch(widget.emailName));
                    setState(() {
                      _dynamicChips.add(result);
                    });
                  }),
            ),
            ConstrainedBox(
              constraints: BoxConstraints(maxHeight: size.height * 0.2),
              child: ListView.builder(
                  itemCount: Category1.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Container(
                      child: Card(
                        child: InkWell(
                          splashColor: Colors.blue.withAlpha(30),
                          onTap: () {
                            if (Category1[index] == "Student") {
                              for (var i = 0; i < fakeData.length; i++)
                                setState(() {
                                  _dynamicChips.add(fakeData[i].name);
                                });
                            }
                            ;
                          },
                          child: Container(
                            width: 100,
                            alignment: Alignment.center,
                            child: Text(Category1[index]),
                          ),
                        ),
                      ),
                    );
                  }),
            ),
            Divider(color: Colors.black),
            Text(
              "Reciver",
              style: TextStyle(
                fontSize: 10,
                color: Colors.grey,
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListView(
                  primary: true,
                  children: <Widget>[
                    Wrap(
                      spacing: 10.0,
                      runSpacing: 6.0,
                      children: List<Widget>.generate(_dynamicChips.length,
                          (int index) {
                        return Chip(
                          deleteIconColor: Colors.white,
                          backgroundColor: Colors.teal,
                          label: Text(
                            _dynamicChips[index],
                            style: TextStyle(color: Colors.white),
                          ),
                          onDeleted: () {
                            setState(() {
                              _dynamicChips.removeAt(index);
                            });
                          },
                        );
                      }).toList(),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

//DataSearch
