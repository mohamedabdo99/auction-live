import 'package:flutter/foundation.dart';
import 'package:landing_page/lib.dart';
import '../../main.dart';

class LauncherHelper {
  static Future<void> launchWhatsApp(String phone) async {
    debugPrint(phone);
    var whatsappUrl = Uri.parse("whatsapp://send?phone=$phone");
    await canLaunchUrl(whatsappUrl)
        ? launchUrl(whatsappUrl)
        : debugPrint("لا يوجد واتساب على هذا الرقم / No WhatsApp on this number");
  }

  static Future<void> launchCall(String phone) async {
    var call = Uri.parse("tel://$phone");
    await canLaunchUrl(call) ? launchUrl(call) : debugPrint("رقم خطأ");
  }

  static Future<void> launchPdf(String string) async {
    var url = Uri.parse(string);
    await canLaunchUrl(url)
        ? launchUrl(url, mode: LaunchMode.externalNonBrowserApplication)
        : debugPrint("رقم خطأ");
  }

  static Future<void> launchGoogleMap({
    required String lat,
    required String long,
  }) async {
    // String appleUrl =
    //     'https://maps.apple.com/?saddr=&daddr=$lat,$long&directionsmode=driving';
    // // String googleUrl =
    // //     'https://www.google.com/maps/search/?api=1&query=$lat,$long';

    String url = 'https://www.google.com/maps/search/?api=1&query=$lat,$long';
    if (!await launch(url)) throw 'Could not launch $url';
  }

  static Future<void> launchUrlString(String urlString) async {
    var url = Uri.parse(urlString);
    await canLaunchUrl(url)
        ? launchUrl(url, mode: LaunchMode.externalApplication)
        : debugPrint("رقم خطأ");
  }
}
