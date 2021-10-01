import 'package:flutter/material.dart';
import 'dart:async';
import 'package:timerdown/model/count.dart';
import 'package:timerdown/stream/count_stream.dart';
import 'package:timerdown/widget/indicador.dart';
import 'package:timerdown/widget/my_button.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Count count = Count("0", 1.0);
  final countStream = new CountStream();
  String startStopLabel = "Iniciar";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        home: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.purple,
            title: Text("Timer"),
          ),
          body: Container(
            padding: EdgeInsets.all(8),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                        child: MyButton(
                      color: Colors.black12,
                      onPressed: () {
                        countStream.setTime(30);
                        countStream.start();
                      },
                      text: "30 segundos",
                    )),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                        child: MyButton(
                      color: Colors.black26,
                      onPressed: () {
                        countStream.setTime(60);
                        countStream.start();
                      },
                      text: "1 minuto",
                    )),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                        child: MyButton(
                      color: Colors.black38,
                      onPressed: () {
                        countStream.setTime(120);
                        countStream.start();
                      },
                      text: "2 minutos",
                    )),
                  ],
                ),
                Expanded(
                    child: StreamBuilder(
                        initialData: count,
                        stream: countStream.stream(),
                        builder: (_, AsyncSnapshot snapshot) {
                          return Indicador(
                              count: snapshot.hasData ? snapshot.data : count);
                        })),
                Row(
                  children: [
                    Expanded(
                        child: MyButton(
                      color: Colors.lightGreen,
                      onPressed: startStop,
                      text: startStopLabel,
                    )),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                        child: MyButton(
                      color: Colors.redAccent,
                      onPressed: reset,
                      text: "Reiniciar",
                    )),
                  ],
                ),
              ],
            ),
          ),
        ));
  }

  void startStop() {
    if (countStream.getActive()) {
      countStream.stop();
      setState(() {
        startStopLabel = "Iniciar";
      });
    } else {
      countStream.start();
      setState(() {
        startStopLabel = "Parar";
      });
    }
  }

  void reset() {
    setState(() {
      startStopLabel = "Parar";
    });
    countStream.reset();
  }
}
