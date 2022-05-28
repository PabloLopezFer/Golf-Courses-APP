import 'package:filter_list/filter_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application/src/controller/selected_list_controller.dart';
import 'package:flutter_application/src/service/golf_service.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get/get.dart';

import '../model/golf.dart';
import 'golf_item_details_view.dart';

/// Displays a list of SampleItems.
class GolfCoursesListView extends StatefulWidget {
  // Constructor
  const GolfCoursesListView({
    Key? key,
  }) : super(key: key);

  // Se llamará al State (Necesario, pues se está usando StatefulWidget)
  @override
  State<GolfCoursesListView> createState() => _GolfCoursesState();

  // Lugar donde se desplegará
  static const routeName = '/';
}

class _GolfCoursesState extends State<GolfCoursesListView> {
  // Lista de golf
  List<Golf> listGolf = [];

  // Lista dinámica donde se recibirán los campos de golf
  List<dynamic> dynamicList = [];

  // Variable que se usará para buscar
  String search = "";

  // Lista con los filtros preestablecidos
  List<String> defaultList = [
    "Alhama de Murcia",
    "Torre Pacheco",
    "Los Alcázares",
    "Murcia",
    "Molina de Segura",
    "Fuente Álamo",
    "La Manga",
    "Cartagena",
    "Lorca",
    "San Javier"
  ];

  // Lista con el controlador para manejar la lista de filtros
  var controller = Get.put(SelectedListController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Barra de tareas donde se podrá cambiar a modo oscuro
      appBar: AppBar(
          title: Text(AppLocalizations.of(context)!.appTitle),
          backgroundColor: const Color.fromARGB(255, 115, 243, 132)),
      body: Column(
        children: [
          Row(
            // Establecer buscador para los campos de golf
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.zero,
                child: TextField(
                    decoration: InputDecoration(
                      hintText: AppLocalizations.of(context)!.textField,
                    ),
                    onChanged: (value) {
                      search = value;
                      filter(value);
                    }),
              ),
            ],
          ),
          // Se mostrará una lista con los campos de golf
          Expanded(child: showList()),
          // Botón en el que se pondrá el botón para acceder a los filtros
          FloatingActionButton(
              child: const Icon(Icons.add),
              onPressed: () => openFilterDialog(context))
        ],
      ),
    );
  }

  // Método para recorrer la lista desde el service y poder mostrarla
  showList() {
    return StreamBuilder(
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return FutureBuilder(
            future: golfCoursesDynamicList(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                  shrinkWrap: true,
                  restorationId: 'golfCoursesListView',
                  itemCount: listGolf.length,
                  itemBuilder: (BuildContext context, int i) {
                    final golfCourse = listGolf[i];
                    return ListTile(
                        leading: ConstrainedBox(
                            constraints: const BoxConstraints(
                              minWidth: 100,
                              minHeight: 500,
                              maxWidth: 200,
                              maxHeight: 600,
                            ),
                            child: Image.network(
                              golfCourse.foto,
                              width: 100,
                            )),
                        title: Text(golfCourse.nombre),
                        subtitle: Text(golfCourse.telefono),
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => GolfCourseItemDetailsView(
                                  golfCourse: golfCourse)));
                        });
                  },
                );
              } else {
                return Text(snapshot.error.toString());
              }
            });
      },
    );
  }

  // Método del Init
  @override
  void initState() {
    super.initState();
    listGolf.addAll(GolfService.golfList);
  }

  // Método para cargar los campos de golf
  Future<List<Golf>> golfCoursesDynamicList() async {
    dynamicList = await GolfService.getGolfCourses();
    return GolfService.getGolfCourses();
  }

  // Método para filtrar en la búsqueda
  void filter(String temp) {
    List<Golf> list1 = [];
    List<Golf> list2 = [];

    list1.addAll(GolfService.golfList);

    if (temp.isNotEmpty) {
      for (var golfCourse in list1) {
        if (golfCourse.nombre.contains(temp) ||
            golfCourse.direccion.contains(temp) ||
            golfCourse.municipio.contains(temp)) {
          list2.add(golfCourse);
        }
      }
      setState(() {
        listGolf.clear();
        listGolf.addAll(list2);
      });
    } else {
      setState(() {
        listGolf.clear();
        listGolf.addAll(list1);
      });
    }
  }

  // Método para abrir el diálogo del filtro
  void openFilterDialog(context) async {
    await FilterListDialog.display<String>(context,
        listData: defaultList,
        selectedListData: controller.getSelectedList(),
        headlineText: AppLocalizations.of(context)!.filtroMunicipio,
        choiceChipLabel: (item) => item,
        validateSelectedItem: (list, val) => list!.contains(val),
        onItemSearch: (list, text) {
          return list.toLowerCase().contains(text.toLowerCase());
        },
        onApplyButtonClick: (button) {
          setState(() {
            controller.setSelectedList(button!);
          });
          listGolf.clear();
          for (var golfCourse in GolfService.golfList) {
            for (var selectedList in controller.getSelectedList()) {
              if ((golfCourse.municipio == selectedList)) {
                listGolf.add(golfCourse);
              }
            }
          }
        });
  }
}
