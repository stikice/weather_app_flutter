import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:weather_example/api/weather_api.dart';
import 'package:weather_example/models/weather_forecast_daily.dart';
import 'package:weather_example/screens/city_screen.dart';
import 'package:weather_example/widgets/bottom_list_view.dart';
import 'package:weather_example/widgets/city_view.dart';
import 'package:weather_example/widgets/detail_view.dart';
import 'package:weather_example/widgets/temp_view.dart';

class WeatherForecastScreen extends StatefulWidget {
  @override
  _WeatherForecastScreenState createState() => _WeatherForecastScreenState();
}

class _WeatherForecastScreenState extends State<WeatherForecastScreen> {
  late Future<WeatherForecast> forecastObject;
  String _cityName = 'London';
  //String _cityName;

  @override
  void initState() {
    super.initState();
    forecastObject =
        WeatherApi().fetchWeatherForecastWithCity(cityName: _cityName);
  /*
    forecastObject.then((weather) {
      print(weather.list![0].weather![0].main);
    });
    */
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black87,
        title: Text("openweathermap.org"),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.my_location),
          onPressed: () {},
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.location_city),
            onPressed: () async {
              var tappedName = await Navigator.push(context, MaterialPageRoute(builder: (context){
                return CityScreen();
              }));
              if(tappedName != null){
                setState(() {
                  _cityName = tappedName;
                  forecastObject = WeatherApi().fetchWeatherForecastWithCity(cityName: _cityName);  
                });
              }
            },
          ),
        ],
      ),
      body: ListView(
        children: <Widget>[
          Container(
            child: FutureBuilder<WeatherForecast>(
              future: forecastObject,
              builder: (context, snapshot){
                if(snapshot.hasData){ 
                  return Column(
                    children: <Widget>[
                      SizedBox(height: 50.0),
                      CityView(snapshot: snapshot),
                      SizedBox(height: 50.0),
                      TempView(snapshot: snapshot),
                      SizedBox(height: 50.0,),
                      DetailView(snapshot: snapshot),
                      SizedBox(height: 50.0,),
                      BottomListView(snapshot: snapshot),
                    ],
                  );
                } else {
                  return const Center(
                    child: SpinKitDoubleBounce(
                      color: Colors.black87, size: 100.0
                    ),
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
