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

import 'package:flutter/material.dart';

import 'member.dart';

class MemberState extends State<MemberWidget> {
  final Member member;

  MemberState(this.member);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(member.login),
        ),
        body: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(children: [
            Image.network(member.avatarUrl),
            IconButton(
                icon: Icon(Icons.arrow_back, color: Colors.green, size: 48.0),
                onPressed: () {
                  Navigator.pop(context);
                }),
            RaisedButton(
                child: Text('PRESS ME'),
                onPressed: () {
                  _showOKScreen(context);
                })
          ]),
        ));
  }

  _showOKScreen(BuildContext context) async {
    bool value = await Navigator.push(context,
        MaterialPageRoute<bool>(builder: (BuildContext context) {
      return Padding(
          padding: const EdgeInsets.all(32.0),
          child: Column(children: [
            GestureDetector(
                child: Text('OK'),
                onTap: () {
                  Navigator.pop(context, true);
                }),
            GestureDetector(
                child: Text('NOT OK'),
                onTap: () {
                  Navigator.pop(context, false);
                })
          ]));
    }));
    var alert = AlertDialog(
      content: Text((value != null && value)
          ? "OK was pressed"
          : "NOT OK or BACK was pressed"),
      actions: <Widget>[
        FlatButton(
            child: Text('OK'),
            onPressed: () {
              Navigator.pop(context);
            })
      ],
    );
    showDialog(context: context, child: alert);
  }
}

class MemberWidget extends StatefulWidget {
  final Member member;

  MemberWidget(this.member) {
    if (member == null) {
      throw ArgumentError("member of MemberWidget cannot be null. "
          "Received: '$member'");
    }
  }

  @override
  createState() => MemberState(member);
}
