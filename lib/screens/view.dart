//----------------------------
// Default view is with ChangeNotifierProvider
// Don't change this file
//----------------------------

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wallpics/screens/view_model.dart';

class CustomView extends StatelessWidget {
  final Widget Function(
    BuildContext context,
    CustomViewModel viewModel,
    Widget? child,
  ) _builder;
  final CustomViewModel _customViewModel;

  const CustomView({
    super.key,
    required builder,
    required customViewModel,
  })  : _builder = builder,
        _customViewModel = customViewModel;

  Widget _baseBuilder(
      BuildContext context, CustomViewModel customViewModel, Widget? child) {
    if (_customViewModel.busy) {
      return const Scaffold(
        body: const Center(
          child: CircularProgressIndicator(),
        ),
      );
    }
    return _builder(context, customViewModel, child);
  }

  @override
  Widget build(BuildContext context) => ChangeNotifierProvider.value(
        value: _customViewModel,
        child: Consumer<CustomViewModel>(builder: _baseBuilder),
      );
}
