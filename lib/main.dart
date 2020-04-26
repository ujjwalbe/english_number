import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:number_to_words_spelling/number_to_words_spelling.dart';

void main() => runApp(MaterialApp(
      theme: ThemeData.light(),
      home: EnglishNumber(),
    ));

class EnglishNumber extends StatefulWidget {
  @override
  _EnglishNumberState createState() => _EnglishNumberState();
}

class _EnglishNumberState extends State<EnglishNumber> {
  List<Widget> widgetList = [];
  final myController = TextEditingController();
  int num = 100;

  TextStyle textStyle = TextStyle(fontSize: 17.0, color: Colors.black54);

  BoxDecoration nMbox = BoxDecoration(
      borderRadius: BorderRadius.circular(15),
      color: Colors.grey.shade100,
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.075),
          offset: Offset(10, 10),
          blurRadius: 10,
        ),
        BoxShadow(
          color: Colors.white,
          offset: Offset(-10, -10),
          blurRadius: 10,
        ),
      ]);

  @override
  @override
  Widget build(BuildContext context) {
    setState(() {
      generateWidgetNum(num);
    });
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        actions: <Widget>[
          MaterialButton(
            child: Icon(
              Icons.refresh,
              size: 30.0,
              color: Colors.teal[800],
            ),
            onPressed: () {
              setState(() {
                inputDialog();
              });
            },
            minWidth: 20.0,
            height: 20.0,
          ),
          MaterialButton(
            child: Icon(
              Icons.info_outline,
              color: Colors.teal[800],
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => MaterialApp(
                          home: AlertDialog(
                            title: Center(child: Text('About')),
                            actions: <Widget>[
                              MaterialButton(
                                child: Icon(
                                  Icons.close,
                                  color: Colors.teal[800],
                                ),
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                minWidth: 20.0,
                                height: 20.0,
                              )
                            ],
                            content: Container(
                              height: 50.0,
                              width: 100.0,
                              child: Column(
                                children: <Widget>[
                                  Center(
                                    child: Text('App Build By:'),
                                  ),
                                  Center(
                                    child: Text('4DevTech'),
                                  )
                                ],
                              ),
                            ),
                          ),
                        )),
              );
            },
          )
        ],
        centerTitle: true,
        title: Text("English Number"),
      ),
      body: ListView(
        reverse: false,
        children: widgetList,
      ),
    );
  }

  void inputDialog() {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Please Enter Number"),
            content: TextFormField(
              keyboardType: TextInputType.number,
              controller: myController,
              decoration:
                  InputDecoration(border: InputBorder.none, hintText: 'Enter a valid number'),
            ),
            actions: <Widget>[
              MaterialButton(
                child: Text('Submit'),
                onPressed: () {
                  setState(() {
                    String data = myController.text;
                    num = int.parse(data);
                    generateWidgetNum(num);
                  });
                  Navigator.pop(context);
                },
              ),
              MaterialButton(
                child: Text('Back'),
                onPressed: () {
                  Navigator.pop(context);
                },
              )
            ],
            //title: Text("It's a Draw"),
          );
        });
  }

  void generateWidgetNum(int number) {
    for (int i = 0; i <= number; i++) {
      print(i);
      String num2word = NumberWordsSpelling.toWord(i.toString(), 'en_US');
      Widget widget = Container(
        decoration: nMbox,
        height: 60.0,
        width: 300.0,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(left: 50.0, right: 30.0),
              child: Center(
                  child: Text(
                i.toString(),
                style: textStyle,
              )),
            ),
            Padding(
              padding: EdgeInsets.only(left: 50.0, right: 0.0),
              child: Center(
                  child: Text(
                num2word.toUpperCase(),
                style: textStyle,
              )),
            )
          ],
        ),
      );

      widgetList.add(widget);
      widgetList.add(
        SizedBox(
          height: 20.0,
          width: 200,
        ),
      );
    }
  }

//  void generateWidget() {
//    for (int i = 0; i <= num; i++) {
//      print(i);
//      String num2word = NumberWordsSpelling.toWord(i.toString(), 'en_US');
//      Widget widget = Container(
//        decoration: nMbox,
//        height: 60.0,
//        width: 300.0,
//        child: Row(
//          crossAxisAlignment: CrossAxisAlignment.center,
//          children: <Widget>[
//            Padding(
//              padding: EdgeInsets.only(left: 50.0, right: 30.0),
//              child: Center(
//                  child: Text(
//                i.toString(),
//                style: textStyle,
//              )),
//            ),
//            Padding(
//              padding: EdgeInsets.only(left: 50.0, right: 0.0),
//              child: Center(
//                  child: Text(
//                num2word.toUpperCase(),
//                style: textStyle,
//              )),
//            )
//          ],
//        ),
//      );
//
//      widgetList.add(widget);
//      widgetList.add(
//        SizedBox(
//          height: 20.0,
//          width: 200,
//        ),
//      );
//    }
//  }
}
