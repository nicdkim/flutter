/*
* StatefulWidget
* - Flutter 에서 상태를 가진 위젯을 만들 때 사용하는 클래스
* - Flutter 위젯은 기본적으로 불변 이지만,
* StatefulWidget 을 사용하면 동적인 상태를 가진 위젯을
* 만들 수 있다. 위젯은 사용자 상호작용, 데이터 변화 등으로
* 인해 상태가 변경될 수 있고, 변경될 때 마다 UI가 다시 빌드된다.
* */

import 'package:flutter/material.dart';

// class StatefulTest extends StatefulWidget {
//   const StatefulTest({super.key});
//
//   @override
//   State<StatefulTest> createState() => _StatefulTestState();
// }
//
// class _StatefulTestState extends State<StatefulTest> {
//   var a = 1;
//   @override
//   Widget build(BuildContext context) {
//     return FloatingActionButton(
//       child: Text(a.toString()),
//       onPressed: () {
//         print(a);
//         a++;
//       },
//     );
//   }
// }

class StatefulTest extends StatefulWidget {
  const StatefulTest({super.key});

  @override
  State<StatefulTest> createState() => _StatefulTestState();
}

class _StatefulTestState extends State<StatefulTest> {
  var a = 1;
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      child: Text(a.toString()),
      onPressed: () {
        setState(() {
          a++;
        });
      },
    );
  }
}
