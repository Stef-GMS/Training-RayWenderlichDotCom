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

import 'package:responsivechat/models/Conversation.dart';
import 'package:responsivechat/models/Message.dart';
import 'package:responsivechat/models/User.dart';

class Demo {
  static List<Conversation> conversation = [
    Conversation(
      [
        Message(
            text: 'Hello, is this a Flutter tutorial?',
            senderId: 'android',
            timestamp: DateTime.now().subtract(Duration(days: 2))),
        Message(
            text: 'No, this is Patrick',
            senderId: 'swift',
            timestamp: DateTime.now().subtract(Duration(days: 1))),
        Message(
            text: 'Hello, is this a Flutter tutorial?',
            senderId: 'android',
            timestamp: DateTime.now().subtract(Duration(days: 2))),
        Message(
            text: 'No, this is Patrick..',
            senderId: 'swift',
            timestamp: DateTime.now().subtract(Duration(days: 1))),
        Message(
            text: 'Hello, is this a Flutter tutorial?',
            senderId: 'android',
            timestamp: DateTime.now().subtract(Duration(days: 2))),
        Message(
            text: 'No, this is Patrick!',
            senderId: 'swift',
            timestamp: DateTime.now().subtract(Duration(days: 1))),
        Message(
            text: 'Calm down peeps :)',
            senderId: 'you',
            timestamp: DateTime.now().subtract(Duration(days: 1))),
      ],
    ),
    Conversation(
      [
        Message(
            text: 'Hello, can i go through this road here?',
            senderId: 'swift',
            timestamp: DateTime.now().subtract(Duration(days: 2))),
        Message(
            text: 'You shall not pass ;)',
            senderId: 'android',
            timestamp: DateTime.now().subtract(Duration(days: 1))),
        Message(
            text: 'Just kidding of course you can.',
            senderId: 'android',
            timestamp: DateTime.now().subtract(Duration(days: 1))),
      ],
    ),
    Conversation(
      [
        Message(
            text: 'Who lives in a pineapple under the sea',
            senderId: 'swift',
            timestamp: DateTime.now().subtract(Duration(days: 2))),
        Message(
            text: 'Spongebob Squarepants!',
            senderId: 'android',
            timestamp: DateTime.now().subtract(Duration(days: 1))),
        Message(
            text: 'Absorbent and yellow and porous is he',
            senderId: 'swift',
            timestamp: DateTime.now().subtract(Duration(days: 1))),
        Message(
            text: 'Spongebob Squarepants!',
            senderId: 'android',
            timestamp: DateTime.now().subtract(Duration(days: 1))),
        Message(
            text: 'If nautical nonsense be something you wish!',
            senderId: 'swift',
            timestamp: DateTime.now().subtract(Duration(days: 1))),
        Message(
            text: 'Spongebob Squarepants!',
            senderId: 'android',
            timestamp: DateTime.now().subtract(Duration(days: 1))),
        Message(
            text: 'Then drop on the deck and flop like a fish!',
            senderId: 'swift',
            timestamp: DateTime.now().subtract(Duration(days: 1))),
        Message(
            text:
                'Spongebob Squarepants! Spongebob Squarepants! Spongebob Squarepants! Spongebob Squarepants! Spongebob Squarepants! Spongebob Squarepants!',
            senderId: 'android',
            timestamp: DateTime.now().subtract(Duration(days: 1))),
      ],
    ),
  ];

  static Map<String, User> users = {
    'swift': User(id: 'swift', name: 'Swifty Macky', photoUrl: ''),
    'android': User(id: 'android', name: 'Androidy Googler', photoUrl: ''),
    'you': User(id: 'you', name: 'You D. Best', photoUrl: ''),
  };
}
