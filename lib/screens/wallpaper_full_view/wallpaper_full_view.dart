import 'package:flutter/material.dart';
import 'package:wallpics/models/wallpapers.dart';

class WallpaperFullView extends StatelessWidget {
  final Wallpaper wallpaper;

  const WallpaperFullView({super.key, required this.wallpaper});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
            ),
          ),
          title: Text("Wallpics"),
          backgroundColor: theme.colorScheme.background,
          centerTitle: true,
        ),
        body: Center(
          child: Image.network(wallpaper.src!.large2x!),
        ),
      ),
    );
  }
}
