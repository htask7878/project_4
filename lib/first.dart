import 'package:flutter/material.dart';
import 'package:project_4/second.dart';

class first extends StatefulWidget {
  const first({Key? key}) : super(key: key);

  @override
  State<first> createState() => _firstState();
}

class _firstState extends State<first> {
  bool c = false;
  bool c1 = false;
  String s1 = "";
  String s2 = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Align(
            heightFactor: 9,
            child: Text("Pick Your Side",
                style: TextStyle(color: Colors.black, fontSize: 20)),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Center(
                child: Image(
                    image: AssetImage("image/o-300x300.png"),
                    height: 100,
                    width: 100),
              ),
              Center(
                child: Image(
                    image: AssetImage("image/pngegg.png"),
                    height: 100,
                    width: 100),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              // Radio(
              //   value: "d",
              //   groupValue: s,
              //   onChanged: (value) {
              //     setState(() {
              //       s = value.toString();
              //     });
              //   },
              // ),
              // Radio(
              //   value: "",
              //   groupValue: s1,
              //   onChanged: (value) {
              //     setState(() {
              //       s1 = value.toString();
              //     });
              //   },
              // ),
              Checkbox(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                onChanged: (value) {
                  setState(() {
                    c = value!;
                  });
                },
                value: c,
              ),
              Checkbox(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                onChanged: (value) {
                  setState(() {
                    c1 = value!;
                  });
                },
                value: c1,
              ),
            ],
          ),
          SizedBox(
            height: 100,
          ),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(25))),
                  fixedSize: Size(120, 50),
                  primary: Colors.white,
                  elevation: 10,
                  onPrimary: Colors.purpleAccent),
              onPressed: () {
                if (c == true && c1 == true) {
                  print("This is not possible");
                } else if (c == true) {
                  s1 = "O";
                  c = false;
                  // setState((){});
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return second(s1);
                    },
                  ));
                } else if (c1 == true) {
                  s1 = "X";
                  // setState((){});
                  c1 = false;
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return second(s1);
                    },
                  ));
                }
              },
              child: Text(
                "Continue",
                style: TextStyle(color: Colors.black),
              ))
        ],
      ),
    );
  }
}
