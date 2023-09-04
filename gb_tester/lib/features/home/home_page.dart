import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:gb_tester/core/growtbook/growthbook.dart';
import 'package:growthbook_sdk_flutter/growthbook_sdk_flutter.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('GB TEster')),
      body: FutureBuilder<GrowthBookSDK>(
        future: GRowthbook.init(),
        builder: (context, AsyncSnapshot<GrowthBookSDK> snapshot) {
          if (snapshot.hasData) {
            // print(snapshot.data?.features);

            final _usrAttr = {
              'id': Random().nextInt(1000000).toString(),
              'name': 'josepth_999',
              'is_employee': false,
            };

            var inlineExp = GBExperiment();
            inlineExp.key = "my-experiment";
            inlineExp.variations = ["control", "variation"];

            snapshot.data!.setAttributes(_usrAttr);
            snapshot.data!.refresh();

            final variation = snapshot.data?.feature('gbdemo-checkout-layout');

            print(variation?.value);

            return Column(
              children: [
                Text('Single'),
                // Text(snapshot.data.),
              ],
            );
          }

          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
