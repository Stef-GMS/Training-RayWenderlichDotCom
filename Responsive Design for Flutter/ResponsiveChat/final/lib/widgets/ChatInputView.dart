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
import 'package:flutter/widgets.dart';

class ChatInputView extends StatelessWidget {
  final Function(bool) onShowGallery;

  const ChatInputView({Key key, this.onShowGallery}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: <Widget>[
            IconButton(
              alignment: Alignment.center,
              onPressed: () => _showGallery(context),
              icon: Icon(Icons.attach_file),
            ),
            Expanded(
              child: TextField(
                decoration: InputDecoration(
                  border: null,
                  hintText: "Type your thoughts here...",
                ),
              ),
            ),
            IconButton(
              onPressed: () => _send(context),
              icon: Icon(Icons.send),
            ),
          ],
        ),
      ),
    );
  }

  _showGallery(BuildContext context) {
    onShowGallery(true);
  }

  _send(BuildContext context) {
    Alerts.showTBI(context);
  }
}

class Alerts {
  static showTBI(BuildContext context) {
    showAlert(context, "To be implemented");
  }

  static showAlert(BuildContext context, String text,
      [VoidCallback onPressed]) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
            title: Text(text),
            actions: <Widget>[
              FlatButton(
                child: Text("OK"),
                onPressed: onPressed ?? () => Navigator.pop(context),
              )
            ],
          ),
    );
  }
}
