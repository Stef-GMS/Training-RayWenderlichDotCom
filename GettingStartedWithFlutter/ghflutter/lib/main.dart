import 'package:flutter/material.dart';
import 'strings.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

void main() => runApp(GHFlutterApp());

class GHFlutterApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: Strings.appTitle,
      home: GHFlutter(),
    );
  }
}

class GHFlutterState extends State<GHFlutter> {
  var _members = [];

  final _biggerFont = const TextStyle(fontSize: 18.0);

  _loadData() async {
    String dataURL = "https://api.github.com/orgs/raywenderlich/members";
    http.Response response = await http.get(dataURL);
    setState(() {
      _members = json.decode(response.body);
    });
  }

  @override
  void initState() {
    super.initState();

    _loadData();
  }

  Widget _buildRow(int i) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListTile(
        title: Text("${_members[i]["login"]}", style: _biggerFont),
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
