import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

import 'main.dart';

class FullScreenWidget extends StatefulWidget {
  const FullScreenWidget({Key key}) : super(key: key);

  @override
  State<FullScreenWidget> createState() => FullScreenWidgetState();
}

class FullScreenWidgetState extends State<FullScreenWidget> {
  final controlsHideTime = const Duration(milliseconds: 300);
  final controlBarHeight = 48.0;
  final iconsColor = Colors.white;
  final fullscreenDisableIcon = Icons.fullscreen_exit_outlined;
  final liveTextColor = Colors.red;

  bool _hideStuff = true;
  Timer _hideTimer;

  Widget _buildPtzBar(BuildContext context) {
    print("Hide $_hideStuff");
    return AnimatedOpacity(
      opacity: _hideStuff ? 0.0 : 1.0,
      duration: controlsHideTime,
      child: Container(
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
                      _buildButtonSSW(context),
                      _buildButtonSud(context),
                      _buildButtonSSE(context),
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
        ? Expanded(
            child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
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
            const SizedBox(width: 20),
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
          ]))
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
        ? Expanded(
            child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
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
          ]))
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

  void _onExpandCollapse(BuildContext context) {
    print("_onExpandCollapse $_hideStuff");
    setState(() {
      _hideStuff = true;
    });
    Navigator.pop(context);
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
              fullscreenDisableIcon,
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

  void cancelAndRestartTimer() {
    print("cancelAndRestartTimer $_hideStuff");
    _hideTimer?.cancel();
    _startHideTimer();

    setState(() {
      _hideStuff = false;
    });
  }

  void _startHideTimer() {
    print("_startHideTimer $_hideStuff");
    _hideTimer = Timer(const Duration(seconds: 3), () {
      if (mounted) {
        setState(() {
          _hideStuff = true;
        });
      }
      print("Timer endded");
    });
  }

  Widget build(BuildContext context) {
    final _width = MediaQuery.of(context).size.width;
    final _height = MediaQuery.of(context).size.height;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        alignment: Alignment.center,
        color: Colors.black,
        child: Stack(
          children: <Widget>[
            Positioned(
                top: 0,
                left: 0,
                child: SizedBox(
                    width: _width,
                    height: _height,
                    child: Image.asset(
                      'assets/image.jpg',
                      fit: BoxFit.fill,
                    ))),
            Positioned(
              top: 0,
              left: 0,
              child: SizedBox(
                width: _width,
                height: _height,
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
      ),
    );
  }
}
