import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../component/multiinfo.dart';
import '../search/view.dart';
import 'package:flutter_offline/flutter_offline.dart';

class MainPageScreen extends StatelessWidget {
  final data;

  const MainPageScreen({this.data, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
            icon: Icon(
              Icons.search,
              size: size.shortestSide * .075,
            ),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => SearchScreen()));
            }),
      ),
      body: Container(
        padding: EdgeInsets.only(left: size.shortestSide * .05),
        decoration: const BoxDecoration(
            image: DecorationImage(
          image: AssetImage(
            "images/rain.jpeg",
          ),
          fit: BoxFit.cover,
        )),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              height: size.longestSide * .15,
            ),
            Text(
              data['name'],
              style: TextStyle(fontSize: size.shortestSide * .08),
            ),
            Text(
              DateFormat.yMMMEd().format(DateTime.now()),
              style: TextStyle(
                  fontSize: size.shortestSide * .055,
                  fontWeight: FontWeight.w300),
            ),
            const Spacer(),
            Text(
              "${data['main']['temp'].toString().substring(0, 4)} °F",
              style: TextStyle(fontSize: size.shortestSide * .11),
            ),
            Row(children: [
              Image(
                width: size.width * .18,
                image: NetworkImage(
                  "http://openweathermap.org/img/wn/${data["weather"][0]['icon']}@2x.png",
                ),
                loadingBuilder: (BuildContext context, Widget child,
                    ImageChunkEvent? loadingProgress) {
                  if (loadingProgress == null) {
                    return child;
                  }
                  return Center(
                    child: CircularProgressIndicator(
                      value: loadingProgress.expectedTotalBytes != null
                          ? loadingProgress.cumulativeBytesLoaded /
                              loadingProgress.expectedTotalBytes!
                          : null,
                    ),
                  );
                },errorBuilder:(BuildContext context, Object exception, StackTrace? stackTrace)
                {
                  return const Icon(Icons.not_interested_sharp);
                }                ,
              ),
              Text(
                data["weather"][0]['description'],
                style: TextStyle(
                    fontSize: size.shortestSide * .055,
                    fontWeight: FontWeight.w200),
              ),
            ]),
            Divider(
              height: size.longestSide * .1,
              color: Colors.white,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                MultiItem(
                  persent: data['wind']['speed'].toString(),
                  state: "Wind",
                ),
                Container(
                    height: size.longestSide * .085,
                    color: Colors.grey,
                    width: size.shortestSide * .005),
                MultiItem(
                  persent: data['main']['humidity'].toString(),
                  state: "Humidity",
                ),
              ],
            ),
            SizedBox(
              height: size.longestSide * .04,
            ),
          ],
        ),
      ),
    );
  }
}
