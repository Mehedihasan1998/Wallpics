import 'package:flutter/material.dart';
import 'package:wallpics/screens/home/home_view_model.dart';
import 'package:wallpics/screens/home/widgets/wallpaper_grid_view.dart';

class HomeBody extends StatelessWidget {
  final HomeViewModel homeViewModel;
  const HomeBody({super.key, required this.homeViewModel});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return DefaultTabController(
      length: 6,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Wallpics"),
          centerTitle: true,
          backgroundColor: theme.colorScheme.background,
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(kToolbarHeight),
            child: Container(
              margin: const EdgeInsets.only(left: 20),
              child: TabBar(
                indicatorWeight: 0,
                isScrollable: true,
                labelStyle: const TextStyle(
                    fontWeight: FontWeight.bold
                ),
                labelColor: theme.colorScheme.background,
                unselectedLabelColor: Colors.white,
                dividerColor: theme.colorScheme.background,
                unselectedLabelStyle: const TextStyle(
                    fontWeight: FontWeight.bold
                ),
                indicator: BoxDecoration(
                    color: theme.colorScheme.primary,
                    borderRadius: BorderRadius.all(Radius.circular(100))
                ),
                indicatorSize: TabBarIndicatorSize.tab,
                physics: const BouncingScrollPhysics(),
                tabs: categories,
              ),
            ),
          ),
        ),
        body: TabBarView(
          children: categories.map((tab) => WallpaperGridView(tab: tab, homeViewModel: homeViewModel,)).toList(),
        ),
      ),
    );
  }

  final List<Tab> categories = const [
    Tab(text: "DISCOVER",),
    Tab(text: "NATURE",),
    Tab(text: "ANIME",),
    Tab(text: "ART",),
    Tab(text: "CITY",),
    Tab(text: "ABSTRACT",),
  ];


}
