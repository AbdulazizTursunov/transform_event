

import 'package:url_launcher/url_launcher.dart';

enum Status {initial,loading,success,error}

 double height= 0;
 double width= 0;

Future<void> launchInBrowser(Uri url) async {
 if (!await launchUrl(
  url,
  mode: LaunchMode.externalApplication,
 )) {
  throw Exception('Could not launch $url');
 }
}
