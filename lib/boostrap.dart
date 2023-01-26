import 'dart:async';

import 'package:flutter/material.dart';

void bootstrap({required FutureOr<Widget> Function() builder}) async {
  runApp(await builder.call());
}
