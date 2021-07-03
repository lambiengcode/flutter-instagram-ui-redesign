library avatar_glow;

import 'dart:async';

import 'package:flutter/material.dart';

class AvatarGlow extends StatefulWidget {
  final Widget child;
  final double endRadius;
  final BoxShape shape;
  final Duration duration;
  final bool repeat;
  final bool animate;
  final Duration repeatPauseDuration;
  final Curve curve;
  final bool showTwoGlows;
  final Color glowColor;
  final Duration startDelay;

  const AvatarGlow({
    Key key,
    @required this.child,
    @required this.endRadius,
    this.shape = BoxShape.circle,
    this.duration = const Duration(milliseconds: 2000),
    this.repeat = true,
    this.animate = true,
    this.repeatPauseDuration = const Duration(milliseconds: 100),
    this.curve = Curves.fastOutSlowIn,
    this.showTwoGlows = true,
    this.glowColor = Colors.white,
    this.startDelay,
  }) : super(key: key);

  @override
  _AvatarGlowState createState() => _AvatarGlowState();
}

class _AvatarGlowState extends State<AvatarGlow>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  CurvedAnimation _curve;
  Animation<double> _smallDiscAnimation;
  Animation<double> _bigDiscAnimation;
  Animation<double> _alphaAnimation;

  void Function(
    AnimationStatus status,
    AnimationController controller,
    Duration repeatPauseDuration,
    bool mounted,
    bool repeat,
    bool animate,
  ) _statusListener = (
    _,
    controller,
    repeatDuration,
    mounted,
    repeat,
    animate,
  ) async {
    if (controller.status == AnimationStatus.completed) {
      await Future.delayed(repeatDuration);
      if (mounted && repeat && animate) {
        controller.reset();
        controller.forward();
      }
    }
  };

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      duration: widget.duration,
      vsync: this,
    );
    _curve = CurvedAnimation(
      parent: controller,
      curve: widget.curve,
    );
    _smallDiscAnimation = Tween(
      begin: (widget.endRadius * 2) / 6,
      end: (widget.endRadius * 2) * (3 / 4),
    ).animate(_curve);
    _bigDiscAnimation = Tween(
      begin: 0.0,
      end: (widget.endRadius * 3),
    ).animate(_curve);
    _alphaAnimation = Tween(
      begin: 0.30,
      end: 0.0,
    ).animate(controller);
    if (widget.animate) {
      _startAnimation();
    }
  }

  @override
  void didUpdateWidget(AvatarGlow oldWidget) {
    if (widget.animate != oldWidget.animate) {
      if (widget.animate) {
        _startAnimation();
      } else {
        _stopAnimation();
      }
    }
    super.didUpdateWidget(oldWidget);
  }

  void _startAnimation() async {
    controller.addStatusListener(
      (status) => _statusListener(
        status,
        controller,
        widget.repeatPauseDuration,
        mounted,
        widget.repeat,
        widget.animate,
      ),
    );
    if (widget.startDelay != null) {
      await Future.delayed(widget.startDelay);
    }
    if (mounted) {
      controller.reset();
      controller.forward();
    }
  }

  void _stopAnimation() async {
    controller.removeStatusListener(
      (status) => _statusListener(
        status,
        controller,
        widget.repeatPauseDuration,
        mounted,
        widget.repeat,
        widget.animate,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _alphaAnimation,
      child: widget.child,
      builder: (context, widgetChild) {
        final decoration = BoxDecoration(
          shape: widget.shape,
          // If the user picks a curve that goes below 0 or above 1
          // this opacity will have unexpected effects without clamping
          color: widget.glowColor.withOpacity(
            _alphaAnimation.value.clamp(
              0.0,
              1.0,
            ),
          ),
        );
        return Container(
          height: widget.endRadius * 2,
          width: widget.endRadius * 2,
          child: Stack(
            alignment: Alignment.center,
            children: <Widget>[
              AnimatedBuilder(
                animation: _bigDiscAnimation,
                builder: (context, widget) {
                  // If the user picks a curve that goes below 0,
                  // this will throw without clamping
                  final num size = _bigDiscAnimation.value.clamp(
                    0.0,
                    double.infinity,
                  );
                  return Container(
                    height: size as double,
                    width: size as double,
                    decoration: decoration,
                  );
                },
              ),
              widget.showTwoGlows
                  ? AnimatedBuilder(
                      animation: _smallDiscAnimation,
                      builder: (context, widget) {
                        final num size = _smallDiscAnimation.value.clamp(
                          0.0,
                          double.infinity,
                        );

                        return Container(
                          height: size as double,
                          width: size as double,
                          decoration: decoration,
                        );
                      },
                    )
                  : const SizedBox(height: 0.0, width: 0.0),
              widgetChild,
            ],
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    _stopAnimation();
    controller.dispose();
    super.dispose();
  }
}
