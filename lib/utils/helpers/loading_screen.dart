import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:muna_notes_app/const/text_style.dart';
import 'package:muna_notes_app/utils/helpers/loading_screen_controller.dart';

class LoadingScreen {
  LoadingScreen._sharedInstance();
  static final LoadingScreen _shared = LoadingScreen._sharedInstance();
  factory LoadingScreen() => _shared;

  LoadingScreenController? controller;

  LoadingScreenController showOverlay(
      {required BuildContext context, required String text}) {
    final textstream = StreamController<String>();
    textstream.add(text);

    final state = Overlay.of(context);
    final renderBox = context.findRenderObject() as RenderBox;
    final size = renderBox.size;

    final overlay = OverlayEntry(builder: (context) {
      return Material(
        color: Colors.black.withAlpha(150),
        child: Center(
          child: Container(
            constraints: BoxConstraints(
              maxHeight: size.height * 0.8,
              maxWidth: size.width * 0.8,
              minWidth: size.width * 0.5,
              minHeight: size.height * 0.2,
            ),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(10.r)),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 10.h,
                ),
                const CircularProgressIndicator(
                  color: Colors.black,
                ),
                SizedBox(
                  height: 10.h,
                ),
                StreamBuilder(
                  stream: textstream.stream,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return Text(
                        snapshot.data.toString(),
                        textAlign: TextAlign.center,
                        style: AppTextstyle.nunitolightblack,
                      );
                    } else {
                      return Text(
                        'Please Wait',
                        style: AppTextstyle.nunitolightblack,
                      );
                    }
                  },
                )
              ],
            ),
          ),
        ),
      );
    });
    state.insert(overlay);

    return LoadingScreenController(close: () {
      textstream.close();
      overlay.remove();
      return true;
    }, update: (text) {
      textstream.add(text);
      return true;
    });
  }

  void show({
    required BuildContext context,
    required String text,
  }) {
    if (controller?.update(text) ?? false) {
      return;
    } else {
      controller = showOverlay(context: context, text: text);
    }
  }

  void hide() {
    controller?.close();
    controller = null;
  }
}
