import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class App extends StatefulWidget {
  const App({super.key});

  @override
  State createState() => _AppState();
}

class _AppState extends State {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

//StatefulWidget을 넣어줘야 한다.
class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State createState() => _MainAppState();
}

// 앱의 데이터를 가지고 있는 부분이다.
class _MainAppState extends State {
  bool showtile = true;

//toggletitle 메서드
  void toggletitle() {
    setState(() {
//showtitile이 true 이면 false가 된다.
      showtile = !showtile;
    });
  }

  @override
  Widget build(BuildContext context) {
    print(showtile);
    return MaterialApp(
      theme: ThemeData(
        textTheme: const TextTheme(
          titleLarge: TextStyle(
            color: Colors.red,
          ),
        ),
      ),
      home: Scaffold(
        backgroundColor: Colors.teal,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              showtile ? const MyLargeTitle() : const Text('nothing'),
              IconButton(
                onPressed: toggletitle,
                icon: const Icon(Icons.remove_red_eye),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// statefull widget에서 extract widget을 사용해서 statelesswidget이 되었다.
// 그것을 다시 statefulwidget으로 변환시켜 준다.
class MyLargeTitle extends StatefulWidget {
  const MyLargeTitle({
    super.key,
  });

  @override
  State createState() => _MyLargeTitleState();
}

class _MyLargeTitleState extends State {
  int count = 0;
  @override
// 상태를 초기화 하기 위한 메서드
// 부모 요소에 의존하는 데이터를 초기화 하기 위해서 알고 있으면 좋다.
// 대부분을 쓸 일이 없다.
// initState는 build전에 초기화 된다.
  void initState() {
    super.initState();
    print('initState');
  }

  @override
// dispose 메소드는 위젯이 스크린에서 제거될 때 호출되는 메서드이다.
  void dispose() {
    super.dispose();
    print('dispose');
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      'My Large Title',
      style: TextStyle(
        fontSize: 40,
// 한 단계, 두 단계 등 더 위쪽 상위 요소의 데이터에 접근하기
        color: Theme.of(context)
            .textTheme
            .titleLarge
            ?.color, //! = 강력한 확신 , ? = 모호한 표현
      ),
    );
  }
}
