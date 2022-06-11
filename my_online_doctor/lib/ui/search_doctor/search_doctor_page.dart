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

  final TextEditingController _searchDoctorController = TextEditingController();

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
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
        _buildDoctorSearch(),
        Expanded(
          child: Container(
            padding: const EdgeInsets.fromLTRB(8, 16, 16, 16),
            child: ListView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: doctors.length,
              itemBuilder: (context, index) {
                final doctor = doctors[index];

                return ListTile(
                  // leading: const Icon(Icons.person),
                  leading: CircleAvatar(
                    radius: 48,
                    backgroundImage: NetworkImage(doctor.photo),
                  ),
                  title: Text('${doctor.firstName} ${doctor.lastName}'),
                  subtitle: Text(doctor.specialties[0].value),
                );
              }
            ),
          ),
        ),

        ],
      )
    );

  }


  Widget _buildDoctorSearch() => SearchFieldComponent(
    text: _searchDoctorController.text, 
    onChanged: _searchDoctor, 
    hintText: 'Buscar doctores'
  );


  void _searchDoctor(String queryText) {
    final doctorSuggestions = doctors.where((doctor) {
      final doctorName = doctor.firstName.toLowerCase();
      final input = queryText.toLowerCase();

      return doctorName.contains(input);

    }).toList();

    setState(() => doctors = doctorSuggestions);

  }


}


