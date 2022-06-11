///SpecialityType: Es un tipo enumerado que contiene los tipos de especialidades.
enum SpecialtyType { 
  cardiology, 
  opthalmology, 
  otolarogyngology, 
}

extension SpecialityTypeExtension on SpecialtyType {

  String get value{
    switch(this){
      case SpecialtyType.cardiology:
        return 'Cardiology';
      case SpecialtyType.opthalmology:
        return 'Opthalmology';
      case SpecialtyType.otolarogyngology:
        return 'Otolarogyngology';
    }
  }
}
