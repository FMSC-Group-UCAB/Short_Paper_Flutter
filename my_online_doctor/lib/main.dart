import 'package:flutter/material.dart';
import 'package:my_online_doctor/core/context_manager.dart';
import 'package:my_online_doctor/core/injection_manager.dart';
import 'package:my_online_doctor/ui/search_doctor/search_doctor_page.dart';
import 'package:my_online_doctor/ui/styles/colors.dart';
void main() {

  InjectionManager.setupInjections();

  runApp(MyHomePage());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Online Doctor',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:  MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {


  @override
  Widget build(BuildContext context) {

  getIt<ContextManager>().context = context;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // theme:  mainTheme(),
      home: Builder(
        builder: (context) => Scaffold(
      appBar: AppBar(
        title: const Text("Inicio"),
        backgroundColor: colorPrimary,
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => SearchDoctorPage())),
            // onPressed: () => _mostrarAjustes(context),
          )
        ]
      ),
    ),
  )
  );
    
    
  }


}