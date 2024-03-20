import 'package:get_it/get_it.dart';
import 'package:wallpics/services/home_services/home_services.dart';
import 'package:wallpics/services/home_services/home_services_rest.dart';
import 'package:wallpics/services/rest_services.dart';

GetIt dependencies = GetIt.instance;

void init() {
  dependencies.registerLazySingleton<RestService>(
    () => const RestService(
        baseUrl: "https://api.pexels.com/v1",
        key: "Ad2567YgsTLGHbsxuvih2cGaRkPOy0gmhRuaDU3Q6aps6uze0g6AFDXE"),
  );
  dependencies.registerLazySingleton<HomeServices>(
    () => HomeServicesRest(),
  );
}
