import 'package:gato/config/confi.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: "gato",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        primaryColor: Colors.purple,
        useMaterial3: true,
      ),
      home: Home(),
    );
  }
}
