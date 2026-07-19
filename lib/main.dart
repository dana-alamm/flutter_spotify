import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_10/core/services/SharedPrefsServices.dart';
import 'package:flutter_application_10/firebase_options.dart';
import 'package:flutter_application_10/screens/home_screen.dart';
import 'package:flutter_application_10/screens/splash_screen.dart';
//import 'package:flutter_application_10/features/splash/view_models/views/splash_screen.dart';
import 'package:flutter_application_10/screens/login_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await SharedPrefsServices.init();

  final bool isLoggedIn=SharedPrefsServices.getData(key: 'isLoggedIn')??false;

 
  //final bool isLoggedIn=prefs.getBool('isLoggedIn')??false;

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  //runApp(const MyApp());
  runApp(MyApp(isLoggedIn: isLoggedIn));
}

class MyApp extends StatelessWidget {
  final bool isLoggedIn;
  const MyApp({super.key, required this.isLoggedIn});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        
        colorScheme: .fromSeed(seedColor: Colors.deepPurple),
      ),
      home: isLoggedIn? const HomeScreen():const LoginScreen(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

 

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
     
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
      appBar: AppBar(
       
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        
        title: Text(widget.title),
      ),
      body: Center(
       
        child: Column(
         
          mainAxisAlignment: .center,
          children: [
            const Text('You have pushed the button this many times:'),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
