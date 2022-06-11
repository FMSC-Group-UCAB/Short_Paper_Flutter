import 'package:flutter/material.dart';
import 'package:my_online_doctor/ui/styles/colors.dart';
import 'package:my_online_doctor/ui/styles/themes.dart';

class SearchDoctorPage extends StatefulWidget {


  @override
  _SearchDoctorPageState createState() => _SearchDoctorPageState();

}

class _SearchDoctorPageState extends State<SearchDoctorPage> {

  final TextEditingController _searchDoctorController = TextEditingController();



  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('Buscador de doctores',
        style: textStyleAppBar(),
        ),
        // actions: [
        //   IconButton(
        //     icon: const Icon(Icons.settings),
        //     onPressed: () => {},
        //   )
        // ],
        // automaticallyImplyLeading: false, //Elimina el back button
      ),
      body: Column(
        children: [
         Container(
            padding: const EdgeInsets.all(16),
            child: TextField(
              controller: _searchDoctorController,
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.search),
                hintText: 'Buscar doctor',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: const BorderSide(color: colorPrimary)
                ),
              ),
            ),
         ) ,
        ],
      )
    );

  }
}


