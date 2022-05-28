// ignore_for_file: constant_identifier_names

import 'dart:convert';

import '../model/golf.dart';
import 'package:http/http.dart' as http;

class GolfService {
  // URL de donde consumir el JSON
  static const String URL = "https://pablolopezfer.github.io/CamposdeGolf.json";

  static List<Golf> golfList = [];

  // Método al que se llamará para consumir el JSON
  static Future<List<Golf>> getGolfCourses() async {
    var response = await http.get(Uri.parse(URL));

    if (response.statusCode != 200) {
      return [];
    }

    GolfService.golfList = tourJSON(json.decode(response.body));

    return GolfService.golfList;
  }

  // Método al que se llamará para recorrer de forma adecuada el JSON
  static List<Golf> tourJSON(List<dynamic> array) {
    List<Golf> golfCourses = [];
    for (var course in array) {
      if (course["Nombre"] != "La Manga Adventure Golf" &&
          course["Nombre"] != "Campo de Golf La serena" &&
          course["Nombre"] != "Corvera Golf Club" &&
          course["Nombre"] != "Mosa Trajectum" &&
          course["Nombre"] != " Alhama Signature" &&
          course["Nombre"] != " La Torre Golf" &&
          course["Nombre"] != "NEW SIERRA GOLF" &&
          course["Nombre"] != "La Peraleja" &&
          course["Nombre"] != "El Valle Golf" &&
          course["Nombre"] != "Golf Altorreal" &&
          course["Nombre"] != "Hacienda del Álamo" &&
          course["Nombre"] != "Hacienda Riquelme Golf" &&
          course["Nombre"] != "La Manga Club - Campo Norte" &&
          course["Nombre"] != "La Manga Club - Campo Oeste" &&
          course["Nombre"] != "La Manga Club - Campo Sur" &&
          course["Nombre"] != "Lorca Golf Resort" &&
          course["Nombre"] != "Mar Menor Golf" &&
          course["Nombre"] != "Mosa Trajectum" &&
          course["Nombre"] != "Pitch & Putt - Torre Pacheco" &&
          course["Nombre"] != "Roda Golf " &&
          course["Nombre"] != "Saurines Golf") {
        golfCourses.add(Golf(
            nombre: course["Nombre"],
            direccion: course["Dirección"],
            cp: course["C.P."],
            municipio: course["Municipio"],
            pedania: course["Pedanía"],
            telefono: course["Teléfono"],
            email: course["Email"],
            url: course["URL Real"],
            latitud: course["Latitud"],
            longitud: course["Longitud"],
            foto: course["Foto 1"]));
      } else if (course["Nombre"] == "Campo de Golf La serena") {
        golfCourses.add(Golf(
            nombre: course["Nombre"],
            direccion: course["Dirección"],
            cp: course["C.P."],
            municipio: course["Municipio"],
            pedania: course["Pedanía"],
            telefono: course["Teléfono"],
            email: "info@laserenagolf.es",
            url: course["URL Real"],
            latitud: course["Longitud"],
            longitud: course["Latitud"],
            foto: course["Foto 3"]));
      } else if (course["Nombre"] == "El Valle Golf") {
        golfCourses.add(Golf(
            nombre: course["Nombre"],
            direccion: course["Dirección"],
            cp: course["C.P."],
            municipio: course["Municipio"],
            pedania: course["Pedanía"],
            telefono: course["Teléfono"],
            email: course["Email"],
            url: course["URL Real"],
            latitud: "37.878648",
            longitud: "-1.082394",
            foto: course["Foto 1"]));
      } else if (course["Nombre"] == "Corvera Golf Club") {
        golfCourses.add(Golf(
            nombre: course["Nombre"],
            direccion: course["Dirección"],
            cp: "30153",
            municipio: course["Municipio"],
            pedania: course["Pedanía"],
            telefono: "868 462 008",
            email: course["Email"],
            url: course["URL Real"],
            latitud: "37.835474",
            longitud: "-1.164619",
            foto: course["Foto 1"]));
      } else if (course["Nombre"] == "Mosa Trajectum") {
        golfCourses.add(Golf(
            nombre: course["Nombre"],
            direccion: course["Dirección"],
            cp: course["C.P."],
            municipio: course["Municipio"],
            pedania: course["Pedanía"],
            telefono: "968 607 209",
            email: course["Email"],
            url: course["URL Real"],
            latitud: course["Latitud"],
            longitud: course["Longitud"],
            foto: course["Foto 1"]));
      } else if (course["Nombre"] == " Alhama Signature") {
        golfCourses.add(Golf(
            nombre: "Alhama Signature",
            direccion: course["Dirección"],
            cp: course["C.P."],
            municipio: course["Municipio"],
            pedania: "La Costera",
            telefono: course["Teléfono"],
            email: course["Email"],
            url: course["URL Real"],
            latitud: "37.744373",
            longitud: "-1.365422",
            foto: course["Foto 1"]));
      } else if (course["Nombre"] == " La Torre Golf") {
        golfCourses.add(Golf(
            nombre: "La Torre Golf",
            direccion: course["Dirección"],
            cp: course["C.P."],
            municipio: course["Municipio"],
            pedania: course["Pedanía"],
            telefono: course["Teléfono"],
            email: course["Email"],
            url: course["URL Real"],
            latitud: "37.88",
            longitud: "-1.086",
            foto: course["Foto 1"]));
      } else if (course["Nombre"] == "NEW SIERRA GOLF") {
        golfCourses.add(Golf(
            nombre: course["Nombre"],
            direccion: course["Dirección"],
            cp: "30592",
            municipio: course["Municipio"],
            pedania: course["Pedanía"],
            telefono: course["Teléfono"],
            email: course["Email"],
            url: course["URL Real"],
            latitud: "37.856517",
            longitud: "-0.982887",
            foto: course["Foto 1"]));
      } else if (course["Nombre"] == "La Peraleja") {
        golfCourses.add(Golf(
            nombre: course["Nombre"],
            direccion: course["Dirección"],
            cp: course["C.P."],
            municipio: course["Municipio"],
            pedania: "El Berro",
            telefono: course["Teléfono"],
            email: course["Email"],
            url: course["URL Real"],
            latitud: "37.882420",
            longitud: "-0.955929",
            foto: course["Foto 1"]));
      } else if (course["Nombre"] == "Golf Altorreal") {
        golfCourses.add(Golf(
            nombre: course["Nombre"],
            direccion: course["Dirección"],
            cp: course["C.P."],
            municipio: course["Municipio"],
            pedania: course["Pedanía"],
            telefono: course["Teléfono"],
            email: course["Email"],
            url: course["URL Real"],
            latitud: course["Longitud"],
            longitud: course["Latitud"],
            foto: course["Foto 1"]));
      } else if (course["Nombre"] == "Hacienda del Álamo") {
        golfCourses.add(Golf(
            nombre: course["Nombre"],
            direccion: course["Dirección"],
            cp: course["C.P."],
            municipio: course["Municipio"],
            pedania: course["Pedanía"],
            telefono: course["Teléfono"],
            email: course["Email"],
            url: course["URL Real"],
            latitud: "37.750380",
            longitud: "-1.195955",
            foto: course["Foto 1"]));
      } else if (course["Nombre"] == "Hacienda Riquelme Golf") {
        golfCourses.add(Golf(
            nombre: course["Nombre"],
            direccion: course["Dirección"],
            cp: course["C.P."],
            municipio: course["Municipio"],
            pedania: course["Pedanía"],
            telefono: course["Teléfono"],
            email: course["Email"],
            url: course["URL Real"],
            latitud: "37.898735",
            longitud: "-0.969717",
            foto: course["Foto 1"]));
      } else if (course["Nombre"] == "La Manga Club - Campo Norte") {
        golfCourses.add(Golf(
            nombre: course["Nombre"],
            direccion: course["Dirección"],
            cp: course["C.P."],
            municipio: course["Municipio"],
            pedania: course["Pedanía"],
            telefono: course["Teléfono"],
            email: course["Email"],
            url: course["URL Real"],
            latitud: "37.607294",
            longitud: "-0.803505",
            foto: course["Foto 1"]));
      } else if (course["Nombre"] == "La Manga Club - Campo Oeste") {
        golfCourses.add(Golf(
            nombre: course["Nombre"],
            direccion: course["Dirección"],
            cp: course["C.P."],
            municipio: course["Municipio"],
            pedania: course["Pedanía"],
            telefono: course["Teléfono"],
            email: course["Email"],
            url: course["URL Real"],
            latitud: "37.600763",
            longitud: "-0.815167",
            foto: course["Foto 1"]));
      } else if (course["Nombre"] == "La Manga Club - Campo Sur") {
        golfCourses.add(Golf(
            nombre: course["Nombre"],
            direccion: course["Dirección"],
            cp: course["C.P."],
            municipio: course["Municipio"],
            pedania: course["Pedanía"],
            telefono: course["Teléfono"],
            email: course["Email"],
            url: course["URL Real"],
            latitud: "37.607435",
            longitud: "-0.803729",
            foto: course["Foto 1"]));
      } else if (course["Nombre"] == "Lorca Golf Resort") {
        golfCourses.add(Golf(
            nombre: course["Nombre"],
            direccion: course["Dirección"],
            cp: course["C.P."],
            municipio: course["Municipio"],
            pedania: course["Pedanía"],
            telefono: course["Teléfono"],
            email: course["Email"],
            url: course["URL Real"],
            latitud: "37.552800",
            longitud: "-1.622204",
            foto: course["Foto 1"]));
      } else if (course["Nombre"] == "Mar Menor Golf") {
        golfCourses.add(Golf(
            nombre: course["Nombre"],
            direccion: course["Dirección"],
            cp: course["C.P."],
            municipio: course["Municipio"],
            pedania: course["Pedanía"],
            telefono: course["Teléfono"],
            email: course["Email"],
            url: course["URL Real"],
            latitud: "37.743980",
            longitud: "-0.914636",
            foto: course["Foto 1"]));
      } else if (course["Nombre"] == "Mosa Trajectum") {
        golfCourses.add(Golf(
            nombre: course["Nombre"],
            direccion: course["Dirección"],
            cp: course["C.P."],
            municipio: course["Municipio"],
            pedania: course["Pedanía"],
            telefono: course["Teléfono"],
            email: course["Email"],
            url: course["URL Real"],
            latitud: "37.876972",
            longitud: "-1.103850",
            foto: course["Foto 1"]));
      } else if (course["Nombre"] == "Pitch & Putt - Torre Pacheco") {
        golfCourses.add(Golf(
            nombre: course["Nombre"],
            direccion: course["Dirección"],
            cp: course["C.P."],
            municipio: course["Municipio"],
            pedania: course["Pedanía"],
            telefono: course["Teléfono"],
            email: course["Email"],
            url: course["URL Real"],
            latitud: "37.740418",
            longitud: "-0.960814",
            foto: course["Foto 1"]));
      } else if (course["Nombre"] == "Roda Golf ") {
        golfCourses.add(Golf(
            nombre: "Roda Golf",
            direccion: course["Dirección"],
            cp: course["C.P."],
            municipio: course["Municipio"],
            pedania: course["Pedanía"],
            telefono: course["Teléfono"],
            email: course["Email"],
            url: course["URL Real"],
            latitud: "37.768096",
            longitud: "-0.855457",
            foto: course["Foto 1"]));
      } else if (course["Nombre"] == "Saurines Golf") {
        golfCourses.add(Golf(
            nombre: course["Nombre"],
            direccion: course["Dirección"],
            cp: course["C.P."],
            municipio: course["Municipio"],
            pedania: course["Pedanía"],
            telefono: course["Teléfono"],
            email: course["Email"],
            url: course["URL Real"],
            latitud: "37.792304",
            longitud: "-0.974454",
            foto: course["Foto 1"]));
      }
    }
    return golfCourses;
  }
}
