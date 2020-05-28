import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:aremi/model/user_class.dart';

final startColor = Color(0xFFB0DB43);
final endColor = Color(0xFF3FC8E5);
final titleColor = Color(0xff444444);
final textColor = Color(0xFFa9a9a9);
final shadowColor = Color(0xffe9e9f4);


class User extends StatelessWidget {

  @override
  Card createState() => Card();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Stack(
          children: <Widget>[
            Container(
              height: 150,
              decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [startColor, endColor])),
            ),
            Container(
              child: ListView(
                children: <Widget>[
                  new Card(),
                  SizedBox(
                    height: 150,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
  
}


class Card extends StatelessWidget {

  Card({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(
          height: 5,
        ),
        Container(
          height: 130,
          width: 130,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/ill.png"), fit: BoxFit.fill),
              borderRadius: BorderRadius.circular(100),
              border: Border.all(
                  color: Colors.black.withOpacity(.2), width: 1)),
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          "Steven Quesada",
          style: TextStyle(
            color: titleColor,
            fontSize: 20,
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(
              "Gender: ",
              style: TextStyle(color: textColor, fontSize: 15),
            ),
            Text(
              "Male",
              style: TextStyle(color: textColor, fontSize: 15),
            ),
            SizedBox(
              width: 10,
            ),
            Container(
              height: 12,
              child: VerticalDivider(
                width: 2,
                color: Colors.black,
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              "Age: ",
              style: TextStyle(color: textColor, fontSize: 15),
            ),
            Text(
              "21",
              style: TextStyle(color: textColor, fontSize: 15),
            ),
          ],
        ),
        Container(
          margin: EdgeInsets.only(top: 30),
          padding: EdgeInsets.only(left: 20, right: 20, top: 8),
          width: 320,
          height: 200,
          decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                    color: Colors.black.withOpacity(.1),
                    blurRadius: 30,
                    spreadRadius: 5)
              ],
              borderRadius: BorderRadius.circular(10)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Email: ",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                        ),
                      ),
                      Text(
                        "algo@algo.com",
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 15,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Datos personales:",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                ),
              ),
              SizedBox(
                height: 3,
              ),
              Text(
                  "Enfermedades, padecimientos, etc")
            ],
          ),
        ),
        Column(
          children: <Widget>[
            SizedBox(
              height: 30,
            ),
          ],
        )
      ],
    );
  }
}