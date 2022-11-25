import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';

class second extends StatefulWidget {
  String s1;

  second(this.s1);

  @override
  State<second> createState() => _secondState();
}

class _secondState extends State<second> {
  bool status = false;
  String n = "Start the game";
  String p1 = "";
  String p2 = "";
  List<String> l = List.filled(9, "");
  List temp = [];
  int t = 0, cnt = 0, i = 0;
  bool winner = false;

  @override
  void initState() {
    super.initState();
    if (widget.s1 == "O") {
      p1 = widget.s1;
      p2 = "X";
    } else if (widget.s1 == "X") {
      p1 = widget.s1;
      p2 = "O";
    }
  }

  @override
  Widget build(BuildContext context) {
    double statusbar = MediaQuery.of(context).padding.top;
    return Scaffold(
      backgroundColor: Color(0xff20267a),
      body: Container(
        margin: EdgeInsets.only(top: statusbar),
        child: Column(
          children: [
            Align(
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text("Turn on/off two \nPlayer",
                        style: TextStyle(
                            letterSpacing: 2,
                            fontWeight: FontWeight.w400,
                            fontSize: 20,
                            color: Colors.white),
                        textAlign: TextAlign.center),
                    FlutterSwitch(
                      height: 35,
                      width: 70,
                      borderRadius: 30,
                      // activeText: "",
                      toggleSize: 30,
                      activeSwitchBorder:
                          Border.all(color: Colors.red, width: 3),
                      // switchBorder: Border.all(color: Colors.indigo, width: 2),
                      activeTextFontWeight: FontWeight.w400,
                      inactiveTextFontWeight: FontWeight.w300,
                      showOnOff: true,
                      activeColor: Colors.green,
                      inactiveColor: Colors.grey,
                      onToggle: (value) {
                        setState(() {
                          status = value;
                        });
                      },
                      value: status,
                    ),
                  ]),
            ),
            SizedBox(
              width: double.infinity,
              height: 40,
              child: Text(
                "It'S ${widget.s1} TURN",
                style: TextStyle(color: Colors.white, fontSize: 30),
                textAlign: TextAlign.center,
              ),
            ),
            Container(
              margin: EdgeInsets.only(right: 10, left: 10),
              height: 370,
              child: GridView.builder(
                itemCount: l.length,
                itemBuilder: (context, index) {
                  return DecoratedBox(
                    child: InkWell(
                      onTap: (status == true)
                          ? (l[index] == "" && winner == false)
                              ? () {
                                    if (index % 2 == 0) {
                                      l[index] = p1;
                                    } else {
                                      l[index] = p2;
                                    }
                                    i++;
                                    print("ht t= $i");
                                    win();
                                    abc();
                                    setState(() {});
                                }
                              : null
                          : (l[index] == "" && winner == false)
                              ? () {
                                  setState(() {
                                    if (l[index] == "") {
                                      l[index] = p1;
                                      temp.add(index);
                                      cnt++;
                                      print("cnt =$cnt");
                                    }
                                    if (cnt <= 4) {
                                      while (true) {
                                        int random = Random().nextInt(9);
                                        if (!temp.contains(random)) {
                                          l[random] = p2;
                                          temp.add(random);
                                          break;
                                        }
                                      }
                                    }
                                    t++;
                                    print("t = $t");
                                    win();
                                    abc();
                                  });
                                }
                              : null,
                      child: Center(
                          child: Text(
                        "${l[index]}",
                        style: TextStyle(fontSize: 35),
                        textAlign: TextAlign.center,
                      )),
                    ),
                    decoration: BoxDecoration(
                        color: Colors.indigo,
                        borderRadius: BorderRadius.all(Radius.circular(15))),
                  );
                },
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisSpacing: 7, mainAxisSpacing: 7, crossAxisCount: 3),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            SizedBox(
                height: 40,
                child: Text(
                  "$n",
                  style: TextStyle(fontSize: 20, color: Colors.white),
                )),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    fixedSize: Size(200, 50),
                    primary: Colors.white,
                    elevation: 10,
                    onPrimary: Colors.purpleAccent),
                onPressed: () {
                  reset();
                },
                child: Text(
                  "🔄 Replay",
                  style: TextStyle(color: Colors.black),
                ))
          ],
        ),
      ),
    );
  }

  win() {
    if ((l[0] == p1 && l[1] == p1 && l[2] == p1) ||
        (l[3] == p1 && l[4] == p1 && l[5] == p1) ||
        (l[6] == p1 && l[7] == p1 && l[8] == p1) ||
        (l[0] == p1 && l[3] == p1 && l[6] == p1) ||
        (l[1] == p1 && l[4] == p1 && l[7] == p1) ||
        (l[2] == p1 && l[5] == p1 && l[8] == p1) ||
        (l[0] == p1 && l[4] == p1 && l[8] == p1) ||
        (l[2] == p1 && l[4] == p1 && l[6] == p1)) {
      n = "$p1 winner.";
      winner = true;
    } else if ((l[0] == p2 && l[1] == p2 && l[2] == p2) ||
        (l[3] == p2 && l[4] == p2 && l[5] == p2) ||
        (l[6] == p2 && l[7] == p2 && l[8] == p2) ||
        (l[0] == p2 && l[3] == p2 && l[6] == p2) ||
        (l[1] == p2 && l[4] == p2 && l[7] == p2) ||
        (l[2] == p2 && l[5] == p2 && l[8] == p2) ||
        (l[0] == p2 && l[4] == p2 && l[8] == p2) ||
        (l[2] == p2 && l[4] == p2 && l[6] == p2)) {
      n = "$p2 winner.";
      winner = true;
    } else if (t == 5) {
      n = "Game is Draw..";
      print("Game is draw");
    } else if (i > 8) {
      n = "Game is Draw1..";
      print("Game is draw");
    }
  }

  abc() {
    if (t == 1) {
      n = "Game is running 🤹‍🤹‍‍";
    }
    if (i == 1) {
      n = "Game is running 🤹‍🤹‍‍";
    }
  }

  reset() {
    l = List.filled(9, "");
    i = 0;
    temp.clear();
    cnt = 0;
    t = 0;

    if (cnt == 0) {
      n = "Plz start game";
    }
    setState(() {});
    print("Hardik");
    winner == false;
    print("Hardik Beladiya");
  }
}
