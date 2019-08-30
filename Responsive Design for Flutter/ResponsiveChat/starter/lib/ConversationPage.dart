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
import 'package:responsivechat/widgets/ChatBubble.dart';
import 'package:responsivechat/widgets/ChatInputView.dart';
import 'package:responsivechat/widgets/SquareGallery.dart';

import 'models/ChatApp.dart';
import 'models/Conversation.dart';

class ConversationPage extends StatefulWidget {
  final Conversation conversation;
  final bool isDetail;

  const ConversationPage({Key key, this.conversation, this.isDetail})
      : super(key: key);

  @override
  _ConversationPageState createState() => _ConversationPageState();
}

class _ConversationPageState extends State<ConversationPage> {
  var isGalleryVisible = false;

  @override
  Widget build(BuildContext context) {
    var chat = Provider.of<ChatApp>(context);

    return Scaffold(
      appBar: !widget.isDetail
          ? AppBar(
              title: Text("Chat"),
            )
          : null,
      body: Container(
        color: Colors.black.withAlpha(10),
        child: Column(
          children: <Widget>[
            Expanded(
              child: ListView.builder(
                itemCount: widget.conversation.messages.length,
                itemBuilder: (context, index) {
                  var message = widget.conversation.messages.toList()[index];
                  var user = chat.users[message.senderId];

                  return ChatBubble(
                    isSender: message.senderId == "swift",
                    message: message,
                    user: user,
                  );
                },
              ),
            ),
            if (!isGalleryVisible)
              ChatInputView(
                  onShowGallery: (isVisible) => {
                        setState(() {
                          isGalleryVisible = true;
                        })
                      }),
            if (isGalleryVisible) _buildGalleryToolbar(context),
            if (isGalleryVisible)
              // TODO: show with aspect ratio 3
              SquareGallery(),
          ],
        ),
      ),
    );
  }

  _buildGalleryToolbar(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Row(
        children: <Widget>[
          IconButton(
            icon: Icon(Icons.close),
            onPressed: () => setState(() {
                  isGalleryVisible = false;
                }),
          )
        ],
      ),
    );
  }
}
