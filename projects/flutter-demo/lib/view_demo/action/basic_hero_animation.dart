// Copyright 2017 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can
// be found in the LICENSE file.

// Demonstrates a basic shared element (Hero) animation.

import 'package:flutter/material.dart';

void main() {
  runApp(new MaterialApp(home: new BasicHeroAnimation()));
}

class BasicHeroAnimation extends StatelessWidget {
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: const Text('Basic Hero Animation'),
      ),
      body: new Center(
        child: new InkWell(
          onTap: () {
            Navigator.of(context).push(
              new MaterialPageRoute<Null>(
                builder: (BuildContext context) {
                  return new Scaffold(
                    appBar: new AppBar(
                      title: const Text('Flippers Page'),
                    ),
                    body: new Container(
                      padding: const EdgeInsets.all(8.0),
                      alignment: Alignment.topLeft,
                      // Use background color to emphasize that it's a new route.
                      color: Colors.lightBlueAccent,
                      child: new Hero(
                        tag: 'flippers',
                        child: new SizedBox(
                          width: 100.0,
                          child: new Image.asset(
                            'images/top.png',
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            );
          },
          // Main route
          child: new Hero(
            tag: 'flippers',
            child: new Image.asset(
              'images/top.png',
            ),
          ),
        ),
      ),
    );
  }
}
