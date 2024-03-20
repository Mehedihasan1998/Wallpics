import 'package:flutter/material.dart';
import 'package:wallpics/screens/home/home_view_model.dart';
import 'package:wallpics/screens/home/widgets/home_body.dart';
import 'package:wallpics/screens/view.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomView(
        builder: (context, customViewModel, _) {
          return HomeBody(homeViewModel: HomeViewModel(),);
        },
        customViewModel: HomeViewModel());
  }
}
