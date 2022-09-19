import 'package:flutter/material.dart';

import '../services/api.dart';
import '../services/location.dart';

class SearchBox extends StatefulWidget {
  const SearchBox({Key? key}) : super(key: key);

  @override
  State<SearchBox> createState() => _SearchBoxState();
}

class _SearchBoxState extends State<SearchBox> {
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
    return Container(
      padding: const EdgeInsets.only(left: 15, top: 25, bottom: 25, right: 15),
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
    );
  }
}
