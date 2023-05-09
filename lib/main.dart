import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_fullscreen/full_screen.dart';

bool isPtz = true;
bool isNvs = true;
bool isFullScreen = false;
double speed = 0.5;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final controlsHideTime = const Duration(milliseconds: 300);
  final controlBarHeight = 48.0;
  final iconsColor = Colors.white;
  final fullscreenEnableIcon = Icons.fullscreen_outlined;
  final fullscreenDisableIcon = Icons.fullscreen_exit_outlined;
  final liveTextColor = Colors.red;
  final List<DeviceOrientation> deviceOrientationsAfterFullScreen =
      DeviceOrientation.values;
  final List<SystemUiOverlay> systemOverlaysAfterFullScreen =
      SystemUiOverlay.values;

  bool _hideStuff = true;
  Timer _hideTimer;

  @override
  void dispose() {
    _hideTimer?.cancel();
    super.dispose();
  }

  Widget _buildPtzBar(BuildContext context) {
    print("Hide $_hideStuff");
    return AnimatedOpacity(
      opacity: _hideStuff ? 0.0 : 1.0,
      duration: controlsHideTime,
      child: SizedBox(
          //color: Colors.pink,
          width: double.infinity,
          height: double.infinity,
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildButtonNW(context),
                      const SizedBox(width: 40),
                      _buildButtonNord(context),
                      isNvs
                          ? const SizedBox(width: 40)
                          : _buildButtonNNE(context),
                      _buildButtonNE(context)
                    ]),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildButtonWest(context),
                      _buildExpandButton(context),
                      _buildButtonEst(context)
                    ]),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildButtonSW(context),
                      isNvs
                          ? const SizedBox(width: 40)
                          : _buildButtonSSW(context),
                      _buildButtonSud(context),
                      isNvs
                          ? const SizedBox(width: 40)
                          : _buildButtonSSE(context),
                      _buildButtonSE(context)
                    ]),
              ])),
    );
  }

  Widget _buildButtonNW(BuildContext context) {
    return MyMaterialClickableButton(
      onTap: () => {},
      child: AnimatedOpacity(
        opacity: _hideStuff ? 0.0 : 1.0,
        duration: controlsHideTime,
        child: Container(
          height: controlBarHeight,
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Center(
            child: Transform.rotate(
                angle: 30 * pi / 180,
                child: Icon(
                  Icons.keyboard_arrow_left,
                  color: iconsColor,
                )),
          ),
        ),
      ),
    );
  }

  Widget _buildButtonNord(BuildContext context) {
    return MyMaterialClickableButton(
      onTap: () => {},
      child: AnimatedOpacity(
        opacity: _hideStuff ? 0.0 : 1.0,
        duration: controlsHideTime,
        child: Container(
          height: controlBarHeight,
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Center(
            child: Icon(
              Icons.keyboard_arrow_up,
              color: iconsColor,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildButtonNNE(BuildContext context) {
    return MyMaterialClickableButton(
      onTap: () => {},
      child: AnimatedOpacity(
        opacity: _hideStuff ? 0.0 : 1.0,
        duration: controlsHideTime,
        child: Container(
          height: controlBarHeight,
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Center(
            child: Icon(
              Icons.settings,
              color: iconsColor,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildButtonNE(BuildContext context) {
    return MyMaterialClickableButton(
      onTap: () => {},
      child: AnimatedOpacity(
        opacity: _hideStuff ? 0.0 : 1.0,
        duration: controlsHideTime,
        child: Container(
          height: controlBarHeight,
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Center(
              child: Transform.rotate(
            angle: 30 * pi / 180,
            child: Icon(
              Icons.keyboard_arrow_up,
              color: iconsColor,
            ),
          )),
        ),
      ),
    );
  }

  Widget _buildButtonEst(BuildContext context) {
    return MyMaterialClickableButton(
      onTap: () => {},
      child: AnimatedOpacity(
        opacity: _hideStuff ? 0.0 : 1.0,
        duration: controlsHideTime,
        child: Container(
          height: controlBarHeight,
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Center(
            child: Icon(
              Icons.keyboard_arrow_right,
              color: iconsColor,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildButtonWest(BuildContext context) {
    return MyMaterialClickableButton(
      onTap: () => {},
      child: AnimatedOpacity(
        opacity: _hideStuff ? 0.0 : 1.0,
        duration: controlsHideTime,
        child: Container(
          height: controlBarHeight,
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Center(
            child: Icon(
              Icons.keyboard_arrow_left,
              color: iconsColor,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildButtonSud(BuildContext context) {
    return MyMaterialClickableButton(
      onTap: () => {},
      child: AnimatedOpacity(
        opacity: _hideStuff ? 0.0 : 1.0,
        duration: controlsHideTime,
        child: Container(
          height: controlBarHeight,
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Center(
            child: Icon(
              Icons.keyboard_arrow_down,
              color: iconsColor,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildButtonSSW(BuildContext context) {
    return isNvs && isFullScreen
        ? Row(children: [
      MyMaterialClickableButton(
        onTap: () => {},
        child: AnimatedOpacity(
          opacity: _hideStuff ? 0.0 : 1.0,
          duration: controlsHideTime,
          child: Container(
            height: controlBarHeight,
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Center(
              child: Icon(
                Icons.add,
                color: iconsColor,
              ),
            ),
          ),
        ),
      ),
      const SizedBox(width: 40),
      MyMaterialClickableButton(
        onTap: () => {},
        child: AnimatedOpacity(
          opacity: _hideStuff ? 0.0 : 1.0,
          duration: controlsHideTime,
          child: Container(
            height: controlBarHeight,
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Center(
              child: Icon(
                Icons.remove,
                color: iconsColor,
              ),
            ),
          ),
        ),
      ),
    ])
        : MyMaterialClickableButton(
      onTap: () => {},
      child: AnimatedOpacity(
        opacity: _hideStuff ? 0.0 : 1.0,
        duration: controlsHideTime,
        child: Container(
          height: controlBarHeight,
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Center(
            child: Icon(
              Icons.star,
              color: iconsColor,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildButtonSW(BuildContext context) {
    return MyMaterialClickableButton(
      onTap: () => {},
      child: AnimatedOpacity(
        opacity: _hideStuff ? 0.0 : 1.0,
        duration: controlsHideTime,
        child: Container(
          height: controlBarHeight,
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Center(
            child: Transform.rotate(
              angle: 30 * pi / 180,
              child: Icon(
                Icons.keyboard_arrow_down,
                color: iconsColor,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildButtonSSE(BuildContext context) {
    return isNvs && isFullScreen
        ? Row(children: [
      Slider(
        value: speed.clamp(.1, 1.0).toDouble(),
        min: .1,
        max: 1.0,
        divisions: 9,
        onChanged: (value) {
          speed = value;
          setState(() {});
        },
      ),
      Text("X ${speed.toStringAsFixed(1)}",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15.0))
    ])
        : MyMaterialClickableButton(
      onTap: () => {},
      child: AnimatedOpacity(
        opacity: _hideStuff ? 0.0 : 1.0,
        duration: controlsHideTime,
        child: Container(
          height: controlBarHeight,
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Center(
            child: Icon(
              Icons.save,
              color: iconsColor,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildButtonSE(BuildContext context) {
    return MyMaterialClickableButton(
      onTap: () => {},
      child: AnimatedOpacity(
        opacity: _hideStuff ? 0.0 : 1.0,
        duration: controlsHideTime,
        child: Container(
          height: controlBarHeight,
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Center(
            child: Transform.rotate(
              angle: 30 * pi / 180,
              child: Icon(
                Icons.keyboard_arrow_right,
                color: iconsColor,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildBottomBar(BuildContext context) {
    print("Hide $_hideStuff");
    return AnimatedOpacity(
      opacity: _hideStuff ? 0.0 : 1.0,
      duration: controlsHideTime,
      child: Container(
        height: controlBarHeight,
        color: Colors.black87,
        child: Row(
          children: [_buildLiveWidget(), _buildExpandButton(context)],
        ),
      ),
    );
  }

  Widget _buildLiveWidget() {
    return Expanded(
        child: Container(
      margin: const EdgeInsets.symmetric(horizontal: 4),
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Text(
        'LIVE',
        style: TextStyle(color: liveTextColor, fontWeight: FontWeight.bold),
      ),
    ));
  }

  Widget _buildExpandButton(BuildContext context) {
    return MyMaterialClickableWidget(
      onTap: () => _onExpandCollapse(context),
      child: AnimatedOpacity(
        opacity: _hideStuff ? 0.0 : 1.0,
        duration: controlsHideTime,
        child: Container(
          height: controlBarHeight,
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: Center(
            child: Icon(
              isFullScreen ? fullscreenDisableIcon : fullscreenEnableIcon,
              color: iconsColor,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHitArea() {
    // if (!_betterPlayerController!.controlsEnabled) {
    //   return const SizedBox();
    // }
    return Container(
      child: Center(
        child: AnimatedOpacity(
          opacity: _hideStuff ? 0.0 : 1.0,
          duration: controlsHideTime,
          child: _buildPtzBar(context),
        ),
      ),
    );
  }

  void _startHideTimer() {
    print("_startHideTimer $_hideStuff");
    _hideTimer = Timer(const Duration(seconds: 3), () {
      setState(() {
        _hideStuff = true;
      });
      print("Timer endded");
    });
  }

  void cancelAndRestartTimer() {
    print("cancelAndRestartTimer $_hideStuff");
    _hideTimer?.cancel();
    _startHideTimer();

    setState(() {
      _hideStuff = false;
    });
  }

  void _onExpandCollapse(BuildContext context) {
    print("_onExpandCollapse $_hideStuff");
    setState(() {
      _hideStuff = true;
    });
    toggleFullScreen(context);
  }

  void toggleFullScreen(BuildContext context) {
    isFullScreen = !isFullScreen;
    _pushFullScreenWidget(context);
  }

  Future<dynamic> _pushFullScreenWidget(BuildContext context) async {
    final TransitionRoute<void> route = PageRouteBuilder<void>(
      settings: const RouteSettings(),
      pageBuilder: _fullScreenRoutePageBuilder,
    );

    await SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);

    const aspectRatio = 1.0;
    List<DeviceOrientation> deviceOrientations;
    if (aspectRatio < 1.0) {
      deviceOrientations = [
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown
      ];
    } else {
      deviceOrientations = [
        DeviceOrientation.landscapeLeft,
        DeviceOrientation.landscapeRight
      ];
    }
    await SystemChrome.setPreferredOrientations(deviceOrientations);

    //Wakelock.enable();

    await Navigator.of(context, rootNavigator: true).push(route);
    // await Navigator.push(
    //     context,
    //     MaterialPageRoute(
    //         builder: (context) => FullScreenWidget()));

    isFullScreen = false;
    //widget.controller.exitFullScreen();

    // The wakelock plugins checks whether it needs to perform an action internally,
    // so we do not need to check Wakelock.isEnabled.
    //Wakelock.disable();

    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: systemOverlaysAfterFullScreen);
    SystemChrome.setPreferredOrientations(deviceOrientationsAfterFullScreen);
  }

  Widget _fullScreenRoutePageBuilder(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondAnimation,
  ) {
    return AnimatedBuilder(
        animation: animation,
        builder: (BuildContext context, Widget child) {
          return FullScreenWidget();
        });
  }

  @override
  Widget build(BuildContext context) {
    final bool isLandscape =
        MediaQuery.of(context).size.width > MediaQuery.of(context).size.height;
    final _width = MediaQuery.of(context).size.width;
    final _height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Stack(
        children: <Widget>[
          Positioned(
              top: 0,
              left: 0,
              child: SizedBox(
                  width: _width,
                  height: _height / 3,
                  child: Image.asset(
                    'assets/image.jpg',
                    fit: BoxFit.fill,
                  ))),
          Positioned(
            top: 0,
            left: 0,
            child: SizedBox(
              width: _width,
              height: _height / 3,
              child: GestureDetector(
                onTap: () {
                  _hideStuff
                      ? cancelAndRestartTimer()
                      : setState(() {
                          _hideStuff = true;
                        });
                },
                child: AbsorbPointer(
                  absorbing: _hideStuff,
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      _buildHitArea(),
                      Positioned(
                          bottom: 0,
                          left: 0,
                          right: 0,
                          child:
                              isPtz ? Container() : _buildBottomBar(context)),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class MyMaterialClickableWidget extends StatelessWidget {
  final Widget child;
  final void Function() onTap;

  const MyMaterialClickableWidget({
    Key key,
    this.onTap,
    this.child,
  })  : assert(onTap != null),
        assert(child != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(60),
      ),
      clipBehavior: Clip.hardEdge,
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        child: child,
      ),
    );
  }
}

class MyMaterialClickableButton extends StatelessWidget {
  final Widget child;
  final void Function() onTap;

  const MyMaterialClickableButton({
    Key key,
    this.onTap,
    this.child,
  })  : assert(onTap != null),
        assert(child != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(60),
      ),
      clipBehavior: Clip.hardEdge,
      color: Colors.black38,
      child: InkWell(
        onTap: onTap,
        child: child,
      ),
    );
  }
}
