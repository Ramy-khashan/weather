import 'package:flutter/material.dart';
import 'package:flutter_offline/flutter_offline.dart';
import 'controller.dart';

class SearchScreen extends StatelessWidget {
  SearchScreen({Key? key}) : super(key: key);
  final controller = SearchController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return  OfflineBuilder(
        connectivityBuilder: (
          BuildContext context,
          ConnectivityResult connectivity,
          Widget child,
        ) {
          final bool connected = connectivity != ConnectivityResult.none;
          return connected
              ? Scaffold( extendBodyBehindAppBar: true,
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              actions: [
                IconButton(
                    icon: Icon(
                      Icons.my_location_rounded,
                      size: size.shortestSide * .075,
                    ),
                    onPressed: () async {
                      await controller.getLocation(context);
                    })
              ],
            ),
                body:  Container(
            height: size.longestSide,
            decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(controller.cityImg),
                        fit: BoxFit.fill)),
            child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: size.shortestSide * .05),
                      child: TextField(
                        controller: controller.city,
                        style: TextStyle(
                            fontSize: size.shortestSide * .06,
                            color: Colors.black),
                        decoration: InputDecoration(
                            fillColor: Colors.white,
                            filled: true,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            contentPadding: EdgeInsets.symmetric(
                                vertical: size.longestSide * .03,
                                horizontal: size.shortestSide * .02),
                            hintStyle: TextStyle(
                                fontSize: size.shortestSide * .06,
                                color: Colors.black38),
                            hintText: 'Enter City Name'),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: size.shortestSide * .2),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: ElevatedButton.icon(
                            style: ButtonStyle(
                                padding: MaterialStateProperty.all(
                                    EdgeInsets.symmetric(
                                        vertical: size.longestSide * .02)),
                                backgroundColor: MaterialStateProperty.all(
                                    Colors.blue.shade900)),
                            onPressed: () async {
                              await controller.getCity(context);
                            },
                            icon: Icon(
                              Icons.search,
                              size: size.shortestSide * .07,
                            ),
                            label: Text(
                              "Search",
                              style: TextStyle(
                                  fontSize: size.shortestSide * .05),
                            )),
                      ),
                    )
                  ],
            ),
          ),

              )
              : Scaffold(
              body:Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ClipRRect(borderRadius: BorderRadius.circular(25),child: Image.asset("images/faild.png",width: size.shortestSide*.8,)),
                SizedBox(
                  height: size.longestSide * .035,
                ),
                Text(
                  'Connection Faild.. Cheak Your Network.',
                  style: TextStyle(
                    fontSize: size.shortestSide * .055,
                    fontWeight: FontWeight.w600,
                    fontStyle: FontStyle.italic,
                  ),
                )
              ],
            ),)
          );
        },
        child: CircularProgressIndicator(),

    );
  }
}
