import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_db/themes/icon_color_theme.dart';
import 'package:movie_db/themes/main_color_theme.dart';
import 'package:movie_db/widgets/auth/auth_model_widget.dart';
import 'package:movie_db/widgets/auth/auth_widget.dart';
import 'package:movie_db/widgets/main_screen/main_widget.dart';
import 'package:movie_db/widgets/movie_details_screen/movie_details_widget.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          appBarTheme: const AppBarTheme(
            backgroundColor: AppMainColor.appColor,
          ),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: AppMainColor.appColor,
          selectedItemColor: AppIconColor.whiteColor,
          unselectedItemColor: AppIconColor.greyColor,
        ),
      ),
      routes: {
        '/auth_widget': (context) => AuthProvider(model: AuthModel(),
        child: const AuthWidget()),
        '/main_widget': (context) => const MainScreenWidget(),
        /*ниже указан маршрут к виджету, который принимает аргумент (id фильма),
        для безопасности осуществлена проверка на int , т.к id фильма заявлен формата
        int, соответственно ,если приходит int -> отображаем детальный виджет того
        фильма, чей id указан в аргументе, в противном слкчае подставляем дефолтный id -> 0*/
        '/main_widget/movie_details_widget': (context) {
          final arguments = ModalRoute.of(context)?.settings.arguments;
          if(arguments is int){
            return MovieDetailsWidget(movieId: arguments);
          }else{
            return const MovieDetailsWidget(movieId: 0);
          }
        }
      },
        initialRoute: '/auth_widget',
    );
  }
}
