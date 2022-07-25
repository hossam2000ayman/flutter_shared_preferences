import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Setting extends StatefulWidget {
  const Setting({Key? key}) : super(key: key);

  @override
  State<Setting> createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  int favColor = Colors.white.value;
  late SharedPreferences prefs;
  saveData(int color) async {
    prefs = await SharedPreferences.getInstance();
    prefs.setInt('favC', color);
  }

  getData() async {
    prefs = await SharedPreferences.getInstance();

    setState(() {
      favColor = prefs.getInt('favC') ??
          Colors.white.value; //dah fy 7alet el default value
    });
  }

  int fontsize = 20;
  late SharedPreferences prefs2;
  saveNum(int size) async {
    prefs2 = await SharedPreferences.getInstance();
    prefs.setInt('fontSize', size);
  }

  getNum() async {
    prefs = await SharedPreferences.getInstance();
    setState(() {
      fontsize = prefs2.getInt('fontSize') ?? 20;
    });
  }

  @override
  Widget build(BuildContext context) {
    getData();
    getNum();
    return Scaffold(
      backgroundColor: Color(favColor),
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: Center(
        child: Column(
          children: [
            Text('Background Color',style: TextStyle(fontSize: 30),),
            RadioListTile(
              title: Text('Green'),
              value: Colors.green.value,
              groupValue: favColor,
              onChanged: (int? color) {
                setState(() {
                  favColor = Colors.green.value;
                });
                saveData(Colors.green.value);
              },
            ),
            RadioListTile(
              title: Text('Orange'),
              value: Colors.orange.value,
              groupValue: favColor,
              onChanged: (int? color) {
                setState(() {
                  favColor = Colors.orange.value;
                });
                saveData(Colors.orange.value);
              },
            ),
            RadioListTile(
              title: Text('Blue'),
              value: Colors.blue.value,
              groupValue: favColor,
              onChanged: (int? color) {
                setState(() {
                  favColor = Colors.blue.value;
                });
                saveData(Colors.blue.value);
              },
            ),
            Divider(
              color: Colors.black,
              height: 90,
              endIndent: 50,
              indent: 50,
            ),
            Text('Font Size',style: TextStyle(fontSize: 30),),
            RadioListTile(
              title: Text('12'),
              value: 12,
              groupValue: fontsize,
              onChanged: (int? size) {
                setState(() {
                  fontsize = 12;
                });
                saveNum(12);
              },
            ),

            RadioListTile(
              title: Text('24'),
              value: 24,
              groupValue: fontsize,
              onChanged: (int? size) {
                setState(() {
                  fontsize = 24;
                });
                saveNum(24);
              },
            ),

            RadioListTile(
              title: Text('32'),
              value: 32,
              groupValue: fontsize,
              onChanged: (int? size) {
                setState(() {
                  fontsize= 32;
                });
                saveNum(32);
              },
            ),

            RadioListTile(
              title: Text('64'),
              value: 64,
              groupValue: fontsize,
              onChanged: (int? size) {
                setState(() {
                  fontsize = 64;
                });
                saveNum(64);
              },
            ),
          ],
        ),
      ),
    );
  }
}
