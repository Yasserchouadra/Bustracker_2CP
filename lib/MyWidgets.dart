import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'dart:ui' show ImageFilter;
import 'package:projet_2cp_g5/main.dart';

/// This is the MyDialog class that i created to show a custom dialog, it is inspired from the CuppertinoDialog
class MyDialog extends StatelessWidget {
  /// Creates an iOS-style dialog.
  const MyDialog({
    Key key,
    this.child,
  }) : super(key: key);

  /// The widget below this widget in the tree.
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: MediaQuery.of(context).size.width - 32,
        child: MyPopupSurface(
          child: child,
        ),
      ),
    );
  }
}

class MyPopupSurface extends StatelessWidget {
  /// Creates an iOS-style rounded rectangle popup surface.
  const MyPopupSurface({
    Key key,
    this.isSurfacePainted = true,
    this.child,
  }) : super(key: key);

  /// Whether or not to paint a translucent white on top of this surface's
  /// blurred background. [isSurfacePainted] should be true for a typical popup
  /// that contains content without any dividers. A popup that requires dividers
  /// should set [isSurfacePainted] to false and then paint its own surface area.
  ///
  /// Some popups, like iOS's volume control popup, choose to render a blurred
  /// area without any white paint covering it. To achieve this effect,
  /// [isSurfacePainted] should be set to false.
  final bool isSurfacePainted;

  /// The widget below this widget in the tree.
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(25),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 40, sigmaY: 20),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            backgroundBlendMode: BlendMode.overlay,
          ),
          child: Container(
            color: isSurfacePainted ? Colors.white : null,
            child: child,
          ),
        ),
      ),
    );
  }
}

///

class MySlides extends StatelessWidget {
  final String _message, _animation;

  const MySlides(this._message, this._animation);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: <Widget>[
        Container(
          child: Stack(
            children: <Widget>[
              Container(height: 250,child: FlareActor("assets/animations/Projet2cp_tutoDialog_1.flr",animation: "idle",)),
              Container(
                height: 250,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Color(0x00FFFFFF),
                          Color(0x00FFFFFF),
                          Color(0x00FFFFFF),
                          Color(0x00FFFFFF),
                          Colors.white,
                        ])),
              ),
            ],
          ),
        ),
        SizedBox(height: 16),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 48),
          child: Text(
            this._message,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.body1
          ),
        ),
      ],
    );
  }
}