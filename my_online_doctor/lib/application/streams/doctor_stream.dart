import 'package:my_online_doctor/domain/entities/doctor.dart';
import 'package:my_online_doctor/request/doctor_request.dart';

class DoctorStream {

  static Stream<List<Doctor>> searchDoctor(String queryText)async* {

    var doctorsList = await DoctorRequest.fetchDoctors(queryText.toUpperCase().trim());
    
    yield doctorsList;
  }
}