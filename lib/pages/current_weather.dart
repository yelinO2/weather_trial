// ignore_for_file: avoid_unnecessary_containers

import 'package:weather_app/components/glass_box.dart';
import 'package:weather_app/components/text.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CurrentWeather extends StatefulWidget {
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

  dynamic icon;
  CurrentWeather(
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
  State<CurrentWeather> createState() => _CurrentWeatherState();
}

class _CurrentWeatherState extends State<CurrentWeather> {
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
                children: [
                  const Icon(
                    Icons.location_city_rounded,
                    size: 30,
                  ),
                  const SizedBox(width: 10),
                  ModifiedText(
                      text: '${widget.city} / ${widget.country}', size: 20),
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
                  widget.icon == '--'
                      ? const ModifiedText(text: '--')
                      : Image.asset(
                        
                          widget.icon,
                          width: 80,
                          height: 80,
                        ),
                  ModifiedText(
                    text: widget.description,
                    size: 18,
                  ),
                  ModifiedText(
                    text: widget.temp,
                    fontWeight: FontWeight.bold,
                    size: 60,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ModifiedText(
                        text: 'H : ${widget.maxTemp}',
                        size: 16,
                      ),
                      const SizedBox(width: 20),
                      ModifiedText(
                        text: 'L : ${widget.minTemp}',
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
                          ModifiedText(text: '${widget.wind} km/h'),
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
                          ModifiedText(text: widget.humidity),
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
                            ModifiedText(text: widget.pressure),
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
    );
  }
}
