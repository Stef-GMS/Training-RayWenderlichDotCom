/*
 * Copyright (c) 2019 Razeware LLC
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
 */

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsivechat/ConversationPage.dart';
import 'package:responsivechat/widgets/ConversationListItem.dart';

import 'models/ChatApp.dart';
import 'models/Conversation.dart';
import 'models/User.dart';

class ChatListPage extends StatefulWidget {
  @override
  _ChatListPageState createState() => _ChatListPageState();
}

class _ChatListPageState extends State<ChatListPage> {
  var selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    // 1 First, you check the orientation from MediaQuery.
    //   If it’s landscape, then you have a details page.
    var hasDetailPage =
        MediaQuery.of(context).orientation == Orientation.landscape;

    // 2 Second, you declare a child widget to use later.
    Widget child;

    if (hasDetailPage) {
      // 3 Next, if you have a details page, you declare the child as a row of widgets.
      child = Row(
        children: [
          // 4 For this, the row contains the list of chats as a first item.
          SizedBox(
            width: 250,
            height: double.infinity,
            child: _buildList(context, hasDetailPage),
          ),

          // 5 Then, the next item in the row is the chat page showing the conversation.
          Expanded(child: _buildChat(context, selectedIndex)),
        ],
      );
    } else {
      // 6 If you don’t have a details page, the child will be the list of chats.
      child = _buildList(context, hasDetailPage);
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("Chats"),
      ),
      body: SafeArea(
        // 7 Finally, you need to assign that child widget you created as a child of SafeArea.
        child: child,
      ),
    );
  }

  _buildList(BuildContext context, bool hasDetailPage) {
    var chat = Provider.of<ChatApp>(context);

    return ListView.separated(
      itemCount: chat.conversations.length,
      separatorBuilder: (context, index) => Divider(
        color: Colors.black.withAlpha(50),
      ),
      itemBuilder: (context, index) {
        Conversation conversation = chat.conversations[index];
        List<User> users =
            conversation.senderIds.map((id) => chat.users[id]).toList();
        String userNames = users.map((user) => user.name).join(", ");

        return GestureDetector(
          onTap: () {
            if (hasDetailPage) {
              setState(() {
                selectedIndex = index;
              });
            } else {
              Navigator.pushNamed(
                context,
                "/chat",
                arguments: {"index": index},
              );
            }
          },
          child: ConversationListItem(
              userNames: userNames, conversation: conversation),
        );
      },
    );
  }

  _buildChat(BuildContext context, int index) {
    var chat = Provider.of<ChatApp>(context);

    Conversation conversation = chat.conversations[index];
    return Container(
      color: Colors.black.withAlpha(10),
      child: ConversationPage(
        isDetail: true,
        conversation: conversation,
      ),
    );
  }
}
