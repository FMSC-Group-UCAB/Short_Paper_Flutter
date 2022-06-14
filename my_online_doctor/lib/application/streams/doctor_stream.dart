import 'package:my_online_doctor/domain/entities/doctor.dart';
import 'package:my_online_doctor/request/doctor_request.dart';

///DoctorStream: This class is used to manage the doctor stream.  
class DoctorStream {

  /// This stream function [searchDoctor] is used to get the doctors from the server.
  /// [queryText]: It is a [string] which contains the text of the specialty to search.
  static Stream<List<Doctor>> searchDoctor(String queryText)async* {

    var doctorsList = await DoctorRequest.fetchDoctors(queryText.toUpperCase().trim());

    yield doctorsList;
  }
}