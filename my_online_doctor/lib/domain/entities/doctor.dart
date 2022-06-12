import 'package:my_online_doctor/domain/enumerations/gender_type_enum.dart';
import 'package:my_online_doctor/domain/enumerations/specialty_type_enum.dart';

class Doctor {

  late final String _id;
  late String _firstName;
  late String _lastName;
  late List<SpecialtyType> _specialties;
  late String _location;
  late String _photo;
  late GenderType _gender;


  ///Constructor
  Doctor(String id, String firstName, String lastName, List<SpecialtyType> specialties, String location,
  String photo, GenderType gender) {

    _id = id;
    _firstName = firstName;
    _lastName = lastName;
    _specialties = specialties;
    _location = location;
    _photo = photo;
    _gender = gender;
  }


  ///Getters
  String get id => _id;
  String get firstName => _firstName;
  String get lastName => _lastName;
  List<SpecialtyType> get specialties => _specialties;
  String get location => _location;
  String get photo => _photo;
  GenderType get gender => _gender;


  ///Modelo de datos
  Doctor fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _firstName = json['firstName'];
    _lastName = json['lastName'];
    _specialties = json['specialties'];
    _location = json['location'];
    _photo = json['photo'];
    _gender = json['gender'];

    return this;
  }


  static Map<String, dynamic> toJson(Doctor model) => {
    'id' : model._id,
    'firstName' : model._firstName,
    'lastName' : model._lastName,
    'specialties' : model._specialties,
    'location' : model._location,
    'photo' : model._photo,
    'gender' : model._gender
  };



  ///Patron Factory
  static Doctor create(String id, String firstName, String lastName, List<SpecialtyType> specialties, String location,
  String photo, GenderType gender) {

    return Doctor(id, firstName, lastName, specialties, location, photo, gender);
  }

}