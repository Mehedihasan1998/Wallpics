import 'package:wallpics/dependencies/dependencies.dart';
import 'package:wallpics/models/wallpapers.dart';
import 'package:wallpics/services/home_services/home_services.dart';
import 'package:wallpics/services/rest_services.dart';

class HomeServicesRest implements HomeServices{
  RestService get rest => dependencies();

  @override
  getWallpaperData(String category) async{

    final Map<String, dynamic> map = await rest.get("search?query=$category&per_page=20");
    print(map['photos'].toString());
    return map['photos'];
  }

}