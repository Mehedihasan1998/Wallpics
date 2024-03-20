import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:wallpics/models/wallpapers.dart';
import 'package:wallpics/screens/home/home_view_model.dart';
import 'package:wallpics/screens/wallpaper_details/wallpaper_details_view.dart';

class WallpaperGridView extends StatefulWidget {
  final Tab tab;
  final HomeViewModel homeViewModel;

  const WallpaperGridView(
      {super.key, required this.tab, required this.homeViewModel});

  @override
  State<WallpaperGridView> createState() => _WallpaperGridViewState();
}

class _WallpaperGridViewState extends State<WallpaperGridView> {
  List<Wallpaper> wallpapers = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    widget.homeViewModel
        .getWallpaperList(widget.tab.text!.toLowerCase())
        .then((val) {
      setState(() {
        wallpapers = val;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return wallpapers.isEmpty
        ? Center(
            child: CircularProgressIndicator(),
          )
        : Container(
            margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            child: MasonryGridView.count(
              crossAxisCount: 2,
              itemCount: wallpapers.length,
              mainAxisSpacing: 15,
              crossAxisSpacing: 15,
              itemBuilder: (context, index) {
                Wallpaper item = wallpapers[index];
                return InkWell(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) =>
                            WallpaperDetailsView(wallpaper: item)));
                  },
                  child: Container(
                    height: (index % 3 + 2) * 100,
                    decoration: BoxDecoration(
                      color: Color(
                        int.parse(
                          item.avgColor!.replaceAll("#", "0xff"),
                        ),
                      ),
                      borderRadius: const BorderRadius.all(Radius.circular(30)),
                    ),
                    child: ClipRRect(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(30)),
                        child: Hero(
                          tag: "${item.id}",
                          child: Image.network(
                            item.src!.portrait!,
                            fit: BoxFit.fill,
                          ),
                        )),
                  ),
                );
              },
            ),
          );
  }
}
