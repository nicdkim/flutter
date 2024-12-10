import 'package:flutter/material.dart';

class MyTest extends StatelessWidget {
  const MyTest({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "실습 앱",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 30,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.search,
              color: Colors.black,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.message,
              color: Colors.black,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.flag,
              color: Colors.black,
            ),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(
                  "assets/images/1.png",
                  width: 200,
                  height: 200,
                ),
                SizedBox(width: 20),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "다라미",
                        style: TextStyle(fontSize: 18),
                      ),
                      Text(
                        "다람쥐",
                        style: TextStyle(fontSize: 18),
                      ),
                      Text(
                        "관악구 신림동",
                        style: TextStyle(fontSize: 18),
                      ),
                      Row(
                        children: [
                          Icon(Icons.favorite),
                          Text("4")
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 30),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(
                  "assets/images/1.png",
                  width: 200,
                  height: 200,
                ),
                SizedBox(width: 20),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "화라미",
                        style: TextStyle(fontSize: 18),
                      ),
                      Text(
                        "다람쥐",
                        style: TextStyle(fontSize: 18),
                      ),
                      Text(
                        "송파구 석촌동",
                        style: TextStyle(fontSize: 18),
                      ),
                      Row(
                        children: [
                          Icon(Icons.favorite),
                          Text("6")
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.grey,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              onPressed: () {
                print("홈 클릭됨");
              },
              icon: Icon(Icons.home),
            ),
            IconButton(
              onPressed: () {
                print("검색 클릭됨");
              },
              icon: Icon(Icons.search),
            ),
            IconButton(
              onPressed: () {
                print("알림 클릭됨");
              },
              icon: Icon(Icons.notifications),
            ),
            IconButton(
              onPressed: () {
                print("마이페이지 클릭됨");
              },
              icon: Icon(Icons.person),
            ),
          ],
        ),
      ),
    );
  }
}
