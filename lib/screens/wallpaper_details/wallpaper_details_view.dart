import 'package:flutter/material.dart';
import 'package:wallpics/models/wallpapers.dart';
import 'package:wallpics/screens/view.dart';
import 'package:wallpics/screens/wallpaper_details/wallpaper_details_view_model.dart';
import 'package:wallpics/screens/wallpaper_details/widgets/wallpaper_details_body.dart';

class WallpaperDetailsView extends StatelessWidget {
  final Wallpaper wallpaper;

  const WallpaperDetailsView({super.key, required this.wallpaper});

  @override
  Widget build(BuildContext context) {
    return CustomView(
      builder: (context, customViewModel, _) {
        return WallpaperDetailsBody(
          wallpaperDetailsViewModel: customViewModel,
          wallpaper: wallpaper,
        );
      },
      customViewModel: WallpaperDetailsViewModel(),
    );
  }
}
