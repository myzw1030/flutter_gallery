import 'package:flutter/material.dart';

enum BannerDemoAction {
  reset,
  showMultipleActions,
  showLeading,
}

class BannerDemo extends StatefulWidget {
  const BannerDemo({super.key});

  @override
  State<BannerDemo> createState() => _BannerDemoState();
}

// RestorationMixinを使用して、アプリが再起動されたときに以前の状態を復元する
class _BannerDemoState extends State<BannerDemo> with RestorationMixin {
  static const _itemCount = 20;

  @override
  String get restorationId => 'banner_demo';

  @override
  // ウィジェットの状態が復元される際に呼び出される(アプリが再起動されたときや、バックグラウンドから復帰したときなどに発生)
  void restoreState(RestorationBucket? oldBucket, bool initialRestore) {
    registerForRestoration(_displayBanner, 'display_banner');
    registerForRestoration(_showMultipleActions, 'show_multiple_actions');
    registerForRestoration(_showLeading, 'show_leading');
  }

  // バナーの表示/非表示の状態
  final RestorableBool _displayBanner = RestorableBool(true);
  // バナーに複数のアクションボタンを表示するかどうかの状態
  final RestorableBool _showMultipleActions = RestorableBool(true);
  // バナーに先頭のアイコンを表示するかどうかの状態
  final RestorableBool _showLeading = RestorableBool(true);

  @override
  void dispose() {
    _displayBanner.dispose();
    _showMultipleActions.dispose();
    _showLeading.dispose();
    super.dispose();
  }

  // BannerDemoAction型の値に基づいて、適切な状態更新を行う
  void handleDemoAction(BannerDemoAction action) {
    setState(() {
      switch (action) {
        case BannerDemoAction.reset:
          _displayBanner.value = true;
          _showMultipleActions.value = true;
          _showLeading.value = true;
          break;
        case BannerDemoAction.showMultipleActions:
          _showMultipleActions.value = !_showMultipleActions.value;
          break;
        case BannerDemoAction.showLeading:
          _showLeading.value = !_showLeading.value;
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final banner = MaterialBanner(
      content: const Text('お使いの他のデバイスでパスワードが更新されました。もう一度ログインしてください。'),
      leading: _showLeading.value
          ? CircleAvatar(
              backgroundColor: colorScheme.primary,
              child: Icon(
                Icons.access_alarm,
                color: colorScheme.onPrimary,
              ),
            )
          : null,
      actions: [
        TextButton(
          onPressed: () {
            setState(() {
              _displayBanner.value = false;
            });
          },
          child: const Text('ログイン'),
        ),
        if (_showMultipleActions.value)
          TextButton(
            onPressed: () {
              setState(() {
                _displayBanner.value = false;
              });
            },
            child: const Text('閉じる'),
          ),
      ],
      backgroundColor: colorScheme.background,
    );

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('バナー'),
        actions: [
          PopupMenuButton<BannerDemoAction>(
            onSelected: handleDemoAction,
            itemBuilder: (context) => <PopupMenuEntry<BannerDemoAction>>[
              const PopupMenuItem(
                value: BannerDemoAction.reset,
                child: Text('バナーをリセット'),
              ),
              const PopupMenuDivider(),
              CheckedPopupMenuItem<BannerDemoAction>(
                value: BannerDemoAction.showMultipleActions,
                checked: _showMultipleActions.value,
                child: const Text('複数のアクション'),
              ),
              CheckedPopupMenuItem<BannerDemoAction>(
                value: BannerDemoAction.showLeading,
                checked: _showLeading.value,
                child: const Text('先頭のアイコン'),
              )
            ],
          ),
        ],
      ),
      body: ListView.builder(
        restorationId: 'banner_demo_list_view',
        itemCount: _displayBanner.value ? _itemCount + 1 : _itemCount,
        itemBuilder: (context, index) {
          if (index == 0 && _displayBanner.value) {
            return banner;
          }
          return ListTile(
            title: Text('項目${_displayBanner.value ? index : index + 1}'),
          );
        },
      ),
    );
  }
}
