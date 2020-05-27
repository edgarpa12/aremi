import 'package:calendar_strip/calendar_strip.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:aremi/model/app_class.dart';

class Clases extends StatefulWidget {
  @override
  _ClasesPageState createState() => _ClasesPageState();
}

class _ClasesPageState extends State<Clases> {


  getMarkedIndicatorWidget() {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      Container(
        margin: EdgeInsets.only(left: 1, right: 1),
        width: 7,
        height: 7,
        decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.red),
      ),
      Container(
        width: 7,
        height: 7,
        decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.blue),
      )
    ]);
  }

  dateTileBuilder(date, selectedDate, rowIndex, dayName, isDateMarked, isDateOutOfRange) {
    bool isSelectedDate = date.compareTo(selectedDate) == 0;
    Color fontColor = isDateOutOfRange ? Colors.white : Colors.black87;
    TextStyle normalStyle = TextStyle(fontSize: 15, fontWeight: FontWeight.w800, color: fontColor);
    TextStyle selectedStyle = TextStyle(fontSize: 15, fontWeight: FontWeight.w800, color: Colors.white);
    List<Widget> _children = [
      Text(dayName, style: !isSelectedDate ? normalStyle : selectedStyle),
      Text(date.day.toString(), style: !isSelectedDate ? normalStyle : selectedStyle),
    ];

    if (isDateMarked == true) {
      _children.add(getMarkedIndicatorWidget());
    }

    return AnimatedContainer(
      duration: Duration(milliseconds: 150),
      alignment: Alignment.center,
      padding: EdgeInsets.only(top: 8, left: 5, right: 5, bottom: 5),
      decoration: BoxDecoration(
        color: !isSelectedDate ? Colors.transparent : Colors.yellow[300],
        borderRadius: BorderRadius.all(Radius.circular(60)),
      ),
      child: Column(
        children: _children,
      ),
    );
  }

  List<AppClass> _items;

  @override
  void initState() {
    super.initState();
    _items = [
      AppClass(title: "Nado Sync", subtitle: " con Emanuel", isReserved: true, time: "06:00", duration: "45min"),
      AppClass(title: "Nado Mariposa", subtitle: " con Edgar", isReserved: true, time: "06:00", duration: "45min"),
      AppClass(title: "Aprender a nadar", subtitle: " con Steven", isReserved: true, time: "09:15", duration: "1hr"),
      AppClass(title: "Extreme Programing", subtitle: " con Kendall", isReserved: false, time: "09:15", duration: "1hr")
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      drawer: Drawer(),
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 2,
            child: Container(
              child: CalendarStrip(
                dateTileBuilder: dateTileBuilder,
                iconColor: Colors.black,
                onDateSelected: (data) {
                  print(data);
                },
              ),
              margin: EdgeInsets.only(bottom: 8),
              decoration: BoxDecoration(color: Colors.white, boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  blurRadius: 2,
                  spreadRadius: 2,
                  offset: Offset(0, 2),
                )
              ]),
            ),
          ),
          Expanded(
            flex: 8,
            child: Column(
              children: [
                Expanded(
                  flex: 2,
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.all(8),
                          decoration: BoxDecoration(color: Colors.black, borderRadius: BorderRadius.circular(4)),
                          child: Center(
                            child: Text(
                              "Clases",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 15,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 16),
                    child: ListView.separated(
                      itemBuilder: (context, index) {
                        return Container(
                          height: 52,
                          decoration: BoxDecoration(
                            color: Colors.white,
                          ),
                          child: Row(
                            children: [
                              Expanded(
                                flex: 2,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "${_items[index].time}",
                                      style: _items[index].isReserved
                                          ? TextStyle(fontWeight: FontWeight.bold)
                                          : TextStyle(fontWeight: FontWeight.bold, color: Colors.grey),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(4.0),
                                      child: Text(
                                        _items[index].duration,
                                        style: _items[index].isReserved
                                            ? TextStyle(fontWeight: FontWeight.bold, fontSize: 10)
                                            : TextStyle(fontWeight: FontWeight.bold, color: Colors.grey, fontSize: 10),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Expanded(
                                flex: 6,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text.rich(TextSpan(children: [
                                        TextSpan(
                                          text: _items[index].title,
                                          style: _items[index].isReserved
                                              ? TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                )
                                              : TextStyle(color: Colors.grey[500]),
                                        ),
                                        TextSpan(
                                            text: _items[index].subtitle,
                                            style: _items[index].isReserved
                                                ? TextStyle(fontSize: 10, color: Colors.grey)
                                                : TextStyle(fontSize: 10))
                                      ])),
                                      Spacer()
                                    ],
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 3,
                                child: _items[index].isReserved
                                    ? Container(
                                        margin: EdgeInsets.all(8),
                                        decoration: BoxDecoration(
                                          color: Colors.black,
                                          borderRadius: BorderRadius.circular(4),
                                        ),
                                        child: Center(
                                          child: Text(
                                            "Reservar",
                                            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      )
                                    : Container(
                                        margin: EdgeInsets.all(8),
                                        decoration: BoxDecoration(
                                          border: Border.all(color: Colors.grey),
                                          borderRadius: BorderRadius.circular(4),
                                        ),
                                        child: Center(
                                          child: Text(
                                            "Agotado",
                                            style: TextStyle(fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ),
                              ),
                            ],
                          ),
                        );
                      },
                      itemCount: _items.length,
                      separatorBuilder: (BuildContext context, int index) {
                        return Divider();
                      },
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
