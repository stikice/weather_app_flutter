import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';

class CityScreen extends StatefulWidget {
  const CityScreen({Key? key}) : super(key: key);

  @override
  State<CityScreen> createState() => _CityScreenState();
}

class _CityScreenState extends State<CityScreen> {
  String cityName = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: SafeArea(
          child: Column(
            children: <Widget> [
              Container(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: TextField(
                    cursorColor: Colors.blueGrey[800],
                    style: TextStyle(color: Colors.white),
                    decoration: const InputDecoration(
                      hintText: 'Enter City Name',
                      hintStyle: TextStyle(color: Colors.white),
                      filled: true,
                      fillColor: Colors.black87,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10.0),
                        ),
                        borderSide: BorderSide.none
                      ),
                      icon: Icon(
                        Icons.location_city,
                        color: Colors.black87,
                        size: 50.0,
                      ),
                    ),
                    onChanged: (value){
                      cityName = value;
                    },
                  ),
                ),
              ),
              TextButton(
                  child: const Text('Get Weather', style: TextStyle(fontSize: 30.0, color: Colors.black),),
                  onPressed: (){
                    Navigator.pop(context, cityName);
                  },
                ),
          ]),
        ),
      ),
    );
  }
}