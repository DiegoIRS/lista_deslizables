import 'package:flutter/material.dart';
import 'widget_Inicio/CustomContainerWidget.dart';
import 'widget_Inicio/MyCustomAppBar.dart';

class HomeWidget extends StatelessWidget {
  final Map<String, dynamic> estudianteData;

  HomeWidget({Key? key, required this.estudianteData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Ejemplo de cómo podrías acceder a los datos del estudiante
    String nombreEstudiante =
        estudianteData['nombre'] ?? 'Nombre no disponible';
    String correoEstudiante =
        estudianteData['correo'] ?? 'Correo no disponible';

    return DefaultTabController(
      length: 2, // Tenemos 2 tabs
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: CustomAppBar(
          nombreEstudiante: nombreEstudiante,
          correoEstudiante: correoEstudiante,
        ), // Asegúrate de que MyCustomAppBar acepte estos parámetros
        body: Column(
          children: <Widget>[
            TabBar(
              labelColor: Colors.black,
              unselectedLabelColor: Colors.grey,
              tabs: [
                Tab(text: 'Hoy'),
                Tab(text: 'Historial'),
              ],
            ),
            Expanded(
              child: TabBarView(
                children: [
                  // Vista para la pestaña "Hoy"
                  ListView.builder(
                    padding: EdgeInsets.all(16),
                    itemCount:
                        5, // Número de elementos, reemplaza con tu lista dinámica si es necesario
                    itemBuilder: (context, index) {
                      return Dismissible(
                        key: Key(
                            'curso-$index'), // Clave única para cada elemento
                        onDismissed: (direction) {
                          // Aquí puedes manejar la eliminación del curso
                          // (por ejemplo, actualizando tu lista de cursos)
                          // Ejemplo:
                          // setState(() {
                          //   cursos.removeAt(index);
                          // });
                        },
                        background: Container(
                          color: Colors
                              .red, // Color del fondo cuando se desliza para eliminar
                          alignment: Alignment.centerRight,
                          padding: EdgeInsets.symmetric(horizontal: 16),
                          child: Icon(
                            Icons.delete,
                            color: Colors.white,
                          ),
                        ),
                        child: CustomContainerWidget(
                          // Resto de tus propiedades para el CustomContainerWidget
                          clase: 'Cálculo',
                          profesor: 'Profesor Ejemplo',
                          sala: 'Sala F-208',
                          horario: '10:50am - 11:50am',
                          estado: index % 2 == 0
                              ? ClassStatus.inProgress
                              : ClassStatus.upcoming,
                        ),
                        // Agregamos esta propiedad para activar el deslizamiento hacia la izquierda
                        direction: DismissDirection.endToStart,
                        // Establecemos el tiempo de espera para activar el deslizamiento (3 segundos)
                        confirmDismiss: (direction) async {
                          return await Future.delayed(
                              Duration(seconds: 3), () => true);
                        },
                      );
                    },
                  ),
                  // Vista para la pestaña "Historial"
                  ListView.builder(
                    padding: EdgeInsets.all(16),
                    itemCount:
                        5, // Número de elementos, reemplaza con tu lista dinámica si es necesario
                    itemBuilder: (context, index) {
                      return CustomContainerWidget(
                        clase: 'Álgebra',
                        profesor: 'Profesor Historial',
                        sala: 'Sala H-101',
                        horario: '09:00am - 10:00am',
                        estado: index % 2 == 0
                            ? ClassStatus.attended
                            : ClassStatus.absent,
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

enum ClassStatus { inProgress, upcoming, attended, absent }

class CustomContainerWidget extends StatelessWidget {
  final String clase;
  final String profesor;
  final String sala;
  final String horario;
  final ClassStatus estado;

  CustomContainerWidget({
    required this.clase,
    required this.profesor,
    required this.sala,
    required this.horario,
    required this.estado,
  });

  @override
  Widget build(BuildContext context) {
    // Aquí puedes personalizar la apariencia de tu CustomContainerWidget
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Clase: $clase'),
          Text('Profesor: $profesor'),
          Text('Sala: $sala'),
          Text('Horario: $horario'),
          Text('Estado: ${_getStatusText()}'),
        ],
      ),
    );
  }

  String _getStatusText() {
    switch (estado) {
      case ClassStatus.inProgress:
        return 'En progreso';
      case ClassStatus.upcoming:
        return 'Próxima';
      case ClassStatus.attended:
        return 'Asistida';
      case ClassStatus.absent:
        return 'Ausente';
    }
  }
}
