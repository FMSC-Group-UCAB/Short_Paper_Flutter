import 'dart:async';

import 'package:flutter/material.dart';
import 'package:my_online_doctor/core/context_manager.dart';
import 'package:my_online_doctor/core/injection_manager.dart';
import 'package:my_online_doctor/domain/entities/doctor.dart';
import 'package:my_online_doctor/domain/enumerations/gender_type_enum.dart';
import 'package:my_online_doctor/domain/enumerations/specialty_type_enum.dart';
import 'package:my_online_doctor/request/doctor_request.dart';
import 'package:my_online_doctor/ui/components/search_field_component.dart';
import 'package:my_online_doctor/ui/styles/colors.dart';
import 'package:my_online_doctor/ui/styles/themes.dart';

class SearchDoctorPage extends StatefulWidget {


  @override
  _SearchDoctorPageState createState() => _SearchDoctorPageState();

}

class _SearchDoctorPageState extends State<SearchDoctorPage> {

  bool isTop = true;
  bool once = false;

  final TextEditingController _searchDoctorController = TextEditingController(text: '');
  final ScrollController _scrollController = ScrollController();

  final DoctorRequest doctorRequest = DoctorRequest();

  late Stream<List<Doctor>> doctorStream;



  @override
  void initState() {
    super.initState();

    _scrollController.addListener(_scrollListener);

    _searchDoctor('');

  }


  void _scrollListener(){
    if(_scrollController.position.atEdge){
      setState(() => isTop = !isTop); 
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
              return Center(
                child: Text('Error: ${snapshot.error}'),
              );
            } 

            switch(snapshot.connectionState) {

              case ConnectionState.waiting:
                return const Center(child: CircularProgressIndicator());

              case ConnectionState.done:
                return _buildDoctorsList(snapshot.data);
              case ConnectionState.none:
                // TODO: Handle this case.
                return const Center(child: Text('None'));
              case ConnectionState.active:
                // TODO: Handle this case.
                return const Center(child: Text('Active'));
              
            }
          }
        ),
      ),
    ],
  );


  Widget _buildDoctorsList(List<Doctor> doctors) => Container(
        padding: const EdgeInsets.fromLTRB(0, 16, 16, 16),
        child: doctors.isNotEmpty ? ListView.builder(
          controller: _scrollController,
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          itemCount: doctors.length,
          itemBuilder: (context, index) {
            final doctor = doctors[index];
            
            return _buildDoctor(doctor);
          }
        ):  Center(
          child: Image.asset(
            'assets/images/no_doctor.png', 
            width: getIt<ContextManager>().screenSize.width * 0.8,
            height: getIt<ContextManager>().screenSize.height * 0.6, 
          ),
        ),
      );




  Widget _buildDoctor(Doctor doctor) =>  ListTile(
    leading: Image.asset('assets/images/no_doctor.png',
    width: 50,
    height: 50,
    fit: BoxFit.fill,
    ),
    // leading: const CircleAvatar(
    //   radius: 48,
    //   backgroundImage: NetworkImage('http://localhost:3000/api/doctors/image/doc1.jpg'),
    // ),
    title: doctor.gender == 'M' ? Text('Dr. ${doctor.firstName} ${doctor.lastName}'): Text('Dra. ${doctor.firstName} ${doctor.lastName}'),
    subtitle: _searchDoctorController.text != '' ? 
      Text(doctor.specialties.singleWhere((specialty) => specialty == _searchDoctorController.text.toUpperCase().trim())) 
      :Text(doctor.specialties[0]),
  );


  Widget _buildDoctorSearchBar() => SearchFieldComponent(
        text: _searchDoctorController.text, 
        onChanged: _searchDoctor , 
        hintText: 'Buscar doctores por especialidad'
      );


  void _searchDoctor(String queryText) {
    
    setState(() => doctorStream = _searchDoctor2(queryText));
  }

  Stream<List<Doctor>> _searchDoctor2(String queryText)async* {

    var doctorsList = await doctorRequest.fetchDoctors(queryText.toUpperCase().trim());

    _searchDoctorController.text = queryText;
    
    yield doctorsList;
  }


  void _changeScrollDirection() {

    _scrollController.animateTo(
      isTop ? _scrollController.position.maxScrollExtent : _scrollController.position.minScrollExtent,
      duration: const Duration(milliseconds: 800),
      curve: Curves.easeIn,
    );
    
  }


}


