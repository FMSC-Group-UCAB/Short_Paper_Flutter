// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace

import 'package:flutter/material.dart';

class Ajustes extends StatefulWidget {

  @override
  _AjustesState createState() => _AjustesState();

}


class _AjustesState extends State<Ajustes> {


  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();
  final TextEditingController _locationController = TextEditingController();


  @override
  void initState() {
    super.initState();
    
    setState(() {
      
    });
  }


  @override
  void dispose() {
    _nameController.dispose();
    _ageController.dispose(); 
    _locationController.dispose();

    super.dispose(); 
  }




  @override
  Widget build(BuildContext context) {

    
    return Scaffold(
      appBar: AppBar(
        title: Text('Ajustes'),
      ),
      body: Padding(
        padding: EdgeInsets.all(1.5),
        child: ListView(
          children: [
            Row(
              children: [
                Expanded(
                  child: Text('UUID')
                  ),
                  Container(
                    width: 120,
                    child: TextFormField(
                    // initialValue: userLoad.name??'',
                    controller: _nameController,
                    onChanged: (value) => setState(() {
                      // master.updateUserName(value);
                    })
                    ,
                  ),
                  )
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: Text('Question1')
                ),
                Container(
                  width: 120,
                  child: TextFormField(
                    // initialValue: userLoad.age??'',
                    controller: _ageController,
                    onChanged: (value) => setState(() {
                    })
                    ,
                  ),
                )
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: Text('Answer1')
                ),
                Container(
                  width: 120,
                  child: TextFormField(
                    // initialValue: userLoad.location??'',
                    controller: _locationController,
                    onChanged: (value) => setState(() {
                    })
                  ),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  child: Center(
                    child: ElevatedButton(
                      child: Text('Save', style: TextStyle(fontSize: 20)),
                      onPressed: () {
                      },
                    ),
                  ),
                ),
                Container(
                  child: Center(
                    child: ElevatedButton(
                      child: Text('Load', style: TextStyle(fontSize: 20)),
                      onPressed: () {
                      },
                    ),
                  ),
                ),
                Container(
                  child: Center(
                    child: ElevatedButton(
                      child: Text('Delete', style: TextStyle(fontSize: 20)),
                      onPressed: () {
                      },
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      )
    );
  }


  // void initSate() async {
  //   Preferencias.init().then((_) {
  //     setState(() {
  //     }); 
  //   });
  // }

}
