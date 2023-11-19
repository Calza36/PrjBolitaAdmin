import 'package:flutter/material.dart';

import '../../tools/app_config_size.dart';

class PlaneLoading extends StatefulWidget {
  const PlaneLoading(
      {super.key, required this.marginLeft, required this.marginRight});
  final double marginLeft;
  final double marginRight;
  @override
  State<PlaneLoading> createState() => _PlaneLoadingState();
}

class _PlaneLoadingState extends State<PlaneLoading> {
  @override
  Widget build(BuildContext context) {
    AppConfigSize().init(context);
    return Row(
      children: [
        const SizedBox(width: 5),
        SizedBox(
            height: 4,
            width: AppConfigSize.screenWidth -
                10 -
                widget.marginLeft -
                widget.marginRight,
            child: const LinearProgressIndicator())
      ],
    );
  }
}
