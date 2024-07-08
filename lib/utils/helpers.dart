import 'package:device_info_plus/device_info_plus.dart';
import 'dart:io' show Platform;
import 'package:flutter/foundation.dart' show kIsWeb;

Future<String> getDeviceName() async {
  DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();

  try {
    if (kIsWeb) {
      WebBrowserInfo webBrowserInfo = await deviceInfo.webBrowserInfo;
      return webBrowserInfo.userAgent ?? 'Unknown Web Browser';
    } else if (Platform.isAndroid) {
      AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
      return androidInfo.model;
    } else if (Platform.isIOS) {
      IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
      return iosInfo.utsname.machine;
    } else {
      return 'Unknown Device';
    }
  } catch (e) {
    print('Error getting device name: $e');
    return 'Error: Unable to get device name';
  }
}
