import 'package:my_online_doctor/domain/enumerations/gender_type_enum.dart';
import 'package:my_online_doctor/domain/enumerations/specialty_type_enum.dart';

class Doctor {

  late final String id;
  late String firstName;
  late String lastName;
  late List<SpecialtyType> specialties;
  late String location;
  late String photo;
  late GenderType gender;


  ///Constructor
  // Doctor(String id, String firstName, String lastName, List<SpecialtyType> specialties, String location,
  // String photo, GenderType gender) {

  //   _id = id;
  //   _firstName = firstName;
  //   _lastName = lastName;
  //   _specialties = specialties;
  //   _location = location;
  //   _photo = photo;
  //   _gender = gender;
  // }

  Doctor({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.specialties,
    required this.location,
    required this.photo,
    required this.gender
  });


  ///Getters
  // String get id => _id;
  // String get firstName => _firstName;
  // String get lastName => _lastName;
  // List<SpecialtyType> get specialties => _specialties;
  // String get location => _location;
  // String get photo => _photo;
  // GenderType get gender => _gender;


  ///Modelo de datos
  // factory Doctor.fromJson(Map<String, dynamic> json) {
  //   _id = json['id'];
  //   _firstName = json['firstName'];
  //   _lastName = json['lastName'];
  //   _specialties = json['specialties'];
  //   _location = json['location'];
  //   _photo = json['photo'];
  //   _gender = json['gender'];

  //   return this;
  // }

  factory Doctor.fromJson(Map<String, dynamic> json) {

    return Doctor(
      id:  json['id'],
      firstName:  json['firstName'],
      lastName:  json['lastName'],
      specialties:  json['specialties'],
      location:  json['location'],
      photo:  json['photo'],
      gender:  json['gender'],
    );
    

  }


  // static Map<String, dynamic> toJson(Doctor model) => {
  //   'id' : model._id,
  //   'firstName' : model._firstName,
  //   'lastName' : model._lastName,
  //   'specialties' : model._specialties,
  //   'location' : model._location,
  //   'photo' : model._photo,
  //   'gender' : model._gender
  // };



  ///Patron Factory
  // static Doctor create(String id, String firstName, String lastName, List<SpecialtyType> specialties, String location,
  // String photo, GenderType gender) {

  //   return Doctor(id, firstName, lastName, specialties, location, photo, gender);
  // }

}