import 'dart:convert';

// ignore: depend_on_referenced_packages
import 'package:http/http.dart' as http;
import 'package:my_online_doctor/domain/entities/doctor.dart';

/// DoctorRequest: This class is used to manage the doctors information from the server.
class DoctorRequest {

  static const String _doctorsUrl = 'http://10.0.2.2:3000/api/doctors/search?pageSize=0&pageIndex=0';

  // static const String _doctorsUrl = 'http://172.16.0.7:3000/api/doctors/search?pageSize=0&pageIndex=0';

  // final String _doctorsUrl = 'http://192.168.1.6:3000/api/doctors/search?pageSize=0&pageIndex=0';


/// This function is used to fetch the doctors from the server.
/// [specialty]: It is a [string] which contains the text of the specialty to search.
  static Future<List<Doctor>> fetchDoctors(String specialty) async {

    //If the specialty is empty, return all the doctors.
    final response = await http.post(Uri.parse(_doctorsUrl), body: specialty == '' ? {} : {'specialty': specialty});

    //Successful response
    if(response.statusCode == 200 || response.statusCode == 201 || response.statusCode == 202) {

      List<dynamic> body = jsonDecode(response.body);

      List<Doctor> doctors = body.map((dynamic item) => Doctor.fromJson(item)).toList();

      return doctors;

    } else if(response.statusCode == 400) {
      throw 'No Doctors Found';
      
    //Unsuccessful response
    } else {
      throw 'Server Error';
    }

  }


}