import 'package:dhge_abc_liste/behaviours/pointerScrollBehaviour.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DHGE ABC Liste',
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
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.green,
        ),
      ),
      home: const MyHomePage(title: 'ABC Liste'),
      scrollBehavior: PointerScrollBehaviour(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  // Create alphabet for rendering list
  final String alphabet = "abcdefghijklmnopqrstuvwxyz";

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  void _routeToAddPage() {

  }

  void _routeToDetailsPage() {

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
      body: ListView.builder(
          itemCount: widget.alphabet.characters.length,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              padding: const EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 45,
                    padding: const EdgeInsets.all(12),
                    child: Center(
                      child: Text(
                        widget.alphabet.characters.elementAt(index).toUpperCase(),
                        style: const TextStyle(
                          fontSize: 24,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Expanded(child: Card(
                                color: Colors.transparent,
                                elevation: 0,
                                shape: const RoundedRectangleBorder(
                                    side: BorderSide(
                                      color: Colors.black12,
                                    ),
                                    borderRadius: BorderRadius.all(Radius.circular(8))
                                ),
                                child: Container(
                                  padding: const EdgeInsets.all(16),
                                  child: const Text("Noch keine Wörter hinzugefügt"),
                                ),
                              ))
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              TextButton(
                                onPressed: _routeToDetailsPage,
                                child: const Text("Mehr anzeigen"),
                              ),
                              TextButton(
                                onPressed: _routeToAddPage,
                                child: const Text("Hinzufügen"),
                              )
                            ],
                          )
                        ],
                      )
                  ),
                ],
              ),
            );
          }
      ),
    );
  }
}
