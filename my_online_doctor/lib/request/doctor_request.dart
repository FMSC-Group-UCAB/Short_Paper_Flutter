import 'dart:convert';

// ignore: depend_on_referenced_packages
import 'package:http/http.dart' as http;
import 'package:my_online_doctor/domain/entities/doctor.dart';

class DoctorRequest {

  final String _doctorsUrl = 'http://192.168.1.3:3000/api/doctors/search?pageSize=0&pageIndex=0';


  Future<List<Doctor>> getAllDoctors() async {

    final response = await http.post(Uri.parse(_doctorsUrl), body: {});

    if(response.statusCode == 200 || response.statusCode == 201 || response.statusCode == 202) {

      List<dynamic> body = jsonDecode(response.body);

      List<Doctor> doctors = body.map((dynamic item) => Doctor.fromJson(item)).toList();

      return doctors;

    } else {
      throw 'No se pudieron obtener los doctores';
    }

  }


}