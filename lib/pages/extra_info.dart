import 'package:flutter/material.dart';

class ExtraInfo extends StatefulWidget {
  const ExtraInfo({Key? key}) : super(key: key);

  @override
  State<ExtraInfo> createState() => _ExtraInfoState();
}

class _ExtraInfoState extends State<ExtraInfo> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 15, top: 25, bottom: 25, right: 15),
      margin: const EdgeInsets.only(left: 15, right: 15),
      decoration: BoxDecoration(
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
              children: const [
                Text(
                  'Wind',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 12,
                    color: Colors.white,
                  ),
                ),
                Text(
                  '11 km/h',
                  textAlign: TextAlign.left,
                  style: TextStyle(
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
              children: const [
                Text(
                  'Humidity',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 12,
                    color: Colors.white,
                  ),
                ),
                Text(
                  '5 %',
                  textAlign: TextAlign.left,
                  style: TextStyle(
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
              children: const [
                Text(
                  'Chance of Rain',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 12,
                    color: Colors.white,
                  ),
                ),
                Text(
                  '5 %',
                  textAlign: TextAlign.left,
                  style: TextStyle(
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
    );
  }
}
