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
import 'dart:math';

class AvatarImageView extends StatelessWidget {
  final String name;
  final String photoUrl;
  final Color color;
  final int letterCount;

  AvatarImageView({
    this.name,
    this.photoUrl,
    this.color = Colors.white,
    this.letterCount = 2,
  });

  @override
  Widget build(BuildContext context) {
    final colors = _pickColors();

    return ClipRRect(
      borderRadius: BorderRadius.all(Radius.circular(7.0)),
      child: Container(
        color: colors[0],
        child: _buildContent(colors[1]),
      ),
    );
  }

  _pickColors() {
    var colors = [
      [Color(0xff6292e6), Color(0xffffffff)],
      [Color(0xffff8484), Color(0xffffffff)],
      [Color(0xfff5a623), Color(0xffffffff)],
      [Color(0xff99bdfb), Color(0xffffffff)],
    ];

    final rand = Random(name.hashCode).nextInt(colors.length);
    return colors[rand];
  }

  _buildContent(Color textColor) {
    if (photoUrl.isEmpty) {
      final initials = name
          .trim()
          .split(' ')
          .map((word) => word.substring(0, 1))
          .take(letterCount)
          .join()
          .toUpperCase();
      return FittedBox(
        fit: BoxFit.contain,
        child: Text(
          initials,
          style: TextStyle(color: textColor, fontSize: 14),
        ),
      );
    } else {
      return Image.network(
        photoUrl,
      );
    }
  }
}
