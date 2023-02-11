import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:digable_task/src/constants/constants.dart';

/// AppBarのインスタンス
class MyAppBar extends AppBar {
  final BuildContext context;
  final WidgetRef ref;
  /// アプリケーションの情報表示を行うボタン
  static _infoButton(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.info),
      onPressed: () async {
        final info = await PackageInfo.fromPlatform();
        if (context.mounted) {
          showLicensePage(
            context: context,
            applicationName: info.appName,
            applicationVersion: info.version,
            applicationIcon: Image.asset(Constants.appIconPath),
            applicationLegalese: Constants.disclaimer,
          );
        }
      },
    );
  }

  MyAppBar({super.key, required this.context, required this.ref}): super(
    title: const Text('Digable Task'),
    actions: [
      _infoButton(context),
    ],
  );
}
