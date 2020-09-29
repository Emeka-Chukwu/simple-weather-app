import 'package:flutter/material.dart';
import 'package:learningclip_path/shared.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'searchpage.dart';
import 'dart:convert' show json;
import 'package:http/http.dart' as http;
import 'dart:async';
import 'package:google_fonts/google_fonts.dart';

class HomeForClipPath1 extends StatefulWidget {
  @override
  _HomeForClipPath1State createState() => _HomeForClipPath1State();
}

class _HomeForClipPath1State extends State<HomeForClipPath1> {
  var name;
  var temp;
  var humidity;
  var pressure;
  var windSpeed;
  var max;
  var min;
  Future fetchData() async {
    String api = 'http://api.openweathermap.org/data/2.5/weather';
    String appId = "717d16ccc2decfde7b2b13d5ad73a17e";
    String city = 'lusaka';

    String url = '$api?q=$city&units=metric&APPID=$appId';

    http.Response response = await http.get(url);

    var results = json.decode(response.body);

    setState(() {
      this.temp = results['main']['temp'];
      this.name = results['name'];
      this.humidity = results['main']['humidity'];
      this.pressure = results['main']['pressure'];
      this.windSpeed = results['wind']['speed'];
      this.max = results['main']['temp_max'];
      this.min = results['main']['temp_min'];
    });
  }

  @override
  void initState() {
    super.initState();
    this.fetchData();
  }

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Column(
          children: <Widget>[
            ClipPath(
              clipper: ClipHere(),
              child: Container(
                width: width,
                height: height * 0.50,
                decoration: BoxDecoration(
                  color: Colors.green[900],
                ),
                child: Center(
                  //children of the cliped
                  child: Column(
                    children: [
                      SizedBox(
                        height: 30.0,
                      ),
                      //next
                      Text(
                        'current weather', 
                        style:fonts, 
                      ),
                      //next
                      Text(
                        temp != null ? temp.toString() + '°' : 'loading',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.normal,
                          fontStyle: FontStyle.italic,
                          fontSize: 68,
                        ),
                      ),
                      //next
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.location_on),
                          Text(
                            '$name',
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.normal,
                              fontStyle: FontStyle.italic,
                              fontSize: 15,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            //next to show weather
            ListTile(
              leading: CircleAvatar(
                child: FaIcon(FontAwesomeIcons.thermometerHalf,
                    color: Colors.black, size: 20.0),
                radius: 25.0,
                backgroundColor: Colors.green[800],
              ),
              title: Text('Temperature'),
              trailing: Text(
                temp != null ? temp.toString() + '°' : 'loading',
              ),
            ),
            //next
            ListTile(
              leading: CircleAvatar(
                child: FaIcon(FontAwesomeIcons.airbnb,
                    color: Colors.black, size: 20.0),
                radius: 25.0,
                backgroundColor: Colors.green[800],
              ),
              title: Text('Humidity'),
              trailing: Text(
                humidity != null ? humidity.toString() + '%' : 'loading',
              ),
            ),
            //next
            ListTile(
              leading: CircleAvatar(
                child: FaIcon(FontAwesomeIcons.wind,
                    color: Colors.black, size: 20.0),
                radius: 25.0,
                backgroundColor: Colors.green[800],
              ),
              title: Text('Wind Speed'),
              trailing: Text(
                windSpeed != null ? windSpeed.toString() + 'km/h' : 'loading',
              ),
            ),
            //next
            ListTile(
              leading: CircleAvatar(
                child: FaIcon(FontAwesomeIcons.skyatlas,
                    color: Colors.black, size: 20.0),
                radius: 25.0,
                backgroundColor: Colors.green[800],
              ),
              title: Text('Pressure'),
              trailing: Text(
                pressure != null ? pressure.toString() + 'mb' : 'loading',
              ),
            ),
            //BottomBar
            ClipPath(
              clipper: BottomClip(),
              child: Container(
                color: Colors.green[900],
                width: width,
                height: height * 0.15,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(
                          height: 50,
                        ),
                        Text('max: $max °'),
                        Text('min : $min °'),
                      ],
                    ),
                    SizedBox(
                      width: 150,
                    ),
                    Container(
                      alignment: Alignment.bottomRight,
                      child: FlatButton.icon(
                        onPressed: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SearchData(),
                          ),
                        ),
                        icon: Icon(
                          Icons.search,
                          size: 40,
                        ),
                        label: Text(''),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
