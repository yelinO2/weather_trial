// ignore_for_file: avoid_unnecessary_containers

import 'package:weather_app/components/glass_box.dart';
import 'package:weather_app/components/text.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/pages/search.dart';

import '../services/api.dart';
import '../services/location.dart';

// ignore: must_be_immutable
class CurrentWeather extends StatefulWidget {
  const CurrentWeather({
    Key? key,
  }) : super(key: key);

  @override
  State<CurrentWeather> createState() => _CurrentWeatherState();
}

class _CurrentWeatherState extends State<CurrentWeather> {
  dynamic description = '--';
  dynamic maxTemp = '--';
  dynamic minTemp = '--';
  dynamic city = '--';
  dynamic country = '--';
  dynamic temp = '--';
  dynamic feelsLike = '--';
  dynamic wind = '--';
  dynamic humidity = '--';
  dynamic pressure = '--';
  dynamic icon = '--';
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
    print('>>>>>>>>>>>>>');
    print(feelsLike);
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

    print(wind);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Container(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              // SizedBox(height: size.height * 0.05),
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
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.location_city_rounded,
                      size: 30,
                    ),
                    const SizedBox(width: 10),
                    ModifiedText(text: '$city / $country', size: 20),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              GlassBox(
                height: size.height * 0.5,
                width: size.width * 0.9,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    icon == '--'
                        ? const ModifiedText(text: '--')
                        : Image.asset(
                            'images/$icon.png',
                            width: 80,
                            height: 80,
                          ),
                    ModifiedText(
                      text: '$description'.toUpperCase(),
                      size: 18,
                    ),
                    ModifiedText(
                      text: '$temp°',
                      fontWeight: FontWeight.bold,
                      size: 60,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ModifiedText(
                          text: 'H : $maxTemp°',
                          size: 16,
                        ),
                        const SizedBox(width: 20),
                        ModifiedText(
                          text: 'L : $minTemp°',
                          size: 16,
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                            child: Column(
                          children: [
                            Image.asset(
                              'images/wind.png',
                              width: size.width * 0.12,
                            ),
                            const SizedBox(height: 5),
                            ModifiedText(text: '$wind km/h'),
                            const SizedBox(height: 10),
                            const ModifiedText(
                              text: 'Wind',
                              fontWeight: FontWeight.bold,
                            ),
                          ],
                        )),
                        Expanded(
                            child: Column(
                          children: [
                            Image.asset(
                              'images/humidity.png',
                              width: size.width * 0.12,
                            ),
                            const SizedBox(height: 5),
                            ModifiedText(text: '$humidity'),
                            const SizedBox(height: 10),
                            const ModifiedText(
                              text: 'Humidity',
                              fontWeight: FontWeight.bold,
                            ),
                          ],
                        )),
                        Expanded(
                          child: Column(
                            children: [
                              Image.asset(
                                'images/pressure.png',
                                width: size.width * 0.12,
                              ),
                              const SizedBox(height: 5),
                              ModifiedText(text: '$pressure'),
                              const SizedBox(height: 10),
                              const ModifiedText(
                                text: 'Pressure',
                                fontWeight: FontWeight.bold,
                              ),
                            ],
                          ),
                        ),
                      ],
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
