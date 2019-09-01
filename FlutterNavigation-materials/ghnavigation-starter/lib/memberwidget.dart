import 'package:flutter/material.dart';
import 'member.dart';

class MemberState extends State<MemberWidget> {
  // give MemberState a Member property and a constructor.
  final Member member;

  MemberState(this.member);

  @override
  Widget build(BuildContext context) {
    // You’re creating a Scaffold, a material design container,
    // which holds an AppBar and a Padding with a child Image
    // for the member avatar.
    return Scaffold(
      appBar: AppBar(
        title: Text(member.login),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            Image.network(member.avatarUrl),
            IconButton(
              icon: Icon(
                Icons.arrow_back,
                color: Colors.green,
                size: 48.0,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}

class MemberWidget extends StatefulWidget {
  // 1 Add a Member property for the widget.
  final Member member;

  MemberWidget(this.member) {
    // 2 Make sure the member argument is not null in the widget constructor.
    if (member == null) {
      throw ArgumentError(
          "member of MemberWidget cannot be null.  Received: '$member'");
    }
  }

  // 3 Use a MemberState class for the state, passing along a Member object to the MemberState.
  @override
  createState() => MemberState(member);
}
