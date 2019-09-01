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
              }, //onPressed
            ),
            RaisedButton(
              child: Text("PRESS ME"),
              onPressed: () {
                _showOKScreen(context);
              }, // onPressed
            ),
          ],
        ),
      ),
    );
  } // build

  _showOKScreen(BuildContext context) async {
    // 1 Push a new MaterialPageRoute onto the stack,
    // this time with a type parameter of bool. The type
    // parameter denotes the type you want to return when going back.

    // 2 Use await when pushing the new route, which
    // waits until the route is popped.
    bool value = await Navigator.push(
      context,
      MaterialPageRoute<bool>(
        builder: (BuildContext context) {
          return Padding(
            padding: const EdgeInsets.all(32.0),

            // 3 The route you push onto the stack has a Column
            // that shows two text widgets with gesture detectors.
            child: Column(
              children: [
                // 4 Tapping on the text widgets causes calls to
                // Navigator to pop the new route off the stack.

                // 5 In the calls to pop(), you pass a return value
                // of true if the user tapped the “OK” text on the
                // screen, and false if the user tapped “NOT OK”.
                // If the user presses the back button instead, the
                // value returned is null.

                GestureDetector(
                    child: Text('OK'),
                    onTap: () {
                      Navigator.pop(context, true);
                    }),
                GestureDetector(
                  child: Text('NOT OK'),
                  onTap: () {
                    Navigator.pop(context, false);
                  },
                )
              ], // children
            ),
          );
        }, //builder: (BuildContext context)
      ),
    ); // await Navigator.push

    // 6 Create an AlertDialog to show the result returned from the route.
    var alert = AlertDialog(
      content: Text((value != null && value)
          ? "OK was pressed"
          : "NOT OK or BACK was pressed"),
      actions: <Widget>[
        FlatButton(
          child: Text('OK'),
          onPressed: () {
            Navigator.pop(
                context); // 7 the AlertDialog itself must be popped off the stack.
          },
        )
      ],
    );

    // 8 call showDialog() to show the alert.
    showDialog(context: context, child: alert);
  } // _showOKScreen

} // MemberState

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
