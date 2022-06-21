import 'dart:async';

import 'package:flutter/material.dart';
import 'package:my_online_doctor/application/streams/doctor_stream.dart';
import 'package:my_online_doctor/infrastructure/core/context_manager.dart';
import 'package:my_online_doctor/infrastructure/core/injection_manager.dart';
import 'package:my_online_doctor/domain/entities/doctor.dart';
import 'package:my_online_doctor/infrastructure/ui/components/search_field_component.dart';
import 'package:my_online_doctor/infrastructure/ui/components/show_error_component.dart';
import 'package:my_online_doctor/infrastructure/ui/styles/colors.dart';
import 'package:my_online_doctor/infrastructure/ui/styles/themes.dart';

///SearchDoctorPage: This class is used to manage the UI of the doctors search.
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

    //Get all doctors for the first time.
    _searchDoctor('');

  }


  /// This function [_scrollListener] is used to keep listening the position of the [_scrollController]
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
      ),
      body: _body(),
      floatingActionButton: FloatingActionButton(
        backgroundColor: colorPrimary,
        onPressed: _changeScrollDirection,
        child: isTop ? const Icon(Icons.arrow_downward) : const Icon(Icons.arrow_upward),
      ),
    );

  }


  /// This function [_body] is used to manage the body of the page.
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


  /// This function [_buildDoctorsList] is used to build the list of doctors.
  /// [doctors] is the list of doctors.
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



  /// This function [_buildDoctor] is used to build a tile of the doctor in the List of Doctors.
  /// [doctor] is the doctor to build.
  Widget _buildDoctor(Doctor doctor) =>  ListTile(
    leading: Container(
      margin: const EdgeInsets.only(left: 16, right: 16),
      child: ClipOval(
        // child: Image.network('http://172.16.0.7:3000/api/doctors/image/${doctor.photo}',
        child: Image.network('http://10.0.2.2:3000/api/doctors/image/${doctor.photo}',
        width: 55,
        height: 55,
        fit: BoxFit.fill,
        errorBuilder: (context, error, stackTrace) {
          return Image.asset('assets/images/doctor_logo.png');
        },
        ),
      ),
    ),
    title: doctor.gender == 'M' ? Text('Dr. ${doctor.firstName} ${doctor.lastName}'): Text('Dra. ${doctor.firstName} ${doctor.lastName}'),
    subtitle: _searchDoctorController.text != '' ? 
      Text(doctor.specialties.singleWhere((specialty) => specialty == _searchDoctorController.text.toUpperCase().trim())) 
      : (doctor.specialties.length > 1 ? Text(doctor.specialties[0] + ',  ' + doctor.specialties[1]): Text(doctor.specialties[0])),
  );


  /// This function [_buildDoctorSearchBar] is used to build the search bar of the doctors.
  Widget _buildDoctorSearchBar() => SearchFieldComponent(
        text: _searchDoctorController.text, 
        onChanged: _searchDoctor , 
        hintText: 'Buscar doctores por especialidad'
      );


  /// This function [_searchDoctor] is used to search the doctors.
  /// [queryText] is the text to search, based on the specialties.
  void _searchDoctor(String queryText) {

    _searchDoctorController.text = queryText;
    
    setState(() => doctorStream = DoctorStream.searchDoctor(queryText));
  }

  
  /// This function [_changeScrollDirection] is used to change the scroll direction of the [_scrollController].
  void _changeScrollDirection() {

    _scrollController.animateTo(
      isTop ? _scrollController.position.maxScrollExtent : _scrollController.position.minScrollExtent,
      duration: const Duration(milliseconds: 2500),
      curve: Curves.easeIn,
    );
  }


}




