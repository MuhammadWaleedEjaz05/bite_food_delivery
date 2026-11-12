import 'dart:io';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'widget_test.dart' as home;

void main() {
  for (final dashboard in [false, true]) {
    for (final brightness in Brightness.values) {
      testWidgets(
        'capture ${brightness.name} ${dashboard ? 'dashboard' : 'Home'} preview',
        (tester) async {
          final loader = FontLoader('Sen')
            ..addFont(rootBundle.load('assets/fonts/Sen.ttf'));
          await loader.load();
          final icons = FontLoader('MaterialIcons')
            ..addFont(rootBundle.load('fonts/MaterialIcons-Regular.otf'));
          await icons.load();
          await home.pumpHome(
            tester,
            brightness: brightness,
            height: 812,
            dashboard: dashboard,
          );
          final boundary = tester.renderObject<RenderRepaintBoundary>(
            find.byType(RepaintBoundary).first,
          );
          await tester.runAsync(() async {
            final image = await boundary.toImage(pixelRatio: 2);
            final bytes = await image.toByteData(
              format: ui.ImageByteFormat.png,
            );
            final file = File(
              'docs/previews/${dashboard ? 'dashboard' : 'home'}-${brightness.name}.png',
            );
            file.parent.createSync(recursive: true);
            file.writeAsBytesSync(bytes!.buffer.asUint8List());
            image.dispose();
          });
          expect(tester.takeException(), isNull);
        },
      );
    }
  }
}
