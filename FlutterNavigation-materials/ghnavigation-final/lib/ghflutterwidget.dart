/*
 * Copyright (c) 2018 Razeware LLC
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *
 * Notwithstanding the foregoing, you may not use, copy, modify, merge, publish,
 * distribute, sublicense, create a derivative work, and/or sell copies of the
 * Software in any work that is designed, intended, or marketed for pedagogical or
 * instructional purposes related to programming, coding, application development,
 * or information technology.  Permission for such use, copying, modification,
 * merger, publication, distribution, sublicensing, creation of derivative works,
 * or sale is expressly withheld.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 * THE SOFTWARE.
 *
 */

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'memberwidget.dart';
import 'member.dart';
import 'strings.dart';

class GHFlutterState extends State<GHFlutterWidget> {
  var _members = <Member>[];

  final _biggerFont = const TextStyle(fontSize: 18.0);

  @override
  void initState() {
    super.initState();

    _loadData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Strings.appTitle),
      ),
      body: ListView.builder(
          itemCount: _members.length * 2,
          itemBuilder: (BuildContext context, int position) {
            if (position.isOdd) return Divider();

            final index = position ~/ 2;

            return _buildRow(index);
          }),
    );
  }

  Widget _buildRow(int i) {
    return Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListTile(
          title: Text("${_members[i].login}", style: _biggerFont),
          leading: CircleAvatar(
              backgroundColor: Colors.green,
              backgroundImage: NetworkImage(_members[i].avatarUrl)),
          onTap: () {
            _pushMember(_members[i]);
          },
        ));
  }

  _loadData() async {
    const String dataURL = Strings.dataUrl;
    http.Response response = await http.get(dataURL);
    setState(() {
      final membersJSON = jsonDecode(response.body);

      for (var memberJSON in membersJSON) {
        final member = Member(memberJSON["login"], memberJSON["avatar_url"]);
        _members.add(member);
      }
    });
  }

  _pushMember(Member member) {
    Navigator.push(
        context,
        PageRouteBuilder(
            opaque: true,
            transitionDuration: const Duration(milliseconds: 1000),
            pageBuilder: (BuildContext context, _, __) {
              return MemberWidget(member);
            },
            transitionsBuilder:
                (_, Animation<double> animation, __, Widget child) {
              return FadeTransition(
                opacity: animation,
                child: RotationTransition(
                  turns: Tween<double>(begin: 0.0, end: 1.0).animate(animation),
                  child: child,
                ),
              );
            }));
  }
}

class GHFlutterWidget extends StatefulWidget {
  @override
  createState() => GHFlutterState();
}
