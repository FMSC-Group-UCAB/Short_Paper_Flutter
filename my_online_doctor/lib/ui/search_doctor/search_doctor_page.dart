import 'dart:async';

import 'package:flutter/material.dart';
import 'package:my_online_doctor/application/streams/doctor_stream.dart';
import 'package:my_online_doctor/core/context_manager.dart';
import 'package:my_online_doctor/core/injection_manager.dart';
import 'package:my_online_doctor/domain/entities/doctor.dart';
import 'package:my_online_doctor/ui/components/search_field_component.dart';
import 'package:my_online_doctor/ui/components/show_error_component.dart';
import 'package:my_online_doctor/ui/styles/colors.dart';
import 'package:my_online_doctor/ui/styles/themes.dart';

class SearchDoctorPage extends StatefulWidget {


  @override
  _SearchDoctorPageState createState() => _SearchDoctorPageState();

}

class _SearchDoctorPageState extends State<SearchDoctorPage> {

  bool isTop = true;

  final TextEditingController _searchDoctorController = TextEditingController(text: '');
  final ScrollController _scrollController = ScrollController();

  

  late Stream<List<Doctor>> doctorStream;



  @override
  void initState() {
    super.initState();

    _scrollController.addListener(_scrollListener);

    _searchDoctor('');

  }


  void _scrollListener(){
    if(_scrollController.position.atEdge){
      _scrollController.position.pixels == 0 ? isTop = true : isTop = false;
      setState(() => isTop); 
    }

  }



  @override
  Widget build(BuildContext context) {

    getIt<ContextManager>().screenSize = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: Text('Buscador de doctores',
        style: textStyleAppBar(),
        ),
        centerTitle: true,
        backgroundColor: colorPrimary,
        // automaticallyImplyLeading: false, //Elimina el back button
      ),
      body: _body(),
      floatingActionButton: FloatingActionButton(
        backgroundColor: colorPrimary,
        onPressed: _changeScrollDirection,
        child: isTop ? const Icon(Icons.arrow_downward) : const Icon(Icons.arrow_upward),
      ),
    );

  }


  Widget _body() => Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      _buildDoctorSearchBar(),
      Expanded(
        child: StreamBuilder(
          stream: doctorStream,
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {

            if(snapshot.hasError){
              switch(snapshot.error){
                case 'No Doctors Found':
                  return const ShowErrorComponent(errorImagePath:'assets/images/no_doctor_found.png');
                default:
                  return const ShowErrorComponent(errorImagePath: 'assets/images/server_error.png');
              }
            } 

            switch(snapshot.connectionState) {

              case ConnectionState.waiting:
              case ConnectionState.none:
                return const Center(child: CircularProgressIndicator(color: colorPrimary,));

              case ConnectionState.done:
              case ConnectionState.active:
                return _buildDoctorsList(snapshot.data);
            }
          }
        ),
      ),
    ],
  );


  Widget _buildDoctorsList(List<Doctor> doctors) => Container(
        padding: const EdgeInsets.fromLTRB(0, 16, 16, 16),
        child:  ListView.builder(
          controller: _scrollController,
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          itemCount: doctors.length,
          itemBuilder: (context, index) {
            final doctor = doctors[index];
            
            return _buildDoctor(doctor);
          }
        ),
      );




  Widget _buildDoctor(Doctor doctor) =>  ListTile(
    leading: Container(
      margin: const EdgeInsets.only(left: 16, right: 16),
      child: ClipOval(
        child: Image.network('http://10.0.2.2:3000/api/doctors/image/doc1.jpg',
        width: 55,
        height: 55,
        fit: BoxFit.fill,
        ),
      ),
    ),
    title: doctor.gender == 'M' ? Text('Dr. ${doctor.firstName} ${doctor.lastName}'): Text('Dra. ${doctor.firstName} ${doctor.lastName}'),
    subtitle: _searchDoctorController.text != '' ? 
      Text(doctor.specialties.singleWhere((specialty) => specialty == _searchDoctorController.text.toUpperCase().trim())) 
      : (doctor.specialties.length > 1 ? Text(doctor.specialties[0] + ',  ' + doctor.specialties[1]): Text(doctor.specialties[0])),
  );


  Widget _buildDoctorSearchBar() => SearchFieldComponent(
        text: _searchDoctorController.text, 
        onChanged: _searchDoctor , 
        hintText: 'Buscar doctores por especialidad'
      );


  void _searchDoctor(String queryText) {

    _searchDoctorController.text = queryText;
    
    setState(() => doctorStream = DoctorStream.searchDoctor(queryText));
  }

  


  void _changeScrollDirection() {

    _scrollController.animateTo(
      isTop ? _scrollController.position.maxScrollExtent : _scrollController.position.minScrollExtent,
      duration: const Duration(milliseconds: 2500),
      curve: Curves.easeIn,
    );
    
  }


}




