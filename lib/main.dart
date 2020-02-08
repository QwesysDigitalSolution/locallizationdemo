
import 'package:easy_localization/easy_localization.dart';
import 'package:easy_localization/easy_localization_provider.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:locallizationdemo/secondpage.dart';
/*void main() => runApp(MyApp());*/
void main() {
  runApp(EasyLocalization(child: MyApp()));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    var data = EasyLocalizationProvider.of(context).data;
    return EasyLocalizationProvider(
      data: data,
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        initialRoute: "/",
        routes: {
          //secondpage
          '/secondpage': (context) => secondpage(),
        },
        localizationsDelegates: [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          EasyLocalizationDelegate(
            locale: data.locale,
            path: 'resources/langs',
          ),
        ],
        supportedLocales: [
          Locale('en', 'US'),
          Locale('hi', 'IN'),
          Locale('gu', 'IN'),
          Locale('mr', 'IN')
        ],
        locale: data.savedLocale,

        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  //MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

 // final String title;

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

  @override
  Widget build(BuildContext context) {
    var data = EasyLocalizationProvider.of(context).data;
    return EasyLocalizationProvider(
      data: data,
      child: Scaffold(
        appBar: AppBar(
          title: Text("hello"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              GestureDetector(
                onTap: () {
                  data.changeLocale(Locale("en", "US"));
                },
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 50,
                  color: Colors.amber,
                  child: Center(child: Text("English")),
                ),
              ),
              Padding(padding: EdgeInsets.all(5)),
              GestureDetector(
                onTap: () {
                  setState(() {
                   data.changeLocale(Locale("hi", "IN"));
                  });
                },
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 50,
                  color: Colors.green,
                  child: Center(child: Text("Hindi")),
                ),
              ),
              Padding(padding: EdgeInsets.all(5)),
              GestureDetector(
                onTap: () {
                 data.changeLocale(Locale("mr", "IN"));
                },
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 50,
                  color: Colors.deepOrange,
                  child: Center(child: Text("Marathi")),
                ),
              ),
              new Text(
                "${AppLocalizations.of(context).tr("EnterCode")}",
   //                   .tr('EnterCode')
              ),
              //secondpage
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, "/secondpage");
                },
                child: Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 50,
                    color: Colors.deepOrange,
                    child: Center(child: Text("Next")),

                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}