import 'package:GTNM_CSKH/FakeCategory.dart';
import 'package:GTNM_CSKH/SendEmail.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'FakeData.dart';

class DataSearch extends SearchDelegate<String> {
  ChatModel selectedItem;

  final List<ChatModel> recentModel = [
    new ChatModel(
      name: "AClient",
      email: "ClientEmail@Email.com",
      DOB: "19/9/1998",
      gender: "female",
      avatarUrl:
          "http://www.usanetwork.com/sites/usanetwork/files/styles/629x720/public/suits_cast_harvey.jpg?itok=fpTOeeBb",
    ),
    new ChatModel(
      name: "BClient",
      email: "ngovi.2298@gmail.com",
      DOB: "19/9/1998",
      gender: "female",
      avatarUrl:
          "http://www.usanetwork.com/sites/usanetwork/files/styles/629x720/public/suits_cast_harvey.jpg?itok=fpTOeeBb",
    ),
    new ChatModel(
      name: "VClient",
      email: "ClientEmail@Email.com",
      DOB: "19/9/1998",
      gender: "female",
      avatarUrl:
          "http://www.usanetwork.com/sites/usanetwork/files/styles/629x720/public/suits_cast_harvey.jpg?itok=fpTOeeBb",
    ),
  ];
  final String emailName;
  DataSearch(this.emailName);

  @override
  Widget buildSuggestions(BuildContext context) {
    final List<ChatModel> suggesttionList = query.isEmpty
        ? fakeData
        : fakeData
            .where(
                (item) => item.name.toLowerCase().contains(query.toLowerCase()))
            .toList();
    return ListView.builder(
      itemBuilder: (context, index) => ListTile(
        onTap: () {
          selectedItem = suggesttionList[index];
          Navigator.pop(context,selectedItem.name.toString());
          //showResults(context);
        },
        leading: new CircleAvatar(
          foregroundColor: Theme.of(context).primaryColor,
          backgroundColor: Colors.grey,
          backgroundImage: NetworkImage(suggesttionList[index].avatarUrl),
        ),
        title: Text(suggesttionList[index].name),
      ),
      itemCount: suggesttionList.length,
    );
  }

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
          icon: Icon(Icons.clear),
          onPressed: () {
            query = '';
          })
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
        icon: AnimatedIcon(
            icon: AnimatedIcons.menu_arrow, progress: transitionAnimation),
        onPressed: () {
          Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>SendEmail(emailName)), (route) => false);
        });
  }

  @override
  Widget buildResults(BuildContext context) {
    return Container(
        child: Row(
      children: <Widget>[
        Expanded(
          child: ListTile(
            onTap: () {

            },
            leading: new CircleAvatar(
              foregroundColor: Theme.of(context).primaryColor,
              backgroundColor: Colors.grey,
              backgroundImage: new NetworkImage(selectedItem.avatarUrl),
            ),
            title: Text(selectedItem.name),
          ),
        ),
      ],
    ));
  }
}
