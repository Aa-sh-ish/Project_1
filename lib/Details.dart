import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:project_1/Network/NetworkDetails.dart';
import 'package:project_1/model/Details.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class Details extends StatefulWidget {
  String id;
  Details({Key? key, required this.id}) : super(key: key);

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  late Future<MovieModelDetails> futureMovie;
  @override
  void initState() {
    super.initState();
    futureMovie = getMovieDetails(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xff186C57),
            Color(0xff114235),
          ],
        ),
      ),
      child: Scaffold(
        backgroundColor: Color(0xff00000000),
        appBar: AppBar(
          backgroundColor: Color(0xff00000000),
          title: Text("Product details"),
          centerTitle: true,
        ),
        body: SafeArea(
          child: FutureBuilder<MovieModelDetails>(
              future: futureMovie,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 24),
                            child: Container(
                              color: Colors.white38,
                              width: 90.w,
                              height: 25.h,
                              child: Image(
                                image: NetworkImage(
                                    "https://image.tmdb.org/t/p/w500/${snapshot.data!.backdropPath}"),
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 3.h,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 23),
                        child: Text(
                          snapshot.data!.title.toString(),
                          style: TextStyle(
                              fontSize: 13.sp,
                              fontWeight: FontWeight.bold,
                              color: Colors.white60),
                        ),
                      ),
                      Text(
                        "Imdb: ${snapshot.data!.id}",
                        style: TextStyle(
                            fontSize: 9.sp,
                            // fontWeight: FontWeight.bold,
                            color: Colors.white54),
                      ),
                      SizedBox(
                        height: 3.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RatingBarIndicator(
                            rating:
                                snapshot.data!.voteAverage!.toDouble() / 2.5,
                            itemBuilder: (context, index) => Icon(
                              Icons.star,
                              color: Colors.amber,
                            ),
                            itemCount: 5,
                            itemSize: 3.h,
                            direction: Axis.horizontal,
                          ),
                          Text(
                            "    ${snapshot.data!.id} Reviews",
                            style: TextStyle(
                                fontSize: 9.sp, color: Colors.white60),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 3.h,
                      ),
                      Text(
                        "Descriptions",
                        style: TextStyle(
                            fontSize: 11.sp,
                            fontWeight: FontWeight.bold,
                            color: Colors.white60),
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      Container(
                        width: 60.w,
                        child: Text(
                          "${snapshot.data!.overview}",
                        ),
                      ),
                      SizedBox(
                        height: 3.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          OutlinedButton(
                            onPressed: () {},
                            child: Text(
                              "Watch Now",
                              style: TextStyle(
                                color: Colors.white70,
                                fontWeight: FontWeight.bold,
                                fontSize: 11.sp,
                              ),
                            ),
                            style: OutlinedButton.styleFrom(
                              backgroundColor: Color(0xff08211A),
                              primary: Colors.white,
                              fixedSize: Size(40.w, 6.h),
                              side: BorderSide(
                                width: 3,
                                color: Color(0xff08211A),
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 3.h,
                          ),
                          OutlinedButton(
                            onPressed: () {},
                            child: Text(
                              "BookMark",
                              style: TextStyle(
                                color: Colors.black54,
                                fontWeight: FontWeight.bold,
                                fontSize: 11.sp,
                              ),
                            ),
                            style: OutlinedButton.styleFrom(
                              backgroundColor: Colors.white70,
                              primary: Colors.teal,
                              fixedSize: Size(40.w, 6.h),
                              side: BorderSide(
                                width: 3,
                                color: Colors.white38,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  );
                } else {
                  return LinearProgressIndicator();
                }
              }),
        ),
      ),
    );
  }
}
