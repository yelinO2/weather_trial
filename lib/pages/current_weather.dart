// ignore_for_file: avoid_unnecessary_containers

import 'package:flutter/material.dart';

class CurrentWeather extends StatefulWidget {
  dynamic description;
  dynamic maxTemp;
  dynamic minTemp;
  dynamic city;
  dynamic country;
  dynamic temp;
  dynamic feelsLike;

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
      padding: const EdgeInsets.only(left: 15, top: 25, bottom: 25, right: 15),
      margin: const EdgeInsets.only(right: 15, left: 15, bottom: 25),
      height: size.height * 0.25,
      decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xff955cd1),
              Color(0xff3fa2fa),
            ],
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(20),
          ),
          color: Colors.brown),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                widget.icon,
                height: 75,
                width: 75,
              ),
              Container(
                margin: const EdgeInsets.all(5),
                child: Text(
                  widget.description,
                  maxLines: 1,
                  style: const TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),
              Container(
                margin: const EdgeInsets.all(5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.maxTemp,
                      style: const TextStyle(fontSize: 13, color: Colors.white),
                      maxLines: 1,
                    ),
                    Text(
                      widget.minTemp,
                      style: const TextStyle(fontSize: 13, color: Colors.white),
                      maxLines: 1,
                    ),
                  ],
                ),
              ),
            ],
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Icon(Icons.location_city),
                Container(
                  child: Text(
                    widget.city,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        color: Colors.white),
                    maxLines: 1,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(0),
                  child: Text(
                    widget.country,
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontSize: 15, color: Colors.white),
                    maxLines: 1,
                  ),
                ),
              ],
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Container(
                child: Text(
                  widget.temp,
                  textAlign: TextAlign.left,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                      color: Colors.white),
                  maxLines: 1,
                ),
              ),
              Container(
                margin: const EdgeInsets.all(0),
                child: Text(
                  'Feels like ${widget.feelsLike}',
                  textAlign: TextAlign.left,
                  style: const TextStyle(fontSize: 15, color: Colors.white),
                  maxLines: 1,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
