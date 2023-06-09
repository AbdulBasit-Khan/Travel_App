import 'dart:math';
import 'package:flutter/material.dart';
import 'dart:async';

class WidgetCarousel extends StatefulWidget {
  final List? pages;
  final Curve animationCurve;
  final Duration animationDuration;
  final double dotSize;
  final double dotIncreaseSize;
  final double dotSpacing;
  final Color dotColor;
  final Color? dotBgColor;
  final bool showIndicator;
  final double indicatorBgPadding;
  final BoxFit boxFit;
  final bool borderRadius;
  final Radius? radius;
  final double moveIndicatorFromBottom;
  final bool noRadiusForIndicator;
  final bool overlayShadow;
  final Color? overlayShadowColors;
  final double overlayShadowSize;
  final bool autoplay;
  final Duration autoplayDuration;

  const WidgetCarousel(
      {Key? key,
      this.pages,
      this.animationCurve = Curves.ease,
      this.animationDuration = const Duration(milliseconds: 300),
      this.dotSize = 8.0,
      this.dotSpacing = 25.0,
      this.dotIncreaseSize = 2.0,
      this.dotColor = Colors.white,
      this.dotBgColor,
      this.showIndicator = true,
      this.indicatorBgPadding = 20.0,
      this.boxFit = BoxFit.cover,
      this.borderRadius = false,
      this.radius,
      this.moveIndicatorFromBottom = 0.0,
      this.noRadiusForIndicator = false,
      this.overlayShadow = false,
      this.overlayShadowColors,
      this.overlayShadowSize = 0.5,
      this.autoplay = true,
      this.autoplayDuration = const Duration(seconds: 3)})
      : assert(pages != null),
        super(key: key);

  @override
  State createState() => WidgetCarouselState();
}

class WidgetCarouselState extends State<WidgetCarousel> {
  final _controller = PageController();

  @override
  void initState() {
    super.initState();
    if (widget.autoplay) {
      Timer.periodic(widget.autoplayDuration, (_) {
        if (_controller.page == widget.pages!.length - 1) {
          _controller.animateToPage(
            0,
            duration: widget.animationDuration,
            curve: widget.animationCurve,
          );
        } else {
          _controller.nextPage(
              duration: widget.animationDuration, curve: widget.animationCurve);
        }
      });
    }
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> listPages = widget.pages!
        .map((widget) => Container(
              child: widget,
            ))
        .toList();

    return Stack(
      children: <Widget>[
        PageView(
          physics: const AlwaysScrollableScrollPhysics(),
          controller: _controller,
          children: listPages,
        ),
        widget.showIndicator
            ? Positioned(
                bottom: widget.moveIndicatorFromBottom,
                left: 0.0,
                right: 0.0,
                child: Container(
                  decoration: BoxDecoration(
                    color:
                        widget.dotBgColor ?? Colors.grey[800]!.withOpacity(0.5),
                    borderRadius: widget.borderRadius
                        ? (widget.noRadiusForIndicator
                            ? null
                            : BorderRadius.only(
                                bottomLeft: widget.radius != null
                                    ? widget.radius!
                                    : const Radius.circular(8.0),
                                bottomRight: widget.radius != null
                                    ? widget.radius!
                                    : const Radius.circular(8.0)))
                        : null,
                  ),
                  padding: EdgeInsets.all(widget.indicatorBgPadding),
                  child: Center(
                    child: DotsIndicator(
                      controller: _controller,
                      itemCount: listPages.length,
                      color: widget.dotColor,
                      dotSize: widget.dotSize,
                      dotSpacing: widget.dotSpacing,
                      dotIncreaseSize: widget.dotIncreaseSize,
                      onPageSelected: (int page) {
                        _controller.animateToPage(
                          page,
                          duration: widget.animationDuration,
                          curve: widget.animationCurve,
                        );
                      },
                    ),
                  ),
                ),
              )
            : Container(),
      ],
    );
  }
}

class DotsIndicator extends AnimatedWidget {
  DotsIndicator(
      {Key? key,
      this.controller,
      this.itemCount,
      this.onPageSelected,
      this.color,
      this.dotSize,
      this.dotIncreaseSize,
      this.dotSpacing})
      : super(key: key, listenable: controller!);

  final PageController? controller;

  final int? itemCount;

  final ValueChanged<int>? onPageSelected;

  final Color? color;

  final double? dotSize;

  final double? dotIncreaseSize;

  final double? dotSpacing;

  Widget _buildDot(int index) {
    double selectedNess = Curves.easeOut.transform(
      max(
        0.0,
        1.0 - ((controller!.page ?? controller!.initialPage) - index).abs(),
      ),
    );
    double zoom = 1.0 + (dotIncreaseSize! - 1.0) * selectedNess;
    return SizedBox(
      width: dotSpacing,
      child: Center(
        child: Material(
          color: color,
          type: MaterialType.circle,
          child: SizedBox(
            width: dotSize! * zoom,
            height: dotSize! * zoom,
            child: InkWell(
              onTap: () => onPageSelected!(index),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List<Widget>.generate(itemCount!, _buildDot),
    );
  }
}
