// This is an example unit test.
//
// A unit test tests a single function, method, or class. To learn more about
// writing unit tests, visit
// https://flutter.dev/docs/cookbook/testing/unit/introduction

import 'package:flutter_application/src/service/golf_service.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Tests', () {
    test('Should add two numbers together', () {
      expect(1 + 1, 2);
    });

    test('Testing if the JSON consumed is empty or not', () async {
      var golfCourse = await GolfService.getGolfCourses();
      expect(golfCourse.isNotEmpty, true);
    });

    test('Tests to comprobe if the JSON consumed give the data expected',
        () async {
      var golfCourse = await GolfService.getGolfCourses();
      expect(golfCourse[0].nombre, "Alhama Signature");
      expect(golfCourse[0].direccion, "Condado de Alhama Golf Resort");
      expect(golfCourse[0].cp, "30840");
      expect(golfCourse[0].municipio, "Alhama de Murcia");
      expect(golfCourse[0].pedania, "La Costera");
      expect(golfCourse[0].telefono, "968 328 008");
      expect(golfCourse[0].email, "reservas@gnkgolf.com");
      expect(golfCourse[0].url, "http://www.gnkgolf.com/");
      expect(golfCourse[0].latitud, "37.744373");
      expect(golfCourse[0].longitud, "-1.365422");
      expect(golfCourse[0].foto,
          "http://www.murciaturistica.es/webs/murciaturistica/fotos/1/campos-golf/recurso-1-1295-1p_g.jpg");

      expect(golfCourse[1].nombre, "La Torre Golf");
      expect(golfCourse[1].direccion, "Autovía Murcia-San Javier, salida 10");
      expect(golfCourse[1].cp, "30709");
      expect(golfCourse[1].municipio, "Torre Pacheco");
      expect(golfCourse[1].pedania, "ROLDAN");
      expect(golfCourse[1].telefono, "968 032 378");
      expect(golfCourse[1].email, "info@gnkgolf.com");
      expect(golfCourse[1].url, "http://www.gnkgolf.com/");
      expect(golfCourse[1].latitud, "37.88");
      expect(golfCourse[1].longitud, "-1.086");
      expect(golfCourse[1].foto,
          "http://www.murciaturistica.es/webs/murciaturistica/fotos/1/campos-golf/recurso-1-1309-1p_g.jpg");

      expect(golfCourse[2].nombre, "Campo de Golf La serena");
      expect(golfCourse[2].direccion, "Avda. Principe Felipe,30");
      expect(golfCourse[2].cp, "30710");
      expect(golfCourse[2].municipio, "Los Alcázares");
      expect(golfCourse[2].pedania, "LOS ALCÁZARES");
      expect(golfCourse[2].telefono, "968575576");
      expect(golfCourse[2].email, "info@laserenagolf.es");
      expect(golfCourse[2].url, "http://www.laserenagolf.es/");
      expect(golfCourse[2].latitud, "37.7280659");
      expect(golfCourse[2].longitud, "-0.8702652");
      expect(golfCourse[2].foto,
          "http://www.murciaturistica.es/webs/murciaturistica/fotos/1/campos-golf/recurso-1-6919-5p_g.jpg");

      expect(golfCourse[3].nombre, "Corvera Golf Club");
      expect(golfCourse[3].direccion,
          "Autovía A-30, Salida 408 - Corvera. Dirección Fuente Alamo, desvío La Murta-Los García");
      expect(golfCourse[3].cp, "30153");
      expect(golfCourse[3].municipio, "Murcia");
      expect(golfCourse[3].pedania, "CORVERA");
      expect(golfCourse[3].telefono, "868 462 008");
      expect(golfCourse[3].email, "corveragolfclub@corveragolf.com");
      expect(golfCourse[3].url, "www.corveraclubdegolf.com");
      expect(golfCourse[3].latitud, "37.835474");
      expect(golfCourse[3].longitud, "-1.164619");
      expect(golfCourse[3].foto,
          "http://www.murciaturistica.es/webs/murciaturistica/fotos/1/campos-golf/corveragolf1_g.jpg");

      expect(golfCourse[4].nombre, "El Valle Golf");

      expect(golfCourse[5].nombre, "Golf Altorreal");

      expect(golfCourse[6].nombre, "Hacienda del Álamo");

      expect(golfCourse[7].nombre, "Hacienda Riquelme Golf");

      expect(golfCourse[8].nombre, "La Manga Club - Campo Norte");

      expect(golfCourse[9].nombre, "La Manga Club - Campo Oeste");

      expect(golfCourse[10].nombre, "La Manga Club - Campo Sur");

      expect(golfCourse[11].nombre, "La Peraleja");

      expect(golfCourse[12].nombre, "Lorca Golf Resort");

      expect(golfCourse[13].nombre, "Mar Menor Golf");

      expect(golfCourse[14].nombre, "Mosa Trajectum");

      expect(golfCourse[15].nombre, "NEW SIERRA GOLF");

      expect(golfCourse[16].nombre, "Pitch & Putt - Torre Pacheco");

      expect(golfCourse[17].nombre, "Roda Golf");

      expect(golfCourse[18].nombre, "Saurines Golf");
    });
  });
}
