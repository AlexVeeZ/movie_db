import 'package:flutter/material.dart';
import 'package:movie_db/images/images.dart';



class Movie{
  final int id;
  final AssetImage imageName;
  final String title;
  final String time;
  final String description;

  Movie({required this.id, required this.imageName, required this.title,required this.time,required this.description});
}

class ListMovieWidget extends StatefulWidget {


  ListMovieWidget({Key? key}) : super(key: key);

  @override
  State<ListMovieWidget> createState() => _ListMovieWidgetState();
}

class _ListMovieWidgetState extends State<ListMovieWidget> {
  final _movies = [
    Movie(id: 1, imageName: AppImages.logoFilmGucci, title: 'Дом Gucci', time: '9 ноября 2021', description: 'Фамилия Гуччи звучала так сладко, так соблазнительно. Синоним роскоши, стиля, власти.',),
    Movie(id: 2, imageName: AppImages.logoFilmHunters, title: 'Охотники за привидениями: Наследники', time: '8 октября 2021', description: 'Мать-одиночка с двумя детьми-подростками селится на старой ферме в Оклахоме, полученной в наследство от отца, которого она не знала.',),
    Movie(id: 3, imageName: AppImages.logoFilmWestStory, title: 'Вестсайдская история', time: '29 ноября 2021', description: 'Нью-Йорк, конец 1950-х. История противостояния двух уличных банд и невозможной любви юноши и девушки из враждующих группировок.',),
    Movie(id: 4, imageName: AppImages.logoFilmSpider, title: 'Человек-паук: Нет пути домой', time: '15 декабря 2021', description: 'Жизнь и репутация Питера Паркера оказываются под угрозой, поскольку Мистерио раскрыл всему миру тайну личности Человека-паука.',),
    Movie(id: 5, imageName: AppImages.logoFilmEncanto, title: 'Энканто', time: '3 ноября 2021', description: 'Удивительная семья Мадригаль живет в спрятанном в горах Колумбии волшебном доме, расположенном в чудесном и очаровательном уголке под названием Энканто.',),
  ];

  //создаем контроллер для поиска
  final _textFieldController = TextEditingController();
  //функция с логикой поиска
  void _searchMovies(){
  final query = _textFieldController.text;
  //логика : если строка поиска не пуста, отображает те фильмы, в которых есть совпадения со строкой поиска
  if(query.isNotEmpty) {
    _filteredMovies = _movies.where((Movie movie) {
      return movie.title.toLowerCase().contains(query.toLowerCase());
    }).toList();
    //в противном случае, отображает все фильмы
  }else{
    _filteredMovies = _movies;
  }
  //добавляем метод setState для перерисовки виджета и отображение измененного списка
  setState(() {});
}
//лист отфильтрованных фильмов после поиска
var _filteredMovies = <Movie>[];

  //добавляем слушателя на пользовательский ввод (в initState!)
  @override
  void initState() {
    super.initState();
    //по умолчанию (до поиска), отфильтрованный список = списку
    _filteredMovies = _movies;
    _textFieldController.addListener(_searchMovies);
  }

  void _onMovieTap(int index){
    final id = _movies[index].id;
    Navigator.of(context).pushNamed('/main_widget/movie_details_widget', arguments: id);
  }

  @override
  Widget build(BuildContext context) {
    //виджет Stack необходим для поисковой строки поверх списка
    return Stack(
      children: [
        ListView.builder(
          //данный отступ top 70 , необходим для вставки поисковой строки
          padding: EdgeInsets.only(top: 70),
            //данный параметр позволяет убрать клавиатуру при клике на свободную область
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            itemCount: _filteredMovies.length,
            itemExtent: 163,
            itemBuilder: (BuildContext context, int index) {

              final movie = _filteredMovies[index];

              return Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
                //Stack необходим, чтобы поверх "карточки" накладывался эффект нажатия InkWell (см. далее)
                child: Stack(
                  children: [
                    Container(
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
                      //в данном случае обрезает углы картинки по закругленным углам рамки
                      clipBehavior: Clip.hardEdge,
                      //данный виджет делает кликабельным своего child
                      child: GestureDetector(
                        onTap: (){

                        },
                        child: Row(
                          children: [
                            Image(image: movie.imageName,),
                            //данный виджет позволяет занять все свободное пространство , оставшееся в родителе (row - image = expanded)
                            SizedBox(width: 15),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(height: 20),
                                  Text(movie.title,
                                    //1 строка / если больше - "..."
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(height: 5),
                                  Text(movie.time,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(color: Colors.grey)),
                                  SizedBox(height: 20),
                                  Text(movie.description,
                                    //текст занимает 2 строчки , в конце "..."
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(width: 10),
                          ],
                        ),
                      ),
                    ),
                    //вот ради этого виджета все обернуто в stack, его задача отображать "волну" от клика по всей карточке
                    Material(
                      //прозрачность , чтобы видно было контент
                      color: Colors.transparent,
                      //кликабельность
                      child: InkWell(
                        //чтобы волна от клика повторяла закругленные углы от карточки
                        borderRadius: BorderRadius.circular(10),
                        onTap: () => _onMovieTap(index),),
                    )
                  ],
                ),
              );
            }),
        //ниже блок с настройками поисковой строки
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: TextField(
            //прописываем контроллер, созданный ранее (см. выше)
            controller: _textFieldController,
            decoration: InputDecoration(
            labelText: 'Поиск',
            filled: true,
            //белый фон поиска с прозрачностью 235
            fillColor: Colors.white.withAlpha(235),
            border: OutlineInputBorder(),
          ),),
        ),
      ],
    );
  }
}
