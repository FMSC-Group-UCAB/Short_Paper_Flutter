import 'package:flutter/material.dart';
import 'package:my_online_doctor/domain/entities/doctor.dart';
import 'package:my_online_doctor/domain/enumerations/gender_type_enum.dart';
import 'package:my_online_doctor/domain/enumerations/specialty_type_enum.dart';
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

  List<Doctor> doctors = [
    Doctor.create('1', 'Juan', 'Perez', [SpecialtyType.cardiology], 'Calle 1', 'https://upload.wikimedia.org/wikipedia/commons/thumb/8/81/Steen_Doctor_and_His_Patient.jpg/330px-Steen_Doctor_and_His_Patient.jpg', GenderType.male),
    Doctor.create('2', 'Maria', 'Juana', [SpecialtyType.opthalmology], 'Su consultorios', 'https://upload.wikimedia.org/wikipedia/commons/thumb/8/81/Steen_Doctor_and_His_Patient.jpg/330px-Steen_Doctor_and_His_Patient.jpg', GenderType.female),
    Doctor.create('1', 'Juan', 'Perez', [SpecialtyType.cardiology], 'Calle 1', 'https://upload.wikimedia.org/wikipedia/commons/thumb/8/81/Steen_Doctor_and_His_Patient.jpg/330px-Steen_Doctor_and_His_Patient.jpg', GenderType.male),
    Doctor.create('2', 'Maria', 'Juana', [SpecialtyType.opthalmology], 'Su consultorios', 'https://upload.wikimedia.org/wikipedia/commons/thumb/8/81/Steen_Doctor_and_His_Patient.jpg/330px-Steen_Doctor_and_His_Patient.jpg', GenderType.female),
    Doctor.create('1', 'Juan', 'Perez', [SpecialtyType.cardiology], 'Calle 1', 'https://upload.wikimedia.org/wikipedia/commons/thumb/8/81/Steen_Doctor_and_His_Patient.jpg/330px-Steen_Doctor_and_His_Patient.jpg', GenderType.male),
    Doctor.create('2', 'Maria', 'Juana', [SpecialtyType.opthalmology], 'Su consultorios', 'https://upload.wikimedia.org/wikipedia/commons/thumb/8/81/Steen_Doctor_and_His_Patient.jpg/330px-Steen_Doctor_and_His_Patient.jpg', GenderType.female),
    Doctor.create('1', 'Juan', 'Perez', [SpecialtyType.cardiology], 'Calle 1', 'https://upload.wikimedia.org/wikipedia/commons/thumb/8/81/Steen_Doctor_and_His_Patient.jpg/330px-Steen_Doctor_and_His_Patient.jpg', GenderType.male),
    Doctor.create('2', 'Maria', 'Juana', [SpecialtyType.opthalmology], 'Su consultorios', 'https://upload.wikimedia.org/wikipedia/commons/thumb/8/81/Steen_Doctor_and_His_Patient.jpg/330px-Steen_Doctor_and_His_Patient.jpg', GenderType.female),
    Doctor.create('1', 'Juan', 'Perez', [SpecialtyType.cardiology], 'Calle 1', 'https://upload.wikimedia.org/wikipedia/commons/thumb/8/81/Steen_Doctor_and_His_Patient.jpg/330px-Steen_Doctor_and_His_Patient.jpg', GenderType.male),
    Doctor.create('2', 'Maria', 'Juana', [SpecialtyType.opthalmology], 'Su consultorios', 'https://upload.wikimedia.org/wikipedia/commons/thumb/8/81/Steen_Doctor_and_His_Patient.jpg/330px-Steen_Doctor_and_His_Patient.jpg', GenderType.female),
    Doctor.create('1', 'Juan', 'Perez', [SpecialtyType.cardiology], 'Calle 1', 'https://upload.wikimedia.org/wikipedia/commons/thumb/8/81/Steen_Doctor_and_His_Patient.jpg/330px-Steen_Doctor_and_His_Patient.jpg', GenderType.male),
    Doctor.create('2', 'Maria', 'Juana', [SpecialtyType.opthalmology], 'Su consultorios', 'https://upload.wikimedia.org/wikipedia/commons/thumb/8/81/Steen_Doctor_and_His_Patient.jpg/330px-Steen_Doctor_and_His_Patient.jpg', GenderType.female),
   
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

    return Scaffold(
      appBar: AppBar(
        title: Text('Buscador de doctores',
        style: textStyleAppBar(),
        ),
        centerTitle: true,
        backgroundColor: colorPrimary,
        // automaticallyImplyLeading: false, //Elimina el back button
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
        _buildDoctorSearch(),
        Expanded(
          child: Container(
            padding: const EdgeInsets.fromLTRB(0, 16, 16, 16),
            child: ListView.builder(
              controller: _scrollController,
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: doctors.length,
              itemBuilder: (context, index) {
                final doctor = doctors[index];
                
                return _buildDoctor(doctor);
              }
            ),
          ),
        ),

        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: colorPrimary,
        onPressed: _changeScrollDirection,
        child: isTop ? const Icon(Icons.arrow_downward) : const Icon(Icons.arrow_upward),
      ),
    );

  }


  Widget _buildDoctor(Doctor doctor) =>  ListTile(
    leading: CircleAvatar(
      radius: 48,
      backgroundImage: NetworkImage(doctor.photo),
    ),
    title: doctor.gender == GenderType.male ? Text('Dr. ${doctor.firstName} ${doctor.lastName}'): Text('Dra. ${doctor.firstName} ${doctor.lastName}'),
    subtitle: Text(doctor.specialties[0].value),
  );

  Widget _buildDoctorSearch() => SearchFieldComponent(
    text: _searchDoctorController.text, 
    onChanged: _searchDoctor, 
    hintText: 'Buscar doctores'
  );


  void _searchDoctor(String queryText) {
    final doctorSuggestions = doctors.where((doctor) {
      final firstName = doctor.firstName.toLowerCase();
      final lastName = doctor.lastName.toLowerCase();
      final specialty = doctor.specialties[0].value.toLowerCase();
      final input = queryText.toLowerCase();

      return firstName.contains(input) || lastName.contains(input) || specialty.contains(input);

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


