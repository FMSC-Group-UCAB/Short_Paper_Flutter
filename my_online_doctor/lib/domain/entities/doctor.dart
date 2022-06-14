///Doctor: Clase que representa un doctor.
class Doctor {

  late final int id;
  late String firstName;
  late String lastName;
  late List<dynamic> specialties;
  // late String location;
  late String photo;
  late String gender;


  ///Constructor
  Doctor({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.specialties,
    // required this.location,
    required this.photo,
    required this.gender
  });


  ///Getters
  int get getId => id;
  String get getFirstName => firstName;
  String get getLastName => lastName;
  List<dynamic> get getSpecialties => specialties;
  // String get location => location;
  String get getPhoto => photo;
  String get getGender => gender;


  ///Modelo de datos
  ///Decorder del json para los objetos de tipo [Doctor]
  factory Doctor.fromJson(Map<String, dynamic> json) {

    return Doctor.create(
      json['id'],
      json['firstName'],
      json['lastName'],
      json['specialties'],
      // location:  json['location'],
      json['image'],
      json['sex'],
    );
    
  }

  ///Encoder del json para los objetos de tipo [Doctor]
  static Map<String, dynamic> toJson(Doctor model) => {
    'id' : model.id,
    'firstName' : model.firstName,
    'lastName' : model.lastName,
    'specialties' : model.specialties,
    // 'location' : model.location,
    'photo' : model.photo,
    'gender' : model.gender
  };



  ///Patron Factory
  ///Crea una instancia de [Doctor]
  ///[id]: Es un [int] que representa el identificador del doctor.
  ///[firstName]: Es un [String] que representa el primer nombre del doctor.
  ///[lastName]: Es un [String] que representa el apellido del doctor.
  ///[specialties]: Es un [List<dynamic>] que representa las especialidades del doctor.
  ///[location]: Es un [String] que representa la ubicación del doctor.
  ///[photo]: Es un [String] que representa la foto del doctor.
  ///[gender]: Es un [String] que representa el genero de un doctor.
  static Doctor create(int id, String firstName, String lastName, List<dynamic> specialties,
  String photo, String gender) {

    return Doctor(
    id: id, 
    firstName: firstName, 
    lastName: lastName, 
    specialties: specialties, 
    // location: location, 
    photo: photo, 
    gender: gender);
  }

}