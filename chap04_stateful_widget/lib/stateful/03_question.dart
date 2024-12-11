import 'package:flutter/material.dart';

class Question extends StatefulWidget {
  const Question({super.key});

  @override
  State<Question> createState() => _QuestionState();
}

class _QuestionState extends State<Question> {
  final List<Map<String, dynamic>> _list = [
    {"name": "피자", "like": 0},
    {"name": "돈까스", "like": 0},
    {"name": "스파게티", "like": 0},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text("Stateful Widget"),
        ),
      ),
      body: ListView.builder(
        itemCount: _list.length,
        itemBuilder: (context, index) {
          final food = _list[index];
          return Padding(
            padding: EdgeInsets.all(8),
            child: ListTile(
              leading: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "${food["like"]}",
                    style: TextStyle(fontSize: 15),
                  ),
                  SizedBox(width: 20),
                  Text(
                    food["name"],
                    style: TextStyle(fontSize: 15),
                  ),
                ],
              ),
              trailing: TextButton(
                onPressed: () {
                  setState(() {
                    food["like"] += 1;
                  });
                },
                child: Text(
                  "좋아요",
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
