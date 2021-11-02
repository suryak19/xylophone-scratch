import 'dart:io';

import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'package:audioplayers/audioplayers.dart';

void main() => runApp(Xylophone());

class Xylophone extends StatelessWidget {
  // const Xylophone({Key? key}) : super(key: key);

  StringBuffer recorded = new StringBuffer("");
  String recorded2 = "";
  bool record = false;

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey,
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Expanded(
                      child: MaterialButton(
                        color: Colors.red,
                        onPressed: (){
                          record = true;
                          print('Recording Started, Previous recording will be flushed');
                        },
                        child: Text('Record'),
                      ),
                    ),
                    Expanded(
                      child: MaterialButton(
                        color: Colors.white10,
                        onPressed: (){
                          record = false;
                          print('Recorded String - $recorded2');
                        },
                        child: Text('Stop'),
                      ),
                    ),
                    Expanded(
                      child: MaterialButton(
                        color: Colors.greenAccent,
                        onPressed: (){
                          if(!record) {
                            playRecordedSoundString(recorded2);
                          }else{
                            print('Cannot play as RECORDING in progress');
                          }
                        },
                        child: Text('Play'),
                      ),
                    )
                  ],
                ),
              ),
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
    print('record value is $record');
    if(record){
      recorded.write(key);
      recorded2+='$key';
      print('$recorded2 and $key value');
    }

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

  void playRecordedSound(StringBuffer recorded) {
    String recordedString = recorded.toString();
    playRecordedSoundString(recordedString);
  }

  void playRecordedSoundString(String recordedString) {
    for(int i=0;i<recordedString.length;i++){
      playSound(int.parse(recordedString[i]));
      // sleep(1000);
      sleep(new Duration(seconds: 1));
    }
  }


}