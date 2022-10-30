

import 'package:beauty_center/constants.dart';
import 'package:beauty_center/view/widgets/app_bar.dart';
import 'package:beauty_center/view/widgets/horizontal_progress.dart';
import 'package:beauty_center/view/widgets/vertical_progress.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../provider/center_registration_provider.dart';

class CenterInfo extends ConsumerWidget {
  const CenterInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final controller = ref.watch(registerFuture);
    double height = MediaQuery.of(context).size.height<600?800:MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Column(
        children: [
          MyAppBar(title: 'Salon Information',),
         HorizontalProgress(),
          SizedBox(height: 20,),
          VerticalProgress(height: height,progressHeight: height/2),

        ],
      ),
    );
  }
}
