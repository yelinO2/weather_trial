import 'package:flutter/material.dart';

import '../services/api.dart';
import '../services/location.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
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

        print(wind);
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

  TextEditingController cityName = TextEditingController();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            SizedBox(height: size.height * 0.05),
            Row(
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
                        onPressed: () async {
                          getLocalInfo();
                          Navigator.pushNamed(context, '/home');
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
                      // controller: cityName,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50),
                        ),
                        suffixIcon: GestureDetector(
                          onTap: () {
                            getCityInfo();
                            Navigator.pushNamed(context, '/home');
                          },
                          child: const Icon(Icons.search),
                        ),
                      ),
                      // onFieldSubmitted: (value) => getCityInfo(),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
