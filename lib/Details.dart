import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class Details extends StatefulWidget {
  String id;
  Details({Key? key, required this.id}) : super(key: key);

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
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
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 24),
                    child: Container(
                      height: 40.h,
                      width: 60.w,
                      color: Colors.white38,
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
                  "",
                  style: TextStyle(
                      fontSize: 13.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.white60),
                ),
              ),
              Text(
                "Tmdb: Number",
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
                    rating: 3.2,
                    itemBuilder: (context, index) => Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                    itemCount: 5,
                    itemSize: 3.h,
                    direction: Axis.horizontal,
                  ),
                  Text(
                    "    108 Reviews",
                    style: TextStyle(fontSize: 9.sp, color: Colors.white60),
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
                  "akdhflxwh fanlxhflakjhfkajhbf kfkjxangfkugaocf uagbxifayg sjdfa akflhaksjf asndfkjasb fkajdbf akjsbdfa a,sdkjf asjf ",
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
          ),
        ),
      ),
    );
  }
}
