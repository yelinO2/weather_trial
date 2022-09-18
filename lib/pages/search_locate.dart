import 'package:flutter/material.dart';
// import 'package:weather_app/services/api.dart';
import 'package:weather_app/services/location.dart';

class SearchAndLocate extends StatefulWidget {
  const SearchAndLocate({Key? key}) : super(key: key);

  @override
  State<SearchAndLocate> createState() => _SearchAndLocateState();
}

class _SearchAndLocateState extends State<SearchAndLocate> {
  dynamic condiction;
  getWeater() {
    Location().getLocalWeather().then((value) {
      condiction = value.main!.feelsLike;
    });
    return condiction;
  }



  @override
  Widget build(BuildContext context) {
    // Size size = MediaQuery.of(context).size;
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
                    // getWeater();
                    // print('here>>>>>>>>>>>');
                    // print(getWeater());
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
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                  suffixIcon: GestureDetector(
                    onTap: () {},
                    child: const Icon(Icons.search),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
