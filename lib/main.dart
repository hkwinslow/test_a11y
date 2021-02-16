import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/semantics.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //showSemanticsDebugger: true,
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  void _decrementCounter() {
    setState(() {
      _counter--;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: ListView(padding: const EdgeInsets.all(15),
            // ListView is also a layout widget. It takes a list of children and
            // arranges them vertically. It can be used as an alternative to Column because,
            // unlike a Column, a ListView will not give you overflow and will allow users
            // to scroll.
            children: <Widget>[
              // Add a label to an image
              Container(
                height: MediaQuery.of(context).size.height * 0.2,
                child: Image(
                  image: AssetImage('assets/logo.png'),
                  semanticLabel: 'Image of a desktop computer.',
                ),
              ),
              SizedBox(
                height: 30,
              ),

              // Set text as a header
              Semantics(
                header: true,
                child: Text(
                  'Testing accessibility',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: MediaQuery.of(context).size.width * 0.08,
                  ),
                ),
              ),
              Text('Here is some text that will appear underneath the header ' +
                  'just to make the header stand out so the dev knows the header is a header.'),
              SizedBox(
                height: 30,
              ),

              // Text field
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Username',
                ),
              ),
              SizedBox(
                height: 40,
              ),

              // Add tooltips to icon buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    icon: Icon(
                      Icons.remove,
                      size: MediaQuery.of(context).size.width * 0.08,
                      color: Colors.red,
                    ),
                    onPressed: _decrementCounter,
                    tooltip: 'Decrement',
                  ),
                  Text(
                    _counter.toString(),
                    style: TextStyle(
                        fontSize: MediaQuery.of(context).size.width * 0.07),
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.add,
                      size: MediaQuery.of(context).size.width * 0.08,
                      color: Colors.green,
                    ),
                    onPressed: _incrementCounter,
                    tooltip: 'Increment',
                  ),
                ],
              ),
              SizedBox(
                height: 50,
              ),

              // Sort semantically in a different order
              // TIP: don't wrap these in another column. Leave them how they are.
              // They are already in a column (technically a ListView -- see above).
              // Semantics do not function properly if they are in nested columns
              Semantics(
                sortKey: OrdinalSortKey(2.0),
                child: Text(
                  'Alpha',
                  style: TextStyle(
                    fontSize: MediaQuery.of(context).size.width * 0.05,
                  ),
                ),
              ),
              Semantics(
                sortKey: OrdinalSortKey(0.0),
                child: Text(
                  'Bravo',
                  style: TextStyle(
                    fontSize: MediaQuery.of(context).size.width * 0.05,
                  ),
                ),
              ),
              Semantics(
                sortKey: OrdinalSortKey(1.0),
                child: Text(
                  'Charlie',
                  style: TextStyle(
                    fontSize: MediaQuery.of(context).size.width * 0.05,
                  ),
                ),
              ),

              SizedBox(
                height: 30,
              ),

              // Assign a type and state to a custom widget
              Semantics(
                button: true, // screen reader will recognize element as button
                enabled: false, // screen reader will announce "dimmed" since element is not enabled
                child: Material(
                  borderRadius: BorderRadius.all(
                    Radius.circular(12.0),
                  ),
                  color: Colors.blue,
                  child: InkWell(
                    onTap: () {}, //not implemented due to test-only nature of project
                    child: Container(
                      child: Center(
                        child: Text('Custom element'),
                      ),
                      padding: EdgeInsets.all(0.0),
                      height: MediaQuery.of(context).size.height * .07,
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.all(
                          Radius.circular(12.0),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ]),
      ),
    );
  }
}
