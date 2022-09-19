// ignore_for_file: avoid_unnecessary_containers

import 'package:weather_app/components/glass_box.dart';
import 'package:weather_app/components/text.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class LocalInfo extends StatefulWidget {
  dynamic description;
  dynamic maxTemp;
  dynamic minTemp;
  dynamic city;
  dynamic country;
  dynamic temp;
  dynamic feelsLike;

  dynamic icon;
  LocalInfo(
      {Key? key,
      this.city,
      this.country,
      this.icon,
      this.description,
      this.maxTemp,
      this.minTemp,
      this.feelsLike,
      this.temp})
      : super(key: key);

  @override
  State<LocalInfo> createState() => _LocalInfoState();
}

class _LocalInfoState extends State<LocalInfo> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            SizedBox(height: size.height * 0.05),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(
                    Icons.location_city_rounded,
                    size: 30,
                  ),
                  SizedBox(width: 10),
                  ModifiedText(text: 'London / GB', size: 20),
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
                  Image.asset(
                    'images/01d.png',
                    width: 80,
                    height: 80,
                  ),
                  const ModifiedText(
                    text: 'Broken Cloud',
                    size: 18,
                  ),
                  const ModifiedText(
                    text: '32°',
                    fontWeight: FontWeight.bold,
                    size: 60,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      ModifiedText(
                        text: 'H : 30°',
                        size: 16,
                      ),
                      SizedBox(width: 20),
                      ModifiedText(
                        text: 'L : 20°',
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
                          const ModifiedText(text: '10 km/h'),
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
                          const ModifiedText(text: '80'),
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
                          const ModifiedText(text: '1000'),
                          const SizedBox(height: 10),
                          const ModifiedText(
                            text: 'Pressure',
                            fontWeight: FontWeight.bold,
                          ),
                        ],
                      )),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
