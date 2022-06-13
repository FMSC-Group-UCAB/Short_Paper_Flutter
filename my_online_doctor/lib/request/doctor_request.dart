import 'dart:convert';

// ignore: depend_on_referenced_packages
import 'package:http/http.dart' as http;
import 'package:my_online_doctor/domain/entities/doctor.dart';

class DoctorRequest {

  // final String _doctorsUrl = 'http://10.0.2.2:3000/api/doctors/search?pageSize=0&pageIndex=0';

  final String _doctorsUrl = 'http://192.168.1.6:3000/api/doctors/search?pageSize=0&pageIndex=0';


  Future<List<Doctor>> fetchDoctors(String specialty) async {

    final response = await http.post(Uri.parse(_doctorsUrl), body: specialty == '' ? {} : {'specialty': specialty});

    if(response.statusCode == 200 || response.statusCode == 201 || response.statusCode == 202) {

      List<dynamic> body = jsonDecode(response.body);

      List<Doctor> doctors = body.map((dynamic item) => Doctor.fromJson(item)).toList();

      return doctors;

    } else if(response.statusCode == 400) {
      throw 'No Doctors Found';
      
    } else {
      throw 'Server Error';
    }

  }


}