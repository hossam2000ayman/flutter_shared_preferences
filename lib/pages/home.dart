import 'package:flutter/material.dart';
import 'package:flutter_shared_preferences/pages/settings.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late SharedPreferences prefs;
  int favColor = Colors.white.value;

  getData() async {
    prefs = await SharedPreferences.getInstance();

    setState(() {
      favColor = prefs.getInt('favC') ??
          Colors.white.value; //dah fy 7alet el default value
    });
  }

  late SharedPreferences prefs2;
  int fontsize = 10;

  getNum() async {
    prefs2 = await SharedPreferences.getInstance();

    setState(() {
      fontsize =
          prefs2.getInt('fontSize') ?? 10; //dah fy 7alet el default value
    });
  }

  @override
  Widget build(BuildContext context) {
    getData();
    getNum();

    return Scaffold(
      backgroundColor: Color(favColor),
      appBar: AppBar(
        title: Text('Shared Preferences'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(
              Icons.settings,
            ),
            onPressed: () => Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => Setting())),
          ),
        ],
      ),
      body: Center(
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            border: Border.all(width: 10, ),

          ),
          padding: EdgeInsets.all(40),
          
          child: Text(
            'Hello my name is hossam',
            style: TextStyle(fontSize: fontsize.toDouble(), color: Colors.white),textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
