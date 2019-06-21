import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Navigation',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext parentContext) {
    return Container(
        color: Theme.of(context).colorScheme.primary,
        child: Navigator(
            initialRoute: "1",
            onGenerateRoute: (settings) {
              return PageRouteBuilder(pageBuilder: (BuildContext context,
                  Animation animation, Animation secondaryAnimation) {
                switch (settings.name) {
                  case "1":
                    return Container(
                        color: Colors.red,
                        child: GestureDetector(onTap: () {
                          debugPrint("going from 1 to 2");
                          Navigator.of(context).pushNamed("2");
                        }));
                  case "2":
                    return WillPopScope(
                      child: Container(color: Colors.green),
                      onWillPop: ()async {
                        debugPrint("popping from route 2 disabled");
                        return false;
                      },
                    );
                  default:
                    throw Exception("unrecognise route \"${settings.name}\"");
                }
              });
            })
    );
  }
}
