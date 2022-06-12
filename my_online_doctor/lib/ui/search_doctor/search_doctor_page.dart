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

  final TextEditingController _searchDoctorController = TextEditingController();
  final ScrollController _scrollController = ScrollController();

  final DoctorRequest doctorRequest = DoctorRequest();

  List<Doctor> doctors = [
    Doctor(id:'1', firstName: 'Juan', lastName: 'Perez', specialties: [SpecialtyType.cardiology], location: 'Calle 1', photo: 'https://upload.wikimedia.org/wikipedia/commons/thumb/8/81/Steen_Doctor_and_His_Patient.jpg/330px-Steen_Doctor_and_His_Patient.jpg', gender: GenderType.male),
    Doctor(id:'2', firstName: 'Maria', lastName: 'Juana', specialties: [SpecialtyType.opthalmology], location: 'Su consultorios', photo: 'https://upload.wikimedia.org/wikipedia/commons/thumb/8/81/Steen_Doctor_and_His_Patient.jpg/330px-Steen_Doctor_and_His_Patient.jpg', gender: GenderType.female),
    Doctor(id:'1', firstName: 'Juan', lastName: 'Perez', specialties: [SpecialtyType.cardiology], location: 'Calle 1', photo: 'https://upload.wikimedia.org/wikipedia/commons/thumb/8/81/Steen_Doctor_and_His_Patient.jpg/330px-Steen_Doctor_and_His_Patient.jpg', gender: GenderType.male),
    Doctor(id:'2', firstName: 'Maria', lastName: 'Juana', specialties: [SpecialtyType.opthalmology], location: 'Su consultorios', photo: 'https://upload.wikimedia.org/wikipedia/commons/thumb/8/81/Steen_Doctor_and_His_Patient.jpg/330px-Steen_Doctor_and_His_Patient.jpg', gender: GenderType.female),
    Doctor(id:'1', firstName: 'Juan', lastName: 'Perez', specialties: [SpecialtyType.cardiology], location: 'Calle 1', photo: 'https://upload.wikimedia.org/wikipedia/commons/thumb/8/81/Steen_Doctor_and_His_Patient.jpg/330px-Steen_Doctor_and_His_Patient.jpg', gender: GenderType.male),
    Doctor(id:'2', firstName: 'Maria', lastName: 'Juana', specialties: [SpecialtyType.opthalmology], location: 'Su consultorios', photo: 'https://upload.wikimedia.org/wikipedia/commons/thumb/8/81/Steen_Doctor_and_His_Patient.jpg/330px-Steen_Doctor_and_His_Patient.jpg', gender: GenderType.female),
    Doctor(id:'1', firstName: 'Juan', lastName: 'Perez', specialties: [SpecialtyType.cardiology], location: 'Calle 1', photo: 'https://upload.wikimedia.org/wikipedia/commons/thumb/8/81/Steen_Doctor_and_His_Patient.jpg/330px-Steen_Doctor_and_His_Patient.jpg', gender: GenderType.male),
    Doctor(id:'2', firstName: 'Maria', lastName: 'Juana', specialties: [SpecialtyType.opthalmology], location: 'Su consultorios',  photo:'https://upload.wikimedia.org/wikipedia/commons/thumb/8/81/Steen_Doctor_and_His_Patient.jpg/330px-Steen_Doctor_and_His_Patient.jpg', gender: GenderType.female),
    Doctor(id:'1', firstName: 'Juan', lastName: 'Perez', specialties: [SpecialtyType.cardiology], location: 'Calle 1', photo: 'https://upload.wikimedia.org/wikipedia/commons/thumb/8/81/Steen_Doctor_and_His_Patient.jpg/330px-Steen_Doctor_and_His_Patient.jpg', gender: GenderType.male),
    Doctor(id:'2', firstName: 'Maria', lastName: 'Juana', specialties: [SpecialtyType.opthalmology], location: 'Su consultorios', photo: 'https://upload.wikimedia.org/wikipedia/commons/thumb/8/81/Steen_Doctor_and_His_Patient.jpg/330px-Steen_Doctor_and_His_Patient.jpg',  gender:GenderType.female),
    Doctor(id:'1', firstName: 'Juan', lastName: 'Perez', specialties: [SpecialtyType.cardiology], location: 'Calle 1', photo: 'https://upload.wikimedia.org/wikipedia/commons/thumb/8/81/Steen_Doctor_and_His_Patient.jpg/330px-Steen_Doctor_and_His_Patient.jpg', gender: GenderType.male),
    Doctor(id:'2', firstName: 'Maria', lastName: 'Juana', specialties: [SpecialtyType.opthalmology], location: 'Su consultorios', photo: 'https://upload.wikimedia.org/wikipedia/commons/thumb/8/81/Steen_Doctor_and_His_Patient.jpg/330px-Steen_Doctor_and_His_Patient.jpg', gender: GenderType.female),
   
  ];

  late List<Doctor> doctors2;

  @override
  void initState() {
    super.initState();

    _scrollController.addListener(_scrollListener);

    doctors2 = doctors;
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
      child: FutureBuilder(
        future: doctorRequest.getAllDoctors(),
        builder: (BuildContext context, AsyncSnapshot<List<Doctor>> snapshot) {
          if(snapshot.hasData){
            doctors = snapshot.data!;
            doctors2 = snapshot.data!;
            return _search();
          }else if(snapshot.hasError){
            return Center(child: Text(snapshot.error.toString()));
          }else{
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    ),

    ],
  );


  Widget _search() => Container(
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
    leading: const CircleAvatar(
      radius: 48,
      backgroundImage: NetworkImage('https://upload.wikimedia.org/wikipedia/commons/thumb/8/81/Steen_Doctor_and_His_Patient.jpg/330px-Steen_Doctor_and_His_Patient.jpg'),
    ),
    title: doctor.gender == GenderType.male ? Text('Dr. ${doctor.firstName} ${doctor.lastName}'): Text('Dra. ${doctor.firstName} ${doctor.lastName}'),
    subtitle: Text(doctor.specialties[0].value),
  );

  Widget _buildDoctorSearchBar() => SearchFieldComponent(
    text: _searchDoctorController.text, 
    onChanged: _searchDoctor, 
    hintText: 'Buscar doctores por especialidad'
  );


  void _searchDoctor(String queryText) {
    final doctorSuggestions = doctors.where((doctor) {
      // final firstName = doctor.firstName.toLowerCase();
      // final lastName = doctor.lastName.toLowerCase();
      final specialty = doctor.specialties[0].value.toLowerCase();
      final input = queryText.toLowerCase();

      // return firstName.contains(input) || lastName.contains(input) || specialty.contains(input);
      return specialty.contains(input);

    }).toList();

    setState(() {
      doctors = queryText.isEmpty ? doctors2 : doctorSuggestions;
      _searchDoctorController.text = queryText;
    });

  }


  void _changeScrollDirection() {

    _scrollController.animateTo(
      isTop ? _scrollController.position.maxScrollExtent : _scrollController.position.minScrollExtent,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeIn,
    );
    
  }


}


