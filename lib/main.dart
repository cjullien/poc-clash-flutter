import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static const String _title = 'Async Example Without FutureBuilder';

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: _title,
      home: MyStatefulWidget(),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  final Future<String> _myNetworkData = Future<String>.delayed(
    const Duration(seconds: 4),
    () => 'This is what you have been waiting for',
  );
  bool isLoading = true;
  bool isDone = false;
  bool hasData = false;
  bool hasError = false;

  String myData = '';

  @override
  void initState() {
    getData();
    super.initState();
  }

  void getData() {
    _myNetworkData
        .then((value) => setState(() {
              myData = value;
              isLoading = false;
              isDone = true;
              hasData = true;
              hasError = false;
            }))
        .catchError((error) {
      myData = error.toString();
      isLoading = false;
      isDone = true;
      hasData = false;
      hasError = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> children;
    if (isDone && hasData) {
      children = <Widget>[
        const Icon(
          Icons.thumb_up,
          color: Colors.purple,
          size: 100,
        ),
        Padding(
          padding: const EdgeInsets.only(top: 30),
          child: Text(
            'Done: $myData',
            style: TextStyle(fontSize: 20),
          ),
        )
      ];
    } else if (isDone && hasError) {
      children = <Widget>[
        const Icon(
          Icons.error,
          color: Colors.red,
          size: 100,
        ),
        Padding(
          padding: const EdgeInsets.only(top: 30),
          child: Text(
            'Error: $myData',
            style: TextStyle(fontSize: 20),
          ),
        )
      ];
    } else {
      children = const <Widget>[
        SizedBox(
          child: CircularProgressIndicator(
            color: Colors.blue,
          ),
          width: 80,
          height: 80,
        ),
        Padding(
          padding: EdgeInsets.only(top: 30),
          child: Text(
            'Retrieving Data',
            style: TextStyle(fontSize: 20),
          ),
        )
      ];
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Async Without FutureBuilder'),
      ),
      body: Center(
          child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: children,
        ),
      )),
    );
  }
}
