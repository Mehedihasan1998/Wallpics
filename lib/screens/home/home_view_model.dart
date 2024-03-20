import 'package:wallpics/dependencies/dependencies.dart';
import 'package:wallpics/models/wallpapers.dart';
import 'package:wallpics/screens/view_model.dart';
import 'package:wallpics/services/home_services/home_services.dart';

class HomeViewModel extends CustomViewModel {
  HomeServices get hServices => dependencies();

  List<Wallpaper> wallpapers = [];

  getWallpaperList(String category) async {
    var result = await hServices.getWallpaperData(category);
    print(result);
    wallpapers = result.map((e) => Wallpaper.fromJson(e)).cast<Wallpaper>().toList();
    return wallpapers;
  }
}
