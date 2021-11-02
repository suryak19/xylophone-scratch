import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'package:audioplayers/audioplayers.dart';

void main() => runApp(const Xylophone());

class Xylophone extends StatelessWidget {
  const Xylophone({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey,
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              buildKey(1,Colors.yellow),
              buildKey(2,Colors.red),
              buildKey(3,Colors.orange),
              buildKey(4,Colors.blueAccent),
              buildKey(5,Colors.pinkAccent),
              buildKey(6,Colors.purpleAccent),
              buildKey(7,Colors.teal),
            ],
          ),
        ),
      ),
    );
  }

  Expanded buildKey(int key,Color color) {
    return Expanded(
      child: MaterialButton(
        color: color,
        onPressed: () {
          playSound(key);
        },
      ),
    );
  }

  void playSound(int count) {
    final player = new AudioCache();
    player.play('note$count.wav');
  }
}