import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../lexicon/lexicon.dart';
import '../theme/color_outlet.dart';
import '../theme/font_family_outlet.dart';
import '../theme/size_outlet.dart';

alertDialogPattern({
  required BuildContext context,
  required String title,
  String? content = '',
  Text? contentCustom,
  bool? exitMode = false,
  bool confirmMode = false,
  ValueNotifier<bool>? isConfirmed,
  Function()? onConfirm,
  Function()? onOK,
  bool? markdownMode = false,
  String confirmText = 'Confirmar',
}) {
  return showGeneralDialog(
    context: context,
    pageBuilder: (context, animation, secondaryAnimation) {
      // animação de entrada
      const begin = Offset(0.0, 1.0);
      const end = Offset.zero;
      const curve = Curves.ease;
      final tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
      return SlideTransition(
        position: animation.drive(tween),
        child: SafeArea(
          child: AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(SizeOutlet.borderRadius),
            ),
            title: Text(
              title,
              style: const TextStyle(
                fontSize: 18,
                fontFamily: FontFamilyOutlet.fontMedium,
              ),
            ),
            content: FittedBox(
              fit: !markdownMode! ? BoxFit.scaleDown : BoxFit.contain,
              alignment: Alignment.centerLeft,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Visibility(
                    visible: !markdownMode,
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width * 0.68,
                      child: contentCustom ??
                          Text(
                            content!,
                            style: const TextStyle(
                              fontFamily: FontFamilyOutlet.fontRegular,
                            ),
                          ),
                    ),
                  ),
                  Visibility(
                    visible: markdownMode,
                    child: SizedBox(
                        width: MediaQuery.of(context).size.width * 0.8,
                        height: MediaQuery.of(context).size.height * 0.7,
                        child: Markdown(
                          padding: const EdgeInsets.all(0),
                          physics: const BouncingScrollPhysics(),
                          softLineBreak: true,
                          data: content!,
                          styleSheet: MarkdownStyleSheet(
                            p: const TextStyle(
                              fontFamily: FontFamilyOutlet.fontRegular,
                              fontSize: 17,
                            ),
                            h2: const TextStyle(
                              fontFamily: FontFamilyOutlet.fontMedium,
                              fontSize: 24,
                            ),
                          ),
                        )),
                  ),
                ],
              ),
            ),
            actions: [
              Visibility(
                visible: !confirmMode,
                child: TextButton(
                  onPressed: () {
                    Modular.to.pop(context);
                  },
                  child: const Text(
                    Lexicon.cancel,
                    style: TextStyle(
                      color: ColorOutlet.colorPrimary,
                      fontFamily: FontFamilyOutlet.fontMedium,
                    ),
                  ),
                ),
              ),
              Visibility(
                visible: !confirmMode,
                child: TextButton(
                  onPressed: () async {
                    exitMode! ? SystemNavigator.pop() : null;
                    isConfirmed != null ? isConfirmed.value = true : null;
                    onConfirm?.call();
                  },
                  child: Text(
                    confirmText,
                    style: const TextStyle(
                      color: ColorOutlet.colorPrimary,
                      fontFamily: FontFamilyOutlet.fontMedium,
                    ),
                  ),
                ),
              ),
              Visibility(
                visible: confirmMode,
                child: TextButton(
                  onPressed: () async {
                    exitMode! ? SystemNavigator.pop() : null;
                    Modular.to.pop(context);
                    onOK?.call();
                  },
                  child: Text(
                    confirmText,
                    style: const TextStyle(
                      color: ColorOutlet.colorPrimary,
                      fontFamily: FontFamilyOutlet.fontMedium,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}
