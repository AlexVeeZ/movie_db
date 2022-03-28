import 'package:flutter/material.dart';
import 'package:movie_db/images/images.dart';
import 'package:movie_db/themes/icon_color_theme.dart';
import 'package:movie_db/widgets/movie_%20screen/list_movie_widget.dart';

class MainScreenWidget extends StatefulWidget {
  const MainScreenWidget({Key? key}) : super(key: key);

  @override
  _MainScreenWidgetState createState() => _MainScreenWidgetState();
}

class _MainScreenWidgetState extends State<MainScreenWidget> {
  int _selectedTab = 0;

  void onSelected(int index) {
    if (_selectedTab == index) return;
    setState(() {
      _selectedTab = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //backgroundColor: AppMainColor.appColor,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(image: AppImages.logoMDB,
              width: 70,
              height: 70,
            ),
          ],
        ),
      ),
      //данный виджет хранит состояние всех виджетов , но отображает в ед. времени только один
      body: IndexedStack(
        //параметр index  указывает, какой виджет отображать (в данной ситуации отображает по нажатию на вкладку)
        index: _selectedTab,
        children:[
        Icon(Icons.home, size: 100,color: AppIconColor.blueColor,),
          ListMovieWidget(),
          Icon(Icons.tv, size: 100, color: AppIconColor.blueColor,),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedTab,
        onTap: onSelected,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Новости'),
          BottomNavigationBarItem(
              icon: Icon(Icons.video_library), label: 'Фильмы'),
          BottomNavigationBarItem(icon: Icon(Icons.tv), label: 'Сериалы'),
        ],
      ),
    );
  }
}
