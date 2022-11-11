import 'package:flutter/material.dart';

class streambuilder extends StatefulWidget {
  const streambuilder({Key? key}) : super(key: key);

  @override
  State<streambuilder> createState() => _streambuilderState();
}

class _streambuilderState extends State<streambuilder> {
  Stream<String> getTime() async* {
    while (true) {
      Future.delayed(Duration(seconds: 1));
      DateTime d = DateTime.now();
      String time = "${d.hour} : ${d.minute} : ${d.second}";

      yield time;
    }
  }

  @override
  Widget build(BuildContext context) {
    print("Hello");

    return Scaffold(
      appBar: AppBar(
        title: Text("FutureBuilder"),
      ),
      body: Center(
          child: StreamBuilder(
        stream: getTime(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else {
            if (snapshot.hasData) {
              String time = snapshot.data ?? "";
              return Text(
                "${time}",
                style: TextStyle(fontSize: 35),
              );
            } else {
              return Text("No Data Found");
            }
          }
        },
      )),
    );
  }
}
