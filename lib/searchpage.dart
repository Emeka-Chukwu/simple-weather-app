import 'package:flutter/material.dart';
import 'package:learningclip_path/shared.dart';

class SearchData extends StatefulWidget {
  @override
  _SearchDataState createState() => _SearchDataState();
}

class _SearchDataState extends State<SearchData> {
  String cityName = "";
  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    // final double height = MediaQuery.of(context).size.height;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.green[900],
        body: Column(
          children: <Widget>[
            Container(
              width: width,
              //height: height,
              color: Colors.green[900],
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 50,
                  ),
                  Text(
                    'check your weather',
                    style: fonts,
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Form(
                      child: Column(
                    children: <Widget>[
                      TextFormField(
                        decoration: textInputDecorations.copyWith(
                          hintText: 'search city',
                        ),
                      ),
                      //searchButton
                      SizedBox(
                        height: 30,
                      ),
                      RaisedButton(child: Text('search'), onPressed: () {}),
                    ],
                  )),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
