
import 'package:flutter/material.dart';

class Question extends StatefulWidget {
  const Question({super.key});

  @override
  State<Question> createState() => _QuestionState();
}

class _QuestionState extends State<Question> {
  List<Map<String, String>> todolist = [];

  var title = TextEditingController();
  var detail = TextEditingController();

  void showAddDialog() {
    title.clear();
    detail.clear();

    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("일정 등록"),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: title,
                  decoration: InputDecoration(
                    hintText: "제목을 입력하세요"
                  ),
                ),
                SizedBox(height: 10),
                TextField(
                  controller: detail,
                  decoration: InputDecoration(
                      hintText: "상세 내용을 입력하세요"
                  ),
                ),
              ],
            ),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text("취소"),
              ),
              TextButton(
                onPressed: () {
                  setState(() {
                    if(title.text.isNotEmpty)
                      todolist.add({
                        "title": title.text,
                        "details": detail.text,
                      });
                  });
                  Navigator.pop(context);
                },
                child: Text("확인"),
              ),
            ],
          );
        }
    );
  }

  void showDetails(String title, String details) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(title),
            content: Text(details.isNotEmpty
                ? details
                : "상세 내용이 없습니다."
            ),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text("닫기")
              ),
            ],
          );
        }
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
              child: ListView.builder(
                  itemCount: todolist.length,
                  itemBuilder: (context, index) {
                    final todo = todolist[index];
                    return ListTile(
                      // leading: Text("${index + 1} ${todo["title"]}"),
                      title: Text("${index + 1}       ${todo["title"]}"),
                      trailing: TextButton(
                          onPressed: () {
                            setState(() {
                              todolist.removeAt(index);
                            });
                          },
                          child: Text("삭제"),
                      ),
                      onTap: () => showDetails(
                        todo["title"]!,
                        todo["details"]!,
                      ),
                    );
                  }
              ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: showAddDialog,
        child: Text("등록"),
      ),
    );
  }
}

