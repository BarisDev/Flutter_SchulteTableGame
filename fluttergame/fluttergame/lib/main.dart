import "package:flutter/material.dart";
import "dart:async";

void main() => runApp(ByApp());

class ByApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Flutter Game",
      home: Home(),
    );
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Flutter Game"),
        ),
        body: Game());
  }
}

class Game extends StatefulWidget {
  @override
  _GameState createState() => _GameState();
}

class _GameState extends State<Game> {
  static int size = 5;
  static var byopacity =
      List<List<int>>.generate(size, (i) => List<int>.generate(size, (j) => 1));
  static int counter;

  static var list = List<int>.generate(25, (i) => i + 1); //1-25
  static var buttonText = List<int>.generate(25, (i) => 0);

  static List<int> shuffleList(List<int> list) {
    List<int> temp = list;
    temp.shuffle();
    list = temp;
    return list;
  }

  static double startOP = 1.0;

  static var sList = shuffleList(list);
  static String startString = 'Press "start"';

  hideButton00() {
    setState(() {
      if (buttonText[0] == counter) {
        byopacity[0][0] = 0;
        counter++;
      }
    });
  }

  hideButton01() {
    setState(() {
      if (buttonText[1] == counter) {
        byopacity[0][1] = 0;
        counter++;
      }
    });
  }

  hideButton02() {
    setState(() {
      if (buttonText[2] == counter) {
        byopacity[0][2] = 0;
        counter++;
      }
    });
  }

  hideButton03() {
    setState(() {
      if (buttonText[3] == counter) {
        byopacity[0][3] = 0;
        counter++;
      }
    });
  }

  hideButton04() {
    setState(() {
      if (buttonText[4] == counter) {
        byopacity[0][4] = 0;
        counter++;
      }
    });
  }

  hideButton10() {
    setState(() {
      if (buttonText[5] == counter) {
        byopacity[1][0] = 0;
        counter++;
      }
    });
  }

  hideButton11() {
    setState(() {
      if (buttonText[6] == counter) {
        byopacity[1][1] = 0;
        counter++;
      }
    });
  }

  hideButton12() {
    setState(() {
      if (buttonText[7] == counter) {
        byopacity[1][2] = 0;
        counter++;
      }
    });
  }

  hideButton13() {
    setState(() {
      if (buttonText[8] == counter) {
        byopacity[1][3] = 0;
        counter++;
      }
    });
  }

  hideButton14() {
    setState(() {
      if (buttonText[9] == counter) {
        byopacity[1][4] = 0;
        counter++;
      }
    });
  }

  hideButton20() {
    setState(() {
      if (buttonText[10] == counter) {
        byopacity[2][0] = 0;
        counter++;
      }
    });
  }

  hideButton21() {
    setState(() {
      if (buttonText[11] == counter) {
        byopacity[2][1] = 0;
        counter++;
      }
    });
  }

  hideButton22() {
    setState(() {
      if (buttonText[12] == counter) {
        byopacity[2][2] = 0;
        counter++;
      }
    });
  }

  hideButton23() {
    setState(() {
      if (buttonText[13] == counter) {
        byopacity[2][3] = 0;
        counter++;
      }
    });
  }

  hideButton24() {
    setState(() {
      if (buttonText[14] == counter) {
        byopacity[2][4] = 0;
        counter++;
      }
    });
  }

  hideButton30() {
    setState(() {
      if (buttonText[15] == counter) {
        byopacity[3][0] = 0;
        counter++;
      }
    });
  }

  hideButton31() {
    setState(() {
      if (buttonText[16] == counter) {
        byopacity[3][1] = 0;
        counter++;
      }
    });
  }

  hideButton32() {
    setState(() {
      if (buttonText[17] == counter) {
        byopacity[3][2] = 0;
        counter++;
      }
    });
  }

  hideButton33() {
    setState(() {
      if (buttonText[18] == counter) {
        byopacity[3][3] = 0;
        counter++;
      }
    });
  }

  hideButton34() {
    setState(() {
      if (buttonText[19] == counter) {
        byopacity[3][4] = 0;
        counter++;
      }
    });
  }

  hideButton40() {
    setState(() {
      if (buttonText[20] == counter) {
        byopacity[4][0] = 0;
        counter++;
      }
    });
  }

  hideButton41() {
    setState(() {
      if (buttonText[21] == counter) {
        byopacity[4][1] = 0;
        counter++;
      }
    });
  }

  hideButton42() {
    setState(() {
      if (buttonText[22] == counter) {
        byopacity[4][2] = 0;
        counter++;
      }
    });
  }

  hideButton43() {
    setState(() {
      if (buttonText[23] == counter) {
        byopacity[4][3] = 0;
        counter++;
      }
    });
  }

  hideButton44() {
    setState(() {
      if (buttonText[24] == counter) {
        byopacity[4][4] = 0;
        counter++;
      }
    });
  }

  showReplay() {
    setState(() {
      if (counter == 25) {
        startOP = 1.0;
        counter = 0;
      }
    });
  }

  //static var stopwatch = new Stopwatch()..start();
  //static String tiktak = stopwatch.elapsedTicks.toString();

  Stream<int> stopWatchStream() {
    StreamController<int> streamController;
    Timer timer;
    Duration timerInterval = Duration(seconds: 1);
    int counter = 0;

    void stopTimer() {
      if (timer != null) {
        timer.cancel();
        timer = null;
        counter = 0;
        streamController.close();
      }
    }

    void tick(_) {
      counter++;
      streamController.add(counter);
    }

    void startTimer() {
      timer = Timer.periodic(timerInterval, tick);
    }

    streamController = StreamController<int>(
      onListen: startTimer,
      onCancel: stopTimer,
      onResume: startTimer,
      onPause: stopTimer,
    );

    return streamController.stream;
  }

  static String hoursStr, minutesStr, secondsStr, highScoreStr = '0';
  static String startButtonString = 'Start';

  highScoreFinder(String a) {
    if (highScoreStr == '0') {
      highScoreStr = a;
    }
    if (int.parse(a) < int.parse(highScoreStr)) {
      highScoreStr = a;
      return highScoreStr;
    } else {
      return highScoreStr;
    }
  }

  start() {
    setState(() {
      for (int i = 0; i < 25; i++) {
        buttonText[i] = sList[i];
      }
      startOP = 0.0;
      startString = 'QUICK!! Press buttons from 1 to 25';
      counter = 1;
    });
    var timerStream = stopWatchStream();
    var timerSubscription = null;
    timerSubscription = timerStream.listen((int newTick) {
      setState(() {
        hoursStr =
            ((newTick / (60 * 60)) % 60).floor().toString().padLeft(2, '0');
        minutesStr = ((newTick / 60) % 60).floor().toString().padLeft(2, '0');
        secondsStr = (newTick % 60).floor().toString().padLeft(2, '0');

        if (counter == 25) {
          timerSubscription.cancel(); //ilk değer ataması olmadan çağırılamaz
          timerStream = null;
          setState(() {
            highScoreStr = highScoreFinder(hoursStr + minutesStr + secondsStr);
            hoursStr = '00';
            minutesStr = '00';
            secondsStr = '00';
            startString = 'Press restart button to restart';
            startOP = 1.0;
            startButtonString = 'Restart';
            //butonlar sıfırlandı
            for (int i = 0; i < 25; i++) {
              buttonText[i] = 0;
            }
            //butonlar aynı değerleri almasın diye tekrardan liste karıştırıldı
            sList = shuffleList(list);
            //butonların opacity'leri 1e alındı, butonlar tekrardan görünür oldu
            for (int i = 0; i < 5; i++) {
              for (int j = 0; j < 5; j++) {
                byopacity[i][j] = 1;
              }
            }
            counter = 1;
          });
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
              padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
              child: Text(startString, style: TextStyle(fontSize: 22))),
          Text(
            "High Score: $highScoreStr",
            style: TextStyle(
              fontSize: 20.0,
            ),
          ),
          Text(
            "$hoursStr:$minutesStr:$secondsStr",
            style: TextStyle(
              fontSize: 20.0,
            ),
          ),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
            Opacity(
              opacity: byopacity[0][0].toDouble(),
              child: RaisedButton(
                  onPressed: hideButton00,
                  child: Text(buttonText[0].toString())),
            ),
            Opacity(
              opacity: byopacity[0][1].toDouble(),
              child: RaisedButton(
                  onPressed: hideButton01,
                  child: Text(buttonText[1].toString())),
            ),
            Opacity(
              opacity: byopacity[0][2].toDouble(),
              child: RaisedButton(
                  onPressed: hideButton02,
                  child: Text(buttonText[2].toString())),
            ),
            Opacity(
              opacity: byopacity[0][3].toDouble(),
              child: RaisedButton(
                  onPressed: hideButton03,
                  child: Text(buttonText[3].toString())),
            ),
            Opacity(
              opacity: byopacity[0][4].toDouble(),
              child: RaisedButton(
                  onPressed: hideButton04,
                  child: Text(buttonText[4].toString())),
            ),
          ]),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
            Opacity(
              opacity: byopacity[1][0].toDouble(),
              child: RaisedButton(
                  onPressed: hideButton10,
                  child: Text(buttonText[5].toString())),
            ),
            Opacity(
              opacity: byopacity[1][1].toDouble(),
              child: RaisedButton(
                  onPressed: hideButton11,
                  child: Text(buttonText[6].toString())),
            ),
            Opacity(
              opacity: byopacity[1][2].toDouble(),
              child: RaisedButton(
                  onPressed: hideButton12,
                  child: Text(buttonText[7].toString())),
            ),
            Opacity(
              opacity: byopacity[1][3].toDouble(),
              child: RaisedButton(
                  onPressed: hideButton13,
                  child: Text(buttonText[8].toString())),
            ),
            Opacity(
              opacity: byopacity[1][4].toDouble(),
              child: RaisedButton(
                  onPressed: hideButton14,
                  child: Text(buttonText[9].toString())),
            ),
          ]),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
            Opacity(
              opacity: byopacity[2][0].toDouble(),
              child: RaisedButton(
                  onPressed: hideButton20,
                  child: Text(buttonText[10].toString())),
            ),
            Opacity(
              opacity: byopacity[2][1].toDouble(),
              child: RaisedButton(
                  onPressed: hideButton21,
                  child: Text(buttonText[11].toString())),
            ),
            Opacity(
              opacity: byopacity[2][2].toDouble(),
              child: RaisedButton(
                  onPressed: hideButton22,
                  child: Text(buttonText[12].toString())),
            ),
            Opacity(
              opacity: byopacity[2][3].toDouble(),
              child: RaisedButton(
                  onPressed: hideButton23,
                  child: Text(buttonText[13].toString())),
            ),
            Opacity(
              opacity: byopacity[2][4].toDouble(),
              child: RaisedButton(
                  onPressed: hideButton24,
                  child: Text(buttonText[14].toString())),
            ),
          ]),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
            Opacity(
              opacity: byopacity[3][0].toDouble(),
              child: RaisedButton(
                  onPressed: hideButton30,
                  child: Text(buttonText[15].toString())),
            ),
            Opacity(
              opacity: byopacity[3][1].toDouble(),
              child: RaisedButton(
                  onPressed: hideButton31,
                  child: Text(buttonText[16].toString())),
            ),
            Opacity(
              opacity: byopacity[3][2].toDouble(),
              child: RaisedButton(
                  onPressed: hideButton32,
                  child: Text(buttonText[17].toString())),
            ),
            Opacity(
              opacity: byopacity[3][3].toDouble(),
              child: RaisedButton(
                  onPressed: hideButton33,
                  child: Text(buttonText[18].toString())),
            ),
            Opacity(
              opacity: byopacity[3][4].toDouble(),
              child: RaisedButton(
                  onPressed: hideButton34,
                  child: Text(buttonText[19].toString())),
            ),
          ]),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
            Opacity(
              opacity: byopacity[4][0].toDouble(),
              child: RaisedButton(
                  onPressed: hideButton40,
                  child: Text(buttonText[20].toString())),
            ),
            Opacity(
              opacity: byopacity[4][1].toDouble(),
              child: RaisedButton(
                  onPressed: hideButton41,
                  child: Text(buttonText[21].toString())),
            ),
            Opacity(
              opacity: byopacity[4][2].toDouble(),
              child: RaisedButton(
                  onPressed: hideButton42,
                  child: Text(buttonText[22].toString())),
            ),
            Opacity(
              opacity: byopacity[4][3].toDouble(),
              child: RaisedButton(
                  onPressed: hideButton43,
                  child: Text(buttonText[23].toString())),
            ),
            Opacity(
              opacity: byopacity[4][4].toDouble(),
              child: RaisedButton(
                  onPressed: hideButton44,
                  child: Text(buttonText[24].toString())),
            ),
          ]),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
            Padding(
                padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
                child: Opacity(
                  opacity: startOP,
                  child: RaisedButton(
                      onPressed: start, child: Text(startButtonString)),
                )),
          ]),
        ],
      )),
    );
  }
}
