// ignore_for_file: avoid_unnecessary_containers
import 'package:weather_app/services/api.dart';
import 'package:weather_app/services/location.dart';

import 'package:flutter/material.dart';
import 'package:weather_app/pages/current_weather.dart';
// import 'package:weather_app/pages/extra_info.dart';
// import 'package:weather_app/pages/search_locate.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  dynamic description;
  dynamic maxTemp;
  dynamic minTemp;
  dynamic city;
  dynamic country;
  dynamic temp;
  dynamic feelsLike;
  dynamic wind;
  dynamic humidity;
  dynamic rainChance;
  dynamic pressure;
  dynamic icon;
  TextEditingController cityName = TextEditingController();

  getLocalInfo() {
    Location().getLocalWeather().then((value) {
      setState(() {
        country = value.sys!.country.toString();
        city = value.name.toString();
        temp = value.main!.temp.toString();
        feelsLike = value.main!.feelsLike.toString();
        description = value.weather![0].description.toString();

        maxTemp = value.main!.tempMax.toString();
        minTemp = value.main!.tempMin.toString();
        pressure = value.main!.pressure.toString();
        humidity = value.main!.humidity.toString();
        wind = value.wind!.speed.toString();
        icon = value.weather![0].icon.toString();
      });
    });
  }

  getCityInfo() {
    API().getSearchWeather(cityName.text).then((value) {
      setState(() {
        country = value.sys!.country.toString();
        city = value.name.toString();
        temp = value.main!.temp.toString();
        feelsLike = value.main!.feelsLike.toString();
        description = value.weather![0].description.toString();

        maxTemp = value.main!.tempMax.toString();
        minTemp = value.main!.tempMin.toString();
        pressure = value.main!.pressure.toString();
        humidity = value.main!.humidity.toString();
        wind = value.wind!.speed.toString();
        icon = value.weather![0].icon.toString();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: size.height,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xff2b5876),
                Color(0xff4e4376),
              ],
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
            ),
          ),
          child: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              Container(
                padding: const EdgeInsets.only(
                    left: 15, top: 25, bottom: 25, right: 15),
                // margin: const EdgeInsets.only(left: 15, top: 25, bottom: 25, right: 15),
                // width: size.width,
                child: Row(
                  children: [
                    Expanded(
                        flex: 1,
                        child: Container(
                          margin: const EdgeInsets.only(right: 10),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.white),
                            shape: BoxShape.circle,
                          ),
                          child: IconButton(
                            onPressed: () {
                              getLocalInfo();
                            },
                            icon: const Icon(Icons.location_on),
                          ),
                        )),
                    Expanded(
                      flex: 3,
                      child: SizedBox(
                        // width: size.width * 0.7,
                        height: 50,
                        child: TextFormField(
                          controller: cityName,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(50),
                            ),
                            suffixIcon: GestureDetector(
                              onTap: () {
                                getCityInfo();
                              },
                              child: const Icon(Icons.search),
                            ),
                          ),
                          onFieldSubmitted: (value) => getCityInfo(),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              CurrentWeather(
                city: city,
                country: country,
                icon: 'images/$icon.png',
                description: description,
                maxTemp: maxTemp,
                minTemp: minTemp,
                temp: temp,
                feelsLike: feelsLike,
              ),
              Container(
                padding: const EdgeInsets.only(
                    left: 15, top: 25, bottom: 25, right: 15),
                margin: const EdgeInsets.only(left: 15, right: 15),
                decoration: BoxDecoration(
                  // gradient: const LinearGradient(
                  //   colors: [
                  //     Color(0xff77A1D3),
                  //     Color(0xff79CBCA),
                  //   ],
                  //   begin: Alignment.bottomCenter,
                  //   end: Alignment.topCenter,
                  // ),
                  color: Colors.grey,
                  borderRadius: const BorderRadius.all(Radius.circular(20)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.white12.withOpacity(0.1),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: const Offset(0, 3),
                    )
                  ],
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          const Text(
                            'Wind',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 12,
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            '$wind km/h',
                            textAlign: TextAlign.left,
                            style: const TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 15,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          const Text(
                            'Humidity',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 12,
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            '$humidity %',
                            textAlign: TextAlign.left,
                            style: const TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 15,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          const Text(
                            'Pressure',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 12,
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            '$pressure Pa',
                            textAlign: TextAlign.left,
                            style: const TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 15,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
