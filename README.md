<p align="center">
  <img src="https://albertomontesdeoca.xyz/wp-content/uploads/2020/08/flutter.jpeg" width="320" alt="Flutter Logo" />
</p>

## _myOnlineDoctor-Flutter_

_The Hackers_'s subgroup members:
- Manuel Da Pena
- Carlos Doffiny S-V
- Santiago Figueroa 
- Froilán Roa

## Installation
```bash
# Clean the dependencies
$ flutter clean

# Get the dependencies
$ flutter pub get
```

## Running the app
 Execute this commands combinations
```bash
# Select the device
$ Ctrl + Shift + P

# Select the option:
$ Flutter: Select Device
```
  Then select the device where you want to run the app
 ```bash
# Run the app
$ f5
```

## Tabla con las actividades mas significativas de cada integrante: 

# Da Pena, Manuel. 


| Actividad                                                                                                            | Commit                                                |
|----------------------------------------------------------------------------------------------------------------------|-------------------------------------------------------|
|Implementación de la arquitectura principal del backend. Se aplicó el patrón Decorador y la programación orientada a aspectos para la implementación de los servicios y el manejo de Cross-Cutting-Concerns. Se aplicaron los principios de SRP, LSP DIP, ISP y OCP junto con la programación genérica para implementar los servicios del backend. Se aplicó SoC de forma tal que los controladores son quienes se encargan de invocar a los servicios y estos de inyectar las dependencias a los casos de uso para luego realizar las operaciones pertinentes.                                                                 | https://github.com/FMSC-Group-UCAB/Short-Papers-NestJs/pull/1 |
| Implementación de los servicios, endpoints y queries de la búsqueda de doctores por especialidad de forma paginada.  |https://github.com/FMSC-Group-UCAB/Short-Papers-NestJs/pull/2 |
| Implementación del caso de uso de búsqueda de doctores parametrizado por especialidad y paginación. Aplicación de inyección de dependencias para desacoplar los Repository de Doctor. Implementación de endpoint para las imágenes de los doctores.                              | https://github.com/FMSC-Group-UCAB/Short-Papers-NestJs/pull/6 |
|Refactorización de los nombre de los servicios con el sufijo de “Query” y cambio de nombres de las especialidades a español. Implementación de nuevos DTOs para la comunicación entre capas.| https://github.com/FMSC-Group-UCAB/Short-Papers-NestJs/pull/7  |


# Doffiny S-V, Carlos.

|Actividad                                              |                         Commit                     |
|-----------------------------------------------------------------------------------------------------------|-----------------------------------------------------|
| mplementación de la vista de la búsqueda de doctores por especialidad, con su barra de búsqueda, visualización del listado de los doctores y  manejo del scroll de la vista.| https://github.com/FMSC-Group-UCAB/Short_Paper_Flutter/commit/94340805cf447f9b54dfc7602c56aae55a384df3 |
| Implementación del patrón Stream para el manejo de la programación asíncrona en la vista de los doctores, en sus cuatro estados. Cuando el canal está cerrado, cuando está abierto esperando un resultado, cuando recibe el resultado y cuando arroja una excepción.                                  | https://github.com/FMSC-Group-UCAB/Short_Paper_Flutter/commit/c0c44c75215d1e64993291ed27467c58192419b3 |
| Implementación de la integración de la aplicación móvil con el servicio de NestJS y su base de datos en PostgreSQL. Para ello se hizo uso de las librerías http y convert de Dart, y del patrón de asincronía Futter.                                  | https://github.com/FMSC-Group-UCAB/Short_Paper_Flutter/commit/4778819d1fee265a20a44144dc4da9c48a2babd6  |                                                                                                   



# Figueroa, Santiago.

|Actividad                                                  | Commit                                               |
|-----------------------------------------------------------------------------------------------------------|-------------------------------------------------------|
| Implementación de un Stored Procedure en la base de datos que genera los doctores con la información correspondiente a cada uno, como también se crearon tablas auxiliares de nombres para la generación de información. | https://github.com/FMSC-Group-UCAB/Short-Papers-NestJs/pull/8  |
| Implementación de la clase Mapper, que convierte entidades de dominio (Doctor) en entidades de persistencia (DoctorEntity) y viceversa.                        | https://github.com/FMSC-Group-UCAB/Short-Papers-NestJs/pull/3 |



# Roa, Froilán. 

| Actividad                                                                                                            | Commit                                                |
|----------------------------------------------------------------------------------------------------------------------|-------------------------------------------------------|
|Implementación de excepciones de dominio para la entidad y ValueObjets de los Doctores.                                                                 | https://github.com/FMSC-Group-UCAB/Short-Papers-NestJs/pull/5 |
| Implementación de la interfaz de inicio en Flutter con los botones de navegación con sus funcionalidades para ir a la pantalla que filtra los doctores. |https://github.com/FMSC-Group-UCAB/Short_Paper_Flutter/commit/1d3c9cd81c104fa1c112f0515d701d87a4e5f894 |
| Implementación del manejo de error en caso de que el usuario no tenga una foto registrada, para que la aplicación coloque una por defecto.                              | https://github.com/FMSC-Group-UCAB/Short_Paper_Flutter/commit/1d3c9cd81c104fa1c112f0515d701d87a4e5f894|
