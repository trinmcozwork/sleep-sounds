// ignore_for_file: file_names

import 'dart:io';

dynamic checkPlatform(androidView, iosView) {
  if (Platform.isAndroid) {
    return androidView;
  } else if (Platform.isIOS) {
    return iosView;
  }
}
