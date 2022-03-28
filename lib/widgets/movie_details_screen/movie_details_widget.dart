import 'package:flutter/material.dart';
import 'package:movie_db/themes/icon_color_theme.dart';
import 'package:movie_db/themes/main_color_theme.dart';
import 'package:movie_db/widgets/movie_details_screen/movie_details_header_widget.dart';
import 'package:movie_db/widgets/movie_details_screen/movie_details_screen_cast_widget.dart';

class MovieDetailsWidget extends StatefulWidget {
  final movieId;

  const MovieDetailsWidget({Key? key, required this.movieId}) : super(key: key);

  @override
  _MovieDetailsWidgetState createState() => _MovieDetailsWidgetState();
}

class _MovieDetailsWidgetState extends State<MovieDetailsWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //backgroundColor: AppMainColor.appColor,
        title: Row(
          children: [
            Container(
                child: Icon(
              Icons.menu,
              color: AppIconColor.whiteColor,
            )),
            SizedBox(width: 49),
            Container(
              height: 70,
              width: 70,
              child: Image.asset('assets/mdb.jpg'),
            ),
            SizedBox(width: 65),
            Container(
                child: Icon(
              Icons.person,
              color: AppIconColor.whiteColor,
            )),
            SizedBox(width: 10),
            Container(
                child: Icon(
              Icons.search,
              color: AppIconColor.blueColor,
            )),
          ],
        ),
      ),
      body: ColoredBox(
        color: AppMainColor.appColorSecond,
        child: ListView(
          children: [
            MovieDetailsHeaderWidget(),
            MovieDetailsScreenCastWidget(),
          ],
        ),
      ),
    );
  }
}
