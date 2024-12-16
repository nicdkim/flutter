import 'package:flutter/material.dart';

import 'nav.dart';

/*
* BottomNavigationBar
* - 하단 네비게이션 바를 구현하는데 사옹된다.
* 유저가 탭을 클릭하면 onTap 이 실행되고
* 선택된 인덱스가 변경된다.
* 선택된 인덱스에 따라서 다른 위젯을 표시할 수 있다.
*
* 주요 속성
* - currentIndex : 현재 선택된 탭의 인덱스
* - onTap
* - items
* */

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyPage(),
    );
  }
}

class Movie {
  final String title;
  final String director;
  final String description;

  Movie({
    required this.title,
    required this.director,
    required this.description,
  });
}

class MyPage extends StatefulWidget {
  const MyPage({super.key});

  @override
  State<MyPage> createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  int _selectedIndex = 0;

  final List<Movie> _movies = [];
  final List<Movie> _searchResults = [];

  String _searchQuery = "";

  final _pages = [];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      if(_selectedIndex == 2) {
        _searchResults.clear();
        _searchQuery = "";
      }
    });
  }

  void _addMovie(String title, String director, String description) {
    setState(() {
      _movies.add(Movie(title: title, director: director, description: description));
    });
  }

  void _deleteMovie(int index) {
    setState(() {
      _movies.removeAt(index);
    });
  }

  void _searchMovies(String query) {
    setState(() {
      _searchQuery = query;
      _searchResults.clear();
      _searchResults.addAll(_movies.where((movie) =>
        movie.title.toLowerCase().contains(query.toLowerCase()) ||
        movie.director.toLowerCase().contains(query.toLowerCase()) ||
        movie.description.toLowerCase().contains(query.toLowerCase())
      ));
    });
  }

  void _showMovieDetails(Movie movie) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(movie.title, style: TextStyle(fontSize: 20)),
              SizedBox(height: 10),
              Text(movie.director, style: TextStyle(fontSize: 20)),
              SizedBox(height: 10),
              Text(movie.description, style: TextStyle(fontSize: 20)),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text("닫기"),
            ),
          ],
        );
      },
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("영화 관리 앱"),
      ),
      body: _getPage(),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: [
          BottomNavigationBarItem(
            label: "영화 목록",
            icon: Icon(Icons.movie_outlined),
            activeIcon: Icon(Icons.movie),
          ),
          BottomNavigationBarItem(
            label: "영화 등록",
            icon: Icon(Icons.add_outlined),
            activeIcon: Icon(Icons.add),
          ),
          BottomNavigationBarItem(
            label: "영화 검색",
            icon: Icon(Icons.search_outlined),
            activeIcon: Icon(Icons.search),
          )
        ],
      ),
    );
  }

  Widget _getPage() {
    switch (_selectedIndex) {
      case 0:
        return _movieListPage();
      case 1:
        return _movieRegisterPage();
      case 2:
        return _movieSearchPage();
      default:
        return Center(
            child: Text("페이지 없음")
        );
    }
  }

  Widget _movieListPage() {
    return _movies.isEmpty ?
        Center(
          child: Text("등록된 영화가 없습니다."),
        ) :
        ListView.builder(
          itemCount: _movies.length,
          itemBuilder: (context, index) {
            final movie = _movies[index];
            return ListTile(
              title: Text(movie.title),
              subtitle: Text("감독: ${movie.director}"),
              trailing: IconButton(
                  icon: Icon(Icons.delete, color: Colors.red,),
                  onPressed: () =>
                    _deleteMovie(index),
                  ),
                    onTap: () => _showMovieDetails(movie),
            );
          }
        );
  }

  Widget _movieRegisterPage() {
    final TextEditingController titleController = TextEditingController();
    final TextEditingController directorController = TextEditingController();
    final TextEditingController descriptionController = TextEditingController();

    return Padding(
      padding: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("영화 제목", style: TextStyle(fontSize: 20)),
          TextField(controller: titleController),

          SizedBox(height: 10),
          Text("감독", style: TextStyle(fontSize: 20)),
          TextField(controller: directorController),

          SizedBox(height: 10),
          Text("설명", style: TextStyle(fontSize: 20)),
          TextField(controller: descriptionController),

          SizedBox(height: 20),
          Center(
            child: ElevatedButton(
              onPressed: () {
                if (titleController.text.isNotEmpty &&
                    directorController.text.isNotEmpty &&
                    descriptionController.text.isNotEmpty) {
                  _showConfirmDialog(
                    titleController.text,
                    directorController.text,
                    descriptionController.text,
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("모든 필드를 입력해 주세요.")),
                  );
                }
              },
              child: Text("영화 등록"),
            ),
          ),
        ],
      ),
    );
  }

  void _showConfirmDialog(String title, String director, String description) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("영화를 등록하시겠습니까?"),
          content: Text("제목: $title\n감독: $director\n설명: $description"),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text("취소"),
            ),
            ElevatedButton(
              onPressed: () {
                _addMovie(title, director, description);
                Navigator.pop(context);
                setState(() {
                  _selectedIndex = 0;
                });
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("영화가 등록 되었습니다.")),
                );
              },
              child: Text("확인"),
            ),
          ],
        );
      },
    );
  }



  Widget _movieSearchPage() {
    return Padding(
        padding: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("영화 검색", style: TextStyle(fontSize: 16),),
          Row(
            children: [
              Expanded(
                  child: TextField(
                    onChanged: (value) => _searchMovies(value),
                    decoration: InputDecoration(hintText: "검색어 입력"),
                  ),
              ),
              ElevatedButton(
                  onPressed: () {},
                  child: Text("검색"),
              ),
            ],
          ),
          Expanded(
              child: _searchResults.isEmpty ?
                  Center(
                    child: Text(
                        _searchQuery.isEmpty ?
                            "검색 결과가 없습니다" :
                            "검색 결과가 없습니다: '$_searchQuery'",
                    ),
                  )
                  : ListView.builder(
                      itemCount: _searchResults.length,
                      itemBuilder: (context, index) {
                        final movie = _searchResults[index];
                        return ListTile(
                          title: Text(movie.title),
                          subtitle: Text("감독: ${movie.director}"),
                          onTap: () => _showMovieDetails(movie),
                        );
                      },
              ),
          ),
        ],
      ),
    );
  }





}





