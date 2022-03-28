import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_db/images/images.dart';
import 'package:movie_db/themes/icon_color_theme.dart';
import 'package:movie_db/themes/main_color_theme.dart';

class MovieDetailsHeaderWidget extends StatelessWidget {
  const MovieDetailsHeaderWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          _PosterWidget(),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: _MovieNameWidget(),
          ),
          _RaitingWidget(),
          _SummeryWidget(),
          _OverviewMovieWidget(),
          _MovieActorsWidget(),
        ],
      ),
    );
  }
}

class _PosterWidget extends StatelessWidget {
  const _PosterWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image(
          image: AppImages.PosterFilmGucci,
        ),
        Positioned(
          top: 20,
          left: 20,
          bottom: 20,
          child: Container(
              width: 120,
              height: 240,
              child: Image(
                image: AppImages.logoFilmGucci,
              )),
        )
      ],
    );
  }
}

class _MovieNameWidget extends StatelessWidget {
  const _MovieNameWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //данный виджет помогает объединять тексты разных стилей, в нашем случае заголовок и дату выхода фильма
    return RichText(
        textAlign: TextAlign.center,
        maxLines: 3,
        text: TextSpan(
          children: [
            TextSpan(
                text: 'Дом Gucci ',
                style: TextStyle(
                    fontSize: 20,
                    color: AppIconColor.whiteColor,
                    fontWeight: FontWeight.bold)),
            TextSpan(
                text: ' (2021)',
                style: TextStyle(color: AppIconColor.greyColor, fontSize: 16)),
          ],
        ));
  }
}

class _SummeryWidget extends StatelessWidget {
  const _SummeryWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: AppMainColor.appColorThird,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 10),
        child: Text(
          'Канада, США, 9 ноября 2021, 2ч 38м, биография, драма, криминал, триллер',
          textAlign: TextAlign.center,
          maxLines: 3,
          style: TextStyle(color: AppIconColor.whiteColor, fontSize: 16),
        ),
      ),
    );
  }
}

class _MovieActorsWidget extends StatelessWidget {
  const _MovieActorsWidget({Key? key}) : super(key: key);

  static const personTextStyle = TextStyle(color: AppIconColor.whiteColor);
  static const positionTextStyle = TextStyle(color: AppIconColor.greyColor);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
      Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Ридли Скотт',style: personTextStyle),
            Text('Режиссер',style: positionTextStyle),
            SizedBox(height: 35),
            Text('Бекки Джонстон',style: personTextStyle),
            Text('Сценарий',style: positionTextStyle),
          ],
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Франческа Чинголани',style: personTextStyle),
            Text('Продюссер',style: positionTextStyle),
            SizedBox(height: 35),
            Text('Дариуш Вольски',style: personTextStyle),
            Text('Оператор',style: positionTextStyle),
          ],
        ),
      )
    ],);
  }
}
class _OverviewMovieWidget extends StatelessWidget {
  const _OverviewMovieWidget({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Обзор:', style: TextStyle(
              fontSize: 18,
              color: AppIconColor.greyColor,
              fontWeight: FontWeight.bold)),
          SizedBox(height: 10,),
          Text('Фамилия Гуччи звучала так сладко, так соблазнительно. '
              'Синоним роскоши, стиля, власти. Но она же была их проклятьем. '
              'Шокирующая история любви, предательства, падения и мести, '
              'которая привела к жестокому убийству в одной из самых знаменитых модных империй мира.',
            maxLines: 7, style: TextStyle(color: AppIconColor.whiteColor, fontSize: 14)),
        ],
      ),
    );
  }
}

class _RaitingWidget extends StatelessWidget {
  const _RaitingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        TextButton(onPressed: (){}, child: Text('Рейтинг',style: TextStyle(color: AppIconColor.greyColor),)),
        Container(height: 15,width: 1,color: AppIconColor.greyColor,),
        TextButton(onPressed: (){}, child: Text('Трейлер',style: TextStyle(color: AppIconColor.greyColor),)),
      ],
    );
  }
}



