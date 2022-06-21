import 'package:flutter/material.dart';
import 'package:my_online_doctor/infrastructure/core/context_manager.dart';
import 'package:my_online_doctor/infrastructure/core/injection_manager.dart';
import 'package:my_online_doctor/infrastructure/ui/search_doctor/search_doctor_page.dart';
import 'package:my_online_doctor/infrastructure/ui/styles/colors.dart';
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
            body: Center(
              child: Container(
                width: 250,
                height: 250,
                decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/doctor_logo.png'),
                      fit: BoxFit.cover,
                    )
                ),
              ),
            ) ,
            appBar: AppBar(
                title: Center(child: const Text("Inicio")),
                backgroundColor: colorPrimary,
                actions: <Widget>[]
            ),
            bottomNavigationBar: Container(
              height: 60,
              color: colorPrimary,
              child: InkWell(
                onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => SearchDoctorPage())),
                child: Padding(
                  padding: EdgeInsets.only(top: 8.0),
                  child: Column(
                    children: [
                      Icon(
                        Icons.arrow_circle_right,
                        color:  Colors.white,
                        size: 25,
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0,3,0,0),
                        child: Text('Buscar doctores.',
                          style: TextStyle(
                              color: Colors.white
                          ),),
                      ),
                    ],
                  ),
                ),
              ),
            )

            ,
          ),
        )
    );


  }


  void _mostrarAjustes(BuildContext context) {
    context = getIt<ContextManager>().context;
    Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => SearchDoctorPage())
    );
  }

}