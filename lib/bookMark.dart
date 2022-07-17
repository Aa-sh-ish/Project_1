import 'package:flutter/material.dart';
import 'package:project_1/Details.dart';
import 'package:project_1/Network/Network_2.dart';
import 'package:project_1/model/Move2_model.dart';
import 'package:sizer/sizer.dart';

class BookMark extends StatefulWidget {
  const BookMark({Key? key}) : super(key: key);

  @override
  State<BookMark> createState() => _BookMarkState();
}

class _BookMarkState extends State<BookMark> {
  Future<Movie_2>? movieData_2;
  Future<Movie_2> getList_2() async {
    NetworkHelper_2 networkHelper_2 = NetworkHelper_2();
    var movies_2 = await networkHelper_2.getMovieDetails_2();
    return movies_2;
  }

  var name = [
    "All",
    "Popular",
    "Movies",
    "Series",
    "Animations",
  ];
  @override
  void initState() {
    movieData_2 = getList_2();
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black12,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 4.h),
              Padding(
                padding: const EdgeInsets.only(left: 24, right: 24),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50.h),
                    color: Colors.white60,
                  ),
                  child: TextField(
                    cursorColor: Colors.teal,
                    onChanged: (val) {},
                    decoration: InputDecoration(
                      suffixIcon: Padding(
                        padding: const EdgeInsets.only(right: 24),
                        child: Icon(
                          Icons.search,
                          color: Color(0xff08211A),
                          size: 35,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(24),
                        borderSide: BorderSide(
                          color: Color(0xff00000000),
                          width: 2,
                        ),
                      ),
                      hintText: "Search",
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(24),
                        borderSide: BorderSide(
                          color: Color(0xff00000000),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 3.h,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Container(
                  height: 7.h,
                  child: Column(
                    children: [
                      Expanded(
                          child: ListView.builder(
                        itemCount: name.length,
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        // physics: NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Bottons('${name[index]}'),
                          );
                        },
                      ))
                    ],
                  ),
                ),
              ),
              FutureBuilder<Movie_2>(
                  future: movieData_2,
                  builder: ((context, snapshot) {
                    if (snapshot.hasData) {
                      return ListView.builder(
                          itemCount: snapshot.data!.results!.length,
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          scrollDirection: Axis.vertical,
                          itemBuilder: ((context, index) {
                            return Padding(
                              padding: const EdgeInsets.only(
                                  top: 15, left: 24, right: 24),
                              child: Container(
                                height: 20.h,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(24),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black,
                                      blurRadius: 5,
                                      offset: Offset(1.0, 5.0),
                                    )
                                  ],
                                ),
                                child: Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(left: 24),
                                      child: GestureDetector(
                                        onTap: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) => Details(
                                                  id: snapshot
                                                      .data!.results![index].id
                                                      .toString()),
                                            ),
                                          );
                                        },
                                        child: Container(
                                          height: 17.h,
                                          width: 17.h,
                                          child: Image.network(
                                              "https://image.tmdb.org/t/p/w500/${snapshot.data!.results![index].posterPath}"),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 2.w,
                                    ),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Container(
                                          width: 34.w,
                                          color: Color(0xff5EBA7D)
                                              .withOpacity(0.2),
                                          child: Text(
                                            " ${snapshot.data!.results![index].title}",
                                            style: TextStyle(
                                              fontSize: 10.sp,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              "Rating  ",
                                              style: TextStyle(fontSize: 10.sp),
                                            ),
                                            Text(
                                              "${snapshot.data!.results![index].voteAverage}",
                                              style: TextStyle(
                                                  fontSize: 10.sp,
                                                  color: Colors.red),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                    SizedBox(
                                      width: 5.w,
                                    ),
                                    Icon(
                                      Icons.bookmarks_outlined,
                                      size: 30,
                                      color: Color(0xff08211A),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          }));
                    } else {
                      return LinearProgressIndicator();
                    }
                  }))
            ],
          ),
        ),
      ),
    );
  }
}

class Bottons extends StatelessWidget {
  Bottons(this.name);

  var name;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: () {},
      child: Text(
        name,
        style: TextStyle(
          color: Colors.teal,
          fontWeight: FontWeight.bold,
          fontSize: 10.sp,
        ),
      ),
      style: OutlinedButton.styleFrom(
        //  backgroundColor: Color(0xff1A6350),
        primary: Colors.white,
        fixedSize: Size(150, 10),
        side: BorderSide(
          width: 3,
          color: Color(0xff1A6350),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
      ),
    );
  }
}
