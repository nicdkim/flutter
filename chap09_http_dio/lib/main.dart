import 'package:flutter/material.dart';

/*
* Http
* - HTTP 요청을 보내기 위해 사용하는 패키지
* - 서버와 통신할 때 GET,POST,PUT,DELETE 등 HTTP 메소드를
* 사용하여 데이터를 주고 받을 수 있게 해준다.
*
* http 패키지를 사용하는 이유
* - 네트워크 요청 관리 : 서버와 클라이언트 간 통신을
* 간편하게 처리할 수 있다.
* - 비동기 작업 지원 : 비종기적으로 요청을 처리하여
* UI 가 멈추지 않도록 한다.
* - RestFul API 와의 통합을 쉽게 처리할 수 있다.
* */

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
