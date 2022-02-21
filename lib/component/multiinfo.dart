import 'package:flutter/material.dart';

class MultiItem extends StatelessWidget {
  final String? state;
  final String? persent;
  MultiItem({this.persent, this.state});
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.only(bottom: size.longestSide * .02),
      height: size.longestSide * .06,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            state!,
            style: TextStyle(
              fontSize: size.shortestSide * .04,
              fontWeight: FontWeight.w300,
            ),
          ),
          Text(
            "$persent%",
            style: TextStyle(
              fontSize: size.shortestSide * .04,
              fontWeight: FontWeight.w300,
            ),
          )
        ],
      ),
    );
  }
}
