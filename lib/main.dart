import 'package:flutter/material.dart';

import 'first.dart';

void main() {
  runApp(MaterialApp(
    home: first(),
    // theme: ThemeData(brightness: Brightness.dark),
  ));
}
/*
                  return Container(
                    child: (status == true)
                        ? (InkWell(
                            onTap: (l[index] == "" && winner == false)
                                ? () {
                                    setState(() {
                                      if (cnt % 2 == 0) {
                                        l[index] = p1;
                                      } else {
                                        l[index] = p2;
                                      }
                                      cnt++;
                                      print("ht t= $cnt");
                                      win();
                                      abc();
                                    });
                                  }
                                : null,
                            child: Center(
                                child: Text(
                              "${l[index]}",
                              style: TextStyle(fontSize: 30),
                              textAlign: TextAlign.center,
                            )),
                          ))
                        : InkWell(
                            onTap: (l[index] == "" && winner == false)
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
                              style: TextStyle(fontSize: 30),
                              textAlign: TextAlign.center,
                            )),
                          ),
                    decoration: BoxDecoration(
                        color: Colors.indigo,
                        borderRadius: BorderRadius.all(Radius.circular(15))),
                  );

 */