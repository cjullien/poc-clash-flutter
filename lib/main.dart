import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static const String _title = 'Async Example using FutureBuilder';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Async With FutureBuilder'),
      ),
      body: Center(
        child: FutureBuilder<String>(
          future: _myNetworkData,
          builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
            List<Widget> children;
            if (snapshot.connectionState == ConnectionState.done && snapshot.hasData) {
              children = <Widget>[
                const Icon(
                  Icons.thumb_up,
                  color: Colors.purple,
                  size: 100,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 30),
                  child: Text(
                    'Done: ${snapshot.data}',
                    style: TextStyle(fontSize: 20),
                  ),
                )
              ];
            } else if (snapshot.connectionState == ConnectionState.done && snapshot.hasError) {
              children = <Widget>[
                const Icon(
                  Icons.error,
                  color: Colors.red,
                  size: 100,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 30),
                  child: Text(
                    'Error: ${snapshot.error}',
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
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: children,
              ),
            );
          },
        ),
      ),
    );
  }
}
