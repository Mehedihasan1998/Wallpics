import 'package:url_launcher/url_launcher.dart';
import 'package:wallpics/screens/view_model.dart';

class WallpaperDetailsViewModel extends CustomViewModel {
  Future<void> openUrl(String uri) async {
    final Uri url = Uri.parse(uri);
    if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
      throw Exception('Could not launch $url');
    }
  }
}
