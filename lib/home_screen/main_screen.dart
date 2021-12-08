//
// import 'dart:convert';
// import 'dart:math';
// import 'dart:ui';
// import 'dart:core';
// import 'package:carousel_slider/carousel_slider.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_blurhash/flutter_blurhash.dart';
// import 'package:flutter_spinkit/flutter_spinkit.dart';
// import 'package:flutterquotes1/quotes.dart';
// import 'package:http/http.dart' as http;
//
// class HomeScreen extends StatefulWidget {
//   const HomeScreen({Key? key}) : super(key: key);
//
//   @override
//   _HomeScreenState createState() => _HomeScreenState();
// }
//
// class _HomeScreenState extends State<HomeScreen> {
//   List imgList=[];
//   int imgIndex = 0;
//
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     getImageData();
//   }
//
//
//   @override
//   Widget build(BuildContext context) {
//     var width = MediaQuery.of(context).size.width;
//     var height = MediaQuery.of(context).size.height;
//
//     return Scaffold(
//         body: imgList != null ?
//         Stack(
//           children: [
//             AnimatedSwitcher(
//               duration: Duration(seconds: 1),
//               child: BlurHash(
//                 // duration: Duration(milliseconds: 500),
//                 key: ValueKey(imgList[imgIndex]['blur_hash']),
//                 hash: imgList[imgIndex]['blur_hash'],
//                 image: imgList[imgIndex]['urls']['regular'],
//                 imageFit: BoxFit.cover,
//               ),
//             ),
//             Container(
//               width: width,
//               height: height,
//               color: Colors.black.withOpacity(0.4),
//             ),
//
//             Container(
//               width: width,
//               height: height,
//               child: SafeArea(
//                 child: CarouselSlider.builder(
//                   itemCount: quoteList.length,
//                   itemBuilder: (context, index1, index2){
//                     return Column(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         Padding(
//                           padding: const EdgeInsets.all(20.0),
//                           child: Text(quoteList[index1][kQuote], style: TextStyle(fontSize: 25, color: Colors.white.withOpacity(0.95), fontWeight: FontWeight.bold),
//                             textAlign: TextAlign.center,
//                           ),
//                         ),
//                         SizedBox(height: 5,),
//                         Text('- ${quoteList[index1][kAuthor]} ', style: TextStyle(
//                           fontSize: 15,
//                           color: Colors.white.withOpacity(0.4),
//                           fontWeight: FontWeight.normal,
//                         ),
//                           textAlign: TextAlign.center,
//                         ),
//                       ],
//                     );
//                   },
//                   options: CarouselOptions(
//                       scrollDirection: Axis.vertical,
//                       pageSnapping: true,
//                       initialPage: 0,
//                       enlargeCenterPage: true,
//                       onPageChanged: (index, value){
//                         HapticFeedback.lightImpact();
//                         Random rand = Random();
//                         imgIndex = rand.nextInt(imgList.length);
//                         setState(() {
//
//                         });
//                       }
//                   ),
//                 ),
//               ),
//
//
//             ),
//
//           ],
//         ) : Container(
//           width: width,
//           height: height,
//           color: Colors.black,
//           child: Container(
//             width: 200,
//             height: 200,
//             child: SpinKitFadingCircle(
//               color: Colors.red,
//               size: 50.0,
//             ),
//           ),
//         )
//     );
//   }
//
//   void getImageData()async{
//     var url = 'https://api.unsplash.com/search/photos?per_page=30&query=nature&order_by=relevant&client_id=54X7xH2M-pwRSO6QRi059Xgt93i4DAYj2gJTP-Fbe10';
//     var uri = Uri.parse(url);
//     var response = await http.get(uri);
//     var imgData = json.decode(response.body);
//     imgList = imgData['results'];
//     setState(() {
//
//     });
//   }
// }




import 'dart:convert';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_blurhash/flutter_blurhash.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:http/http.dart' as http;

import '../quotes.dart';
import 'constant.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List imageList = [];
  int imageNumber = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getImagesFromUnsplash();
  }


  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return Scaffold(
        body:
        imageList != null ?
        Stack(
          children: [
            AnimatedSwitcher(
              duration: Duration(seconds: 1),
              child: BlurHash(
                key: ValueKey(imageList[imageNumber]['blur_hash']),
                hash: imageList[imageNumber]['blur_hash'],
                duration: Duration(milliseconds: 500),
                image: imageList[imageNumber]['urls']['regular'],
                curve: Curves.easeInOut,
                imageFit: BoxFit.cover,
              ),
            ),
            Container(
              width: width,
              height: height,
              color: Colors.black.withOpacity(0.6),
            ),

            Container(
              width: width,
              height: height,
              child: SafeArea(
                child: CarouselSlider.builder(
                  itemCount: quoteList.length,
                  itemBuilder: (context, index1, index2){
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Text(quoteList[index1][kQuote], style: kQuoteTextStyle,
                            textAlign: TextAlign.center,
                          ),
                        ),
                        SizedBox(height: 20,),
                        Text('- ${quoteList[index1][kAuthor]} -', style: kAuthorTextStyle,
                          textAlign: TextAlign.center,
                        ),
                      ],
                    );
                  },
                  options: CarouselOptions(
                      scrollDirection: Axis.vertical,
                      pageSnapping: true,
                      initialPage: 0,
                      enlargeCenterPage: true,
                      onPageChanged: (index, value){
                        HapticFeedback.lightImpact();
                        imageNumber = index;
                        setState(() {

                        });
                      }
                  ),
                ),
              ),


            ),
            Positioned(
                top: 50,
                right: 30,
                child: Row(
                  children: [
                    Text('${imageList[imageNumber]['user']['username']}', style: kAuthorTextStyle,),
                    Text(' On ',style: kAuthorTextStyle),
                    Text('Unsplash', style: kAuthorTextStyle)
                  ],
                ))
          ],
        )
            : Container(
          width: width,
          height: height,
          color: Colors.black.withOpacity(0.6),
          child: Container(
            width: 100,
            height: 100,
            child: SpinKitFadingCircle(
              color: Colors.white,
            ),
          ),
        )
    );
  }

  void getImagesFromUnsplash()async{
    var url = 'https://api.unsplash.com/search/photos?per_page=30&query=nature&order_by=relevant&client_id=54X7xH2M-pwRSO6QRi059Xgt93i4DAYj2gJTP-Fbe10';
    var uri = Uri.parse(url);
    var response = await http.get(uri);
    print(response.statusCode);
    var unsplashData = json.decode(response.body);
    imageList = unsplashData['results'];
    setState(() {

    });
  }
}