import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';

class HelloScreen extends StatefulWidget {
  const HelloScreen({Key key}) : super(key: key);

  @override
  _HelloScreenState createState() => _HelloScreenState();
}

class _HelloScreenState extends State<HelloScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      color: Colors.white,
      padding: EdgeInsets.all(20.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Column(children: [
              Text(
                "Choose Language",
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              Text(
                "Welcome to apna app",
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.normal),
              )
            ]),
            Wrap(
              crossAxisAlignment: WrapCrossAlignment.center,
              spacing: 5,
              children: [
                Container(
                    padding: EdgeInsets.all(5.0),
                    width: 100,
                    height: 90,
                    child: Card(
                      color: Colors.white,
                      clipBehavior: Clip.antiAlias,
                      shadowColor: Colors.black,
                      child: Column(
                        children: [
                          ListTile(
                            title: const Text(
                              'A',
                              textAlign: TextAlign.center,
                            ),
                            subtitle: Text(
                              'Hindi',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.black.withOpacity(0.6)),
                            ),
                          ),
                        ],
                      ),
                    )),
                Container(
                    padding: EdgeInsets.all(5.0),
                    width: 100,
                    height: 90,
                    // color: Colors.amber,
                    child: Card(
                      color: Colors.white,
                      clipBehavior: Clip.antiAlias,
                      shadowColor: Colors.black,
                      child: Column(
                        children: [
                          ListTile(
                            title: const Text(
                              'A',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontWeight: FontWeight.w900, fontSize: 20.0),
                            ),
                            subtitle: Text(
                              'English',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.black.withOpacity(0.6)),
                            ),
                          ),
                        ],
                      ),
                    )),
                Container(
                    padding: EdgeInsets.all(5.0),
                    width: 105,
                    height: 90,
                    // color: Colors.amber,
                    child: Card(
                      color: Colors.white,
                      clipBehavior: Clip.antiAlias,
                      shadowColor: Colors.black,
                      child: Column(
                        children: [
                          ListTile(
                            title: const Text(
                              'C',
                              textAlign: TextAlign.center,
                            ),
                            subtitle: Text(
                              'Kannada',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.black.withOpacity(0.6)),
                            ),
                          ),
                        ],
                      ),
                    )),
                Container(
                    padding: EdgeInsets.all(5.0),
                    width: 100,
                    height: 90,
                    // color: Colors.amber,
                    child: Card(
                      color: Colors.white,
                      clipBehavior: Clip.antiAlias,
                      shadowColor: Colors.black,
                      child: Column(
                        children: [
                          ListTile(
                            title: const Text(
                              'C',
                              textAlign: TextAlign.center,
                            ),
                            subtitle: Text(
                              'Bengali',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.black.withOpacity(0.6)),
                            ),
                          ),
                        ],
                      ),
                    )),
                Container(
                    padding: EdgeInsets.all(5.0),
                    width: 100,
                    height: 90,
                    // color: Colors.amber,
                    child: Card(
                      color: Colors.white,
                      clipBehavior: Clip.antiAlias,
                      shadowColor: Colors.black,
                      child: Column(
                        children: [
                          ListTile(
                            title: const Text(
                              'C',
                              textAlign: TextAlign.center,
                            ),
                            subtitle: Text(
                              'Telugu',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.black.withOpacity(0.6)),
                            ),
                          ),
                        ],
                      ),
                    )),
                Container(
                    padding: EdgeInsets.all(5.0),
                    width: 100,
                    height: 90,
                    // color: Colors.amber,
                    child: Card(
                      color: Colors.white,
                      clipBehavior: Clip.antiAlias,
                      shadowColor: Colors.black,
                      child: Column(
                        children: [
                          ListTile(
                            title: const Text(
                              'C',
                              textAlign: TextAlign.center,
                            ),
                            subtitle: Text(
                              'Tamil',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.black.withOpacity(0.6)),
                            ),
                          ),
                        ],
                      ),
                    )),
                Container(
                    padding: EdgeInsets.all(5.0),
                    width: 100,
                    height: 90,
                    // color: Colors.amber,
                    child: Card(
                      color: Colors.white,
                      clipBehavior: Clip.antiAlias,
                      shadowColor: Colors.black,
                      child: Column(
                        children: [
                          ListTile(
                            title: const Text(
                              'C',
                              textAlign: TextAlign.center,
                            ),
                            subtitle: Text(
                              'Gujarati',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.black.withOpacity(0.6)),
                            ),
                          ),
                        ],
                      ),
                    )),
                Container(
                    padding: EdgeInsets.all(5.0),
                    width: 100,
                    height: 90,
                    // color: Colors.amber,
                    child: Card(
                      color: Colors.white,
                      clipBehavior: Clip.antiAlias,
                      shadowColor: Colors.black,
                      child: Column(
                        children: [
                          ListTile(
                            title: const Text(
                              'C',
                              textAlign: TextAlign.center,
                            ),
                            subtitle: Text(
                              'Marathi',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.black.withOpacity(0.6)),
                            ),
                          ),
                        ],
                      ),
                    )),
                Container(
                    padding: EdgeInsets.all(5.0),
                    width: 100,
                    height: 90,
                    // color: Colors.amber,
                    child: Card(
                      color: Colors.white,
                      clipBehavior: Clip.antiAlias,
                      shadowColor: Colors.black,
                      child: Column(
                        children: [
                          ListTile(
                            title: const Text(
                              'C',
                              textAlign: TextAlign.center,
                            ),
                            subtitle: Text(
                              'Odiya',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.black.withOpacity(0.6)),
                            ),
                          ),
                        ],
                      ),
                    )),
                Container(
                    padding: EdgeInsets.all(5.0),
                    width: 110,
                    height: 90,
                    // color: Colors.amber,
                    child: Card(
                      color: Colors.white,
                      clipBehavior: Clip.antiAlias,
                      shadowColor: Colors.black,
                      child: Column(
                        children: [
                          ListTile(
                            title: const Text(
                              'C',
                              textAlign: TextAlign.center,
                            ),
                            subtitle: Text(
                              'Assames',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.black.withOpacity(0.6)),
                            ),
                          ),
                        ],
                      ),
                    )),
                Container(
                    padding: EdgeInsets.all(5.0),
                    width: 110,
                    height: 90,
                    // color: Colors.amber,
                    child: Card(
                      color: Colors.white,
                      clipBehavior: Clip.antiAlias,
                      shadowColor: Colors.black,
                      child: Column(
                        children: [
                          ListTile(
                            title: const Text(
                              'D',
                              textAlign: TextAlign.center,
                            ),
                            subtitle: Text(
                              'Malayala',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.black.withOpacity(0.6)),
                            ),
                          ),
                        ],
                      ),
                    )),
                Container(
                  width: 300,
                  height: 100,
                  child: Card(
                    clipBehavior: Clip.antiAlias,
                    color: Colors.brown[50],
                    child: Column(
                      children: [
                        ListTile(
                            title: const Text(
                          'Please choose a language from above. You can change language from profile settings later.',
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.brown),
                        )),
                      ],
                    ),
                  ),
                ),
                Container(),
                Center(
                  child: ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.green[200])),
                    child: Text(
                      'Continue',
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                    onPressed: () {
                      // Respond to button press
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
