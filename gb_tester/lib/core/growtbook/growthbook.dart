import 'package:flutter/foundation.dart';
import 'package:growthbook_sdk_flutter/growthbook_sdk_flutter.dart';
import 'dart:math';

class GRowthbook {
  GRowthbook._();

  static final Map<String, dynamic> _usrAttr = {
    'name': 'josepth',
    'is_employee': false,
    'id': Random().nextInt(1000000).toString()
  };

  static Future<GrowthBookSDK> init() async {
    return await GBSDKBuilderApp(
      hostURL: 'http://localhost:3100/',
      apiKey: "sdk-o48a7AnfC1kpUNf",

      // attributes: _usrAttr,
      growthBookTrackingCallBack: (GBExperiment exp, GBExperimentResult rst) {},
      gbFeatures: {
        'some-mobcreated-feature': GBFeature(defaultValue: true),
      },
    ).initialize();
  }
}
