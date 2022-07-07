import 'package:flutter/material.dart';

class MyChannel extends StatefulWidget {
  const MyChannel({Key? key}) : super(key: key);

  @override
  State<MyChannel> createState() => _MyChannelState();
}

class _MyChannelState extends State<MyChannel> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hi PogenZ Channel'),
      ),
    );
  }
}
