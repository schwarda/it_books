import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:http_bloc/widgets/animated_widget.dart';

import '../theme/app_colors.dart';

class Background extends StatefulWidget {
  Color? color = AppColors.primaryColor;
  Background({super.key, this.color});

  @override
  State<Background> createState() => _BackgroundState();
}

class _BackgroundState extends State<Background> with TickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 10),
    vsync: this,
  )..repeat();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Stack(children: [
        Positioned(
          top: 300,
          right: 30,
          child: Image.asset(
            'assets/img/lines.png',
            width: 100,
            height: 100,
            color: widget.color,
          ),
        ),
        Positioned(
            left: -50,
            top: -50,
            child: SpinningContainer(
              controller: _controller,
              child: Container(
                width: 200.0,
                height: 200.0,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(64),
                    color: widget.color),
              ),
            )),
        // Positioned(
        //     top: 0,
        //     child: Container(
        //         width: MediaQuery.of(context).size.width + 100,
        //         height: MediaQuery.of(context).padding.top,
        //         color: widget.color)),
        Positioned(
            right: 0,
            bottom: -50,
            child: SpinningContainer(
              controller: _controller,
              child: Container(
                width: 150.0,
                height: 150.0,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(64),
                    color: widget.color),
              ),
            )),
        Positioned.fill(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
            child: Container(
              color: Colors.white.withOpacity(0.1),
            ),
          ),
        ),
      ]),
    );
  }
}
