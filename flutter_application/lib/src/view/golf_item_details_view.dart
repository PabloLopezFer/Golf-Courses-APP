import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application/src/model/golf.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

/// Displays detailed information about a SampleItem.
class GolfCourseItemDetailsView extends StatelessWidget {
  final Golf golfCourse;

  // Constructor
  const GolfCourseItemDetailsView({Key? key, required this.golfCourse})
      : super(key: key);

  // Lugar donde se desplegará con detalle
  static const routeName = '/golf_item';

  @override
  Widget build(BuildContext context) {
    // Lista para establecer las marcas
    List<Marker> listOfMarkers = [];

    // Se añade la marca a la lista
    listOfMarkers.add(Marker(
        markerId: MarkerId(golfCourse.nombre),
        position: LatLng(double.parse(golfCourse.latitud),
            double.parse(golfCourse.longitud)),
        infoWindow: InfoWindow(title: golfCourse.direccion)));

    return Scaffold(
        // Barra de tareas donde se podrá volver atras y cambiar a modo oscuro
        appBar: AppBar(
          title: Text(golfCourse.nombre),
          backgroundColor: const Color.fromARGB(255, 115, 243, 132),
          actions: [
            // Switch para establecer el modo oscuro
            Switch(
                value:
                    AdaptiveTheme.of(context).mode == AdaptiveThemeMode.light,
                onChanged: (bool value) {
                  if (value) {
                    AdaptiveTheme.of(context).setLight();
                  } else {
                    AdaptiveTheme.of(context).setDark();
                  }
                })
          ],
        ),
        body: Center(
          child: Column(
            children: [
              Column(
                // Se mostrará los datos
                children: [
                  ConstrainedBox(
                      constraints: const BoxConstraints(
                    minWidth: 10,
                    minHeight: 10,
                    maxWidth: 31,
                    maxHeight: 51,
                  )),
                  Text(AppLocalizations.of(context)!.nombre,
                      style: const TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold)),
                  Text(
                    golfCourse.nombre,
                  ),
                  Text(AppLocalizations.of(context)!.direccion,
                      style: const TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold)),
                  Text(
                    golfCourse.direccion,
                  ),
                  Text(AppLocalizations.of(context)!.codigop,
                      style: const TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold)),
                  Text(
                    golfCourse.cp,
                  ),
                  Text(AppLocalizations.of(context)!.municipio,
                      style: const TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold)),
                  Text(
                    golfCourse.municipio,
                  ),
                  Text(AppLocalizations.of(context)!.pedania,
                      style: const TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold)),
                  Text(
                    golfCourse.pedania,
                  ),
                  Text(AppLocalizations.of(context)!.telefono,
                      style: const TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold)),
                  Text(
                    golfCourse.telefono,
                  ),
                  Text(AppLocalizations.of(context)!.email,
                      style: const TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold)),
                  Text(
                    golfCourse.email,
                  ),
                ],
              ),
              // Se mostrará la foto
              Expanded(child: Image.network(golfCourse.foto)),
              // Se mostrará el mapa con la marca puesta
              SizedBox(
                  width: 375.0,
                  height: 250.0,
                  child: GoogleMap(
                    initialCameraPosition: CameraPosition(
                      target: LatLng(double.parse(golfCourse.latitud),
                          double.parse(golfCourse.longitud)),
                    ),
                    markers: Set<Marker>.of(listOfMarkers),
                  ))
            ],
          ),
        ));
  }
}
