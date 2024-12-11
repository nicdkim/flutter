
import 'package:flutter/material.dart';

/*
* ListTile
* - Flutter 에서 리스트 아이템을 간편하게 구성할 수 있는 위젯
* - 텍스트, 아이콘, 이미지 등을 간단하게 배치할 수 있어 설정 화면,
* 채팅 목록, 연락처 목록 등의 리스트에서 자주 사용된다.
* */

class ListApp2 extends StatelessWidget {
  const ListApp2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text("리스트 테스트"),
        ),
      ),
      body: ListView(
        children: [
          ListTile(
            leading: Image.asset("assets/images/4.png"),
            title: Text("헬람이"),
            subtitle: Text("다람쥐"),
            trailing: Icon(Icons.delete),
            onTap: () {},
          ),
          ListTile(
            leading: Image.asset("assets/images/4.png"),
            title: Text("헬람이"),
            subtitle: Text("다람쥐"),
            trailing: Icon(Icons.delete),
            onTap: () {},
          ),
          ListTile(
            leading: Image.asset("assets/images/4.png"),
            title: Text("헬람이"),
            subtitle: Text("다람쥐"),
            trailing: Icon(Icons.delete),
            onTap: () {},
          ),
          ListTile(
            leading: Image.asset("assets/images/4.png"),
            title: Text("헬람이"),
            subtitle: Text("다람쥐"),
            trailing: Icon(Icons.delete),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
