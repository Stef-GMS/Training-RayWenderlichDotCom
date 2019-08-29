import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';

import 'member.dart';
import 'strings.dart';

class GHFlutterState extends State<GHFlutter> {
  var _members = <Member>[];

  final _biggerFont = const TextStyle(fontSize: 18.0);

  _loadData() async {
    String dataURL = "https://api.github.com/orgs/raywenderlich/members";

    http.Response response = await http.get(dataURL);

    setState(() {
      final membersJSON = json.decode(response.body);

      for (var memberJSON in membersJSON) {
        final member = Member(
          memberJSON["login"],
          memberJSON["avatar_url"],
        );
        _members.add(member);
      }
    });
  }

  @override
  void initState() {
    super.initState();

    _loadData();
  }

  Widget _buildRow(int i) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ListTile(
        title: Text("${_members[i].login}", style: _biggerFont),
        leading: CircleAvatar(
          backgroundColor: Colors.green,
          backgroundImage: NetworkImage(_members[i].avatarURL),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Strings.appTitle),
      ),
      body: ListView.builder(
          //padding: const EdgeInsets.all(16.0),  //moved to _buildRow
          itemCount: _members.length * 2,
          itemBuilder: (BuildContext context, int position) {
            //either return a Divider() or calculated a new index
            if (position.isOdd) return Divider();

            final index = position ~/ 2;

            return _buildRow(index);
          }),
    );
  }
}

class GHFlutter extends StatefulWidget {
  @override
  createState() => GHFlutterState();
}
