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
              spacing: 15,
              children: [
                Container(
                    padding: EdgeInsets.all(5.0),
                    width: 110,
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
                    width: 110,
                    // color: Colors.amber,
                    child: Card(
                      color: Colors.white,
                      clipBehavior: Clip.antiAlias,
                      shadowColor: Colors.black,
                      child: Column(
                        children: [
                          ListTile(
                            title: const Text(
                              'B',
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
                    width: 110,
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
                    width: 110,
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
                    width: 110,
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
                    width: 110,
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
                    width: 110,
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
                  width: 300,
                  height: 100,
                  child: Column(children: [
                    ListTile(
                        title: const Text(
                      'Please choose a language from above. You can change language from profile settings later.',
                    ))
                  ]),
                ),
                Container(),
                TextButton(
                  child: Text(
                    'Continue',
                    style: TextStyle(
                        backgroundColor: Colors.green[400],
                        fontSize: 20,
                        color: Colors.white),
                  ),
                  onPressed: () {},
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
