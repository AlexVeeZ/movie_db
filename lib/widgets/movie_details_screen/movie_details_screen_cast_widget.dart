import 'package:flutter/material.dart';
import 'package:movie_db/images/images.dart';
import 'package:movie_db/themes/icon_color_theme.dart';
import 'package:movie_db/themes/main_color_theme.dart';


class MovieDetailsScreenCastWidget extends StatelessWidget {
  const MovieDetailsScreenCastWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ColoredBox(color: AppIconColor.whiteColor,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Text('Актеры', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),),
        ),
        SizedBox(
          height: 300,
          child: Scrollbar(
            child: ListView.builder(
              itemCount: 5,
              itemExtent: 120,
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext context, int index){
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    //черная рамка с прозрачностью 0.2, закругление углов 10
                    border: Border.all(color: Colors.black.withOpacity(0.2)),
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    //тень
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        //рассеивание тени (эффект "дымки")
                        blurRadius: 8,
                        //смещение тени (чтоб ее было видно 0- по гризонт/ 2 -по верт)
                        offset: Offset(0, 2),
                      )
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                    clipBehavior: Clip.hardEdge,
                    child: Column(
                      children: [
                        Image(image: AppImages.ActorFilmGucci),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Леди Гага'),
                              SizedBox(height: 7,),
                              Text('Актриса'),
                              SizedBox(height: 7,),
                              Text('Главная роль'),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(3.0),
          child: TextButton(onPressed: (){}, child: Text('Полный состав и команда')),
        )
      ],
    ),);
  }
}
