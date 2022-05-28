/// A placeholder class that represents an entity or model.
class Golf {
  // Variables necesarias para el modelo de Golf
  String nombre;
  String direccion;
  String cp;
  String municipio;
  String pedania;
  String telefono;
  String email;
  String url;
  String latitud;
  String longitud;
  String foto;

  // Se crea el constructor del modelo Golf estebleciendo como requeridas las variables antes mencionadas
  Golf(
      {required this.nombre,
      required this.direccion,
      required this.cp,
      required this.municipio,
      required this.pedania,
      required this.telefono,
      required this.email,
      required this.url,
      required this.latitud,
      required this.longitud,
      required this.foto});
}
