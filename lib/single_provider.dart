import 'package:flutter/material.dart';
import 'package:oll11/application_color.dart';
import 'package:provider/provider.dart';

class SinglePage extends StatefulWidget {
  @override
  _SinglePageState createState() => _SinglePageState();
}

class _SinglePageState extends State<SinglePage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ChangeNotifierProvider<ApplicationColor>(
        builder: (context) => ApplicationColor(),
        child: Scaffold(
          appBar: AppBar(
            leading: Icon(
              Icons.check_circle,
              color: Colors.black,
            ),
            backgroundColor: Colors.white,
            title: Consumer<ApplicationColor>(
              builder: (context, applicationColor, _) => Text(
                "Single Provider",
                style: TextStyle(
                    color: applicationColor.color,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Consumer<ApplicationColor>(
                  builder: (context, applicationColor, _) => AnimatedContainer(
                    margin: EdgeInsets.all(5),
                    width: 100,
                    height: 100,
                    color: applicationColor.color,
                    duration: Duration(milliseconds: 500),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.all(5),
                      child: Text("LG"),
                    ),
                    Consumer<ApplicationColor>(
                      builder: (context, applicationColor, _) => Switch(
                        value: applicationColor.isLightGreen,
                        onChanged: (newValue) {
                          applicationColor.isLightGreen = newValue;
                        },
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.all(5),
                      child: Text("LB"),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
