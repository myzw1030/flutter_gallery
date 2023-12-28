import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class BottomAppBarDemo extends StatefulWidget {
  const BottomAppBarDemo({super.key});

  @override
  State<BottomAppBarDemo> createState() => _BottomAppBarDemoState();
}

class _BottomAppBarDemoState extends State<BottomAppBarDemo>
    with RestorationMixin {
  // フローティングアクションボタンの表示
  final RestorableBool _showFab = RestorableBool(true);
  // ノッチの表示
  final RestorableBool _showNotch = RestorableBool(true);
  // フローティングアクションボタンの位置
  final RestorableInt _currentFabLocation = RestorableInt(0);

  @override
  String get restorationId => 'bottom_app_bar_demo';

  @override
  void restoreState(RestorationBucket? oldBucket, bool initialRestore) {
    registerForRestoration(_showFab, 'show_fab');
    registerForRestoration(_showNotch, 'show_notch');
    registerForRestoration(_currentFabLocation, 'fab_location');
  }

  @override
  void dispose() {
    _showFab.dispose();
    _showNotch.dispose();
    _currentFabLocation.dispose();
    super.dispose();
  }

  static const List<FloatingActionButtonLocation> _fabLocations = [
    FloatingActionButtonLocation.endDocked,
    FloatingActionButtonLocation.centerDocked,
    FloatingActionButtonLocation.endFloat,
    FloatingActionButtonLocation.centerFloat,
  ];

  void _onShowNotchChanged(bool value) {
    setState(() {
      _showNotch.value = value;
    });
  }

  void _onShowFabChanged(bool value) {
    setState(() {
      _showFab.value = value;
    });
  }

  void _onFabLocationChanged(int? value) {
    setState(() {
      _currentFabLocation.value = value!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('ボトム アプリバー'),
      ),
      body: ListView(
        padding: const EdgeInsets.only(bottom: 88),
        children: [
          SwitchListTile(
            title: const Text('フローティング アクションボタン'),
            value: _showFab.value,
            onChanged: _onShowFabChanged,
          ),
          SwitchListTile(
            title: const Text('ノッチ'),
            value: _showNotch.value,
            onChanged: _onShowNotchChanged,
          ),
          const Padding(
            padding: EdgeInsets.all(16),
            child: Text('フォローティング アクションボタンの位置'),
          ),
          RadioListTile<int>(
            title: const Text('固定-端'),
            value: 0,
            groupValue: _currentFabLocation.value,
            onChanged: _onFabLocationChanged,
          ),
          RadioListTile<int>(
            title: const Text('固定-中央'),
            value: 1,
            groupValue: _currentFabLocation.value,
            onChanged: _onFabLocationChanged,
          ),
          RadioListTile<int>(
            title: const Text('フローティング-端'),
            value: 2,
            groupValue: _currentFabLocation.value,
            onChanged: _onFabLocationChanged,
          ),
          RadioListTile<int>(
            title: const Text('フローティング-中央'),
            value: 3,
            groupValue: _currentFabLocation.value,
            onChanged: _onFabLocationChanged,
          )
        ],
      ),
      floatingActionButton: _showFab.value
          ? Semantics(
              container: true,
              sortKey: const OrdinalSortKey(0),
              child: FloatingActionButton(
                onPressed: () {},
                child: const Icon(Icons.add),
              ),
            )
          : null,
      floatingActionButtonLocation: _fabLocations[_currentFabLocation.value],
      bottomNavigationBar: _DemoBottomAppBar(
        fabLocation: _fabLocations[_currentFabLocation.value],
        shape: _showNotch.value ? const CircularNotchedRectangle() : null,
      ),
    );
  }
}

class _DemoBottomAppBar extends StatelessWidget {
  const _DemoBottomAppBar({
    required this.fabLocation,
    this.shape,
  });

  final FloatingActionButtonLocation fabLocation;
  final NotchedShape? shape;

  static final centerLocations = <FloatingActionButtonLocation>[
    FloatingActionButtonLocation.centerDocked,
    FloatingActionButtonLocation.centerDocked,
  ];

  @override
  Widget build(BuildContext context) {
    return Semantics(
      sortKey: const OrdinalSortKey(1),
      container: true,
      label: 'ボトム アプリバー',
      child: BottomAppBar(
        color: Colors.blueGrey,
        shape: shape,
        child: IconTheme(
          data: IconThemeData(
            color: Theme.of(context).colorScheme.onPrimary,
          ),
          child: Row(
            children: [
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.menu),
              ),
              if (centerLocations.contains(fabLocation)) const Spacer(),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.search),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.favorite),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
