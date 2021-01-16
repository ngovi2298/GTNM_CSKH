import 'package:GTNM_CSKH/ListScreen.dart';
import 'package:flutter/material.dart';
import 'FakeData.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool check;
  String _Username;
  String _Password;
  final usercontroller = TextEditingController();
  final passwordcontroller = TextEditingController();
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
      body: Center(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'CSKH',
                  style: TextStyle(fontSize: 50, color: Colors.teal),
                ),
              ),
              TextFormField(
                onChanged: (usercontroller) {
                  this.setState(() {
                    _Username = usercontroller;
                    //  final FormState form = _formKey.currentState;
                    //  form.validate();
                  });
                },
                controller: usercontroller,
                decoration: const InputDecoration(
                  icon: Icon(Icons.person),
                  hintText: 'What your email?',
                  labelText: 'Email',
                ),
                onSaved: (value) {},
                validator: (value) {
                  return value.contains('@') ? null : 'email need "@" ';
                },
              ),
              TextFormField(
                onChanged: (passwordcontroller) {
                  this.setState(() {
                    _Password = passwordcontroller;
                    //  final FormState form = _formKey.currentState;
                    //  form.validate();
                  });
                },
                controller: passwordcontroller,
                decoration: const InputDecoration(
                  icon: Icon(Icons.vpn_key),
                  hintText: 'What your password?',
                  labelText: 'Password',
                ),
                onSaved: (value) {},
                validator: (value) {
                  return value.length > 3
                      ? null
                      : 'password more than 4 character';
                },
              ),
              Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: OutlineButton(
                    child: Text(
                      'Login',
                      style: TextStyle(fontSize: 20, color: Colors.teal),
                    ),
                    onPressed: () {
                      check=false;
                      for (var i = 0; i < fakeData.length; i++) {
                        _Username == fakeData[i].email
                            ? check=true:null;
                      }
                      check ? Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => ListScreen()))
                          : showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text('ERROR'),
                              content:
                              Text('Username or Password incorrect'),
                              actions: <Widget>[
                                FlatButton(
                                  child: Text('Ok'),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                )
                              ],
                            );
                          });
                    },
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
