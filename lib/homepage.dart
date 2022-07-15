import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:project_1/Details.dart';
import 'package:project_1/Network/Network_1.dart';
import 'package:project_1/model/Movie_model.dart';
import 'package:sizer/sizer.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future<Movie>? movieData;
  Future<Movie> getList() async {
    NetworkHelper networkHelper = NetworkHelper();
    var movies = await networkHelper.getMovieDetails();
    return movies;
  }

  final List<String> imgList = [
    "asset/facebook.png",
    "asset/google.png",
    "asset/facebook.png",
    "asset/Logo.png",
    "asset/google.png",
    "asset/twitter.png"
  ];

  @override
  void initState() {
    // TODO: implement initState
    movieData = getList();
    super.initState();
  }

  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Color(0xff186C57), Color(0xff1B1C1C)]),
      ),
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Text("HomePage"),
            backgroundColor: Color(0x00000000),
            elevation: .1,
            shadowColor: Colors.black,
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 24),
                child: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.search,
                    size: 4.h,
                  ),
                ),
              ),
            ],
          ),
          backgroundColor: Color(0x00000000),
          drawer: Drawer(
            child: ListView(
              children: [
                UserAccountsDrawerHeader(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Color(0xff186C57),
                        Color(0xff1B1C1C),
                      ],
                    ),
                  ),
                  accountName: Text("Aashish"),
                  accountEmail: Text(
                    "aashish33lamsal@gmail.com",
                  ),
                ),
                ListTile(
                  title: Text("Popular"),
                  leading: Icon(
                    Icons.fireplace,
                    color: Colors.teal,
                  ),
                ),
                ListTile(
                  title: Text("Movie"),
                  leading: Icon(
                    Icons.movie,
                    color: Colors.teal,
                  ),
                ),
                ListTile(
                  title: Text("Series"),
                  leading: Icon(
                    Icons.movie_filter,
                    color: Colors.teal,
                  ),
                ),
                ListTile(
                  title: Text("Anime"),
                  leading: Icon(
                    Icons.animation,
                    color: Colors.teal,
                  ),
                )
              ],
            ),
          ),
          body: SingleChildScrollView(
            child: FutureBuilder<Movie>(
              future: movieData,
              builder: ((context, snapshot) {
                if (snapshot.hasData) {
                  return Column(
                    children: [
                      SizedBox(
                        height: 2.h,
                      ),
                      Text(
                        "Trending Movies",
                        style: TextStyle(
                          color: Colors.white60,
                          fontWeight: FontWeight.w900,
                          fontSize: 20.sp,
                        ),
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        child: Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                colors: [Color(0xff186C57), Color(0xff1B1C1C)]),
                            // color: Colors.white10,
                            borderRadius: BorderRadius.all(
                              Radius.circular(25),
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black,
                                blurRadius: 5,
                                spreadRadius: 5,
                              )
                            ],
                          ),
                          child: CarouselSlider(
                            items: imgList
                                .map((item) => Container(
                                      child: Center(
                                          child: Image.asset(item,
                                              fit: BoxFit.cover, width: 40.w)),
                                    ))
                                .toList(),
                            options: CarouselOptions(
                              height: 25.h,
                              aspectRatio: 16 / 9,
                              viewportFraction: 0.6,
                              initialPage: 1,
                              enableInfiniteScroll: true,
                              reverse: false,
                              autoPlay: true,
                              autoPlayInterval: Duration(milliseconds: 20),
                              autoPlayAnimationDuration:
                                  Duration(milliseconds: 200),
                              autoPlayCurve: Curves.fastOutSlowIn,
                              enlargeCenterPage: true,
                              //onPageChanged: callbackFunction,
                              scrollDirection: Axis.horizontal,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 3.h),
                      Container(
                        height: 10.h,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.black26,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "TV Series",
                              style: TextStyle(
                                  color: Colors.white54,
                                  fontSize: 20.sp,
                                  fontWeight: FontWeight.w900),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 3.h,
                      ),
                      Container(
                        height: 34.h,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [
                              Color(0xff186C57),
                              Color(0xff1B1C1C),
                            ],
                          ),
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black,
                              blurRadius: 5,
                              spreadRadius: 7,
                            )
                          ],
                        ),
                        child: Column(
                          children: [
                            Expanded(
                              child: ListView.builder(
                                itemCount: snapshot.data!.results!.length,
                                shrinkWrap: true,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: ((context, index) {
                                  return Padding(
                                    padding: const EdgeInsets.only(
                                        top: 24, left: 24),
                                    child: Container(
                                      child: Column(
                                        children: [
                                          GestureDetector(
                                            onTap: () {
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) => Details(
                                                      id: snapshot.data!
                                                          .results![index].id
                                                          .toString()),
                                                ),
                                              );
                                            },
                                            child: Container(
                                              height: 28.h,
                                              width: 40.w,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(24),
                                                color: Colors.white38,
                                                boxShadow: [
                                                  BoxShadow(
                                                    color: Colors.black,
                                                    blurRadius: 5,
                                                    spreadRadius: 3,
                                                  )
                                                ],
                                              ),
                                              child: Image.network(
                                                  "https://image.tmdb.org/t/p/w500/${snapshot.data!.results![index].posterPath}"),
                                            ),
                                          ),
                                          SizedBox(height: 10),
                                          Text(
                                            "${snapshot.data!.results![index].title}",
                                            style: TextStyle(
                                                fontSize: 10.sp,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white60),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                }),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  );
                } else {
                  return LinearProgressIndicator();
                }
              }),
            ),
          ),
        ),
      ),
    );
  }
}
