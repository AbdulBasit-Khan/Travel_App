import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

enum DotPosition {
  topLeft,
  topCenter,
  topRight,
  bottomLeft,
  bottomCenter,
  bottomRight
}

class Carousel extends StatefulWidget {
  final List ? images;
  final dynamic defaultImage;
  final Curve animationCurve;
  final Duration animationDuration;
  final double dotSize;
  final double dotIncreaseSize;
  final double dotSpacing;
  final Color dotColor;
  final Color? dotBgColor;
  final Color dotIncreasedColor;
  final bool showIndicator;
  final double indicatorBgPadding;
  final BoxFit boxFit;
  final bool borderRadius;
  final Radius? radius;
  final DotPosition dotPosition;
  final double dotHorizontalPadding;
  final double dotVerticalPadding;
  final double moveIndicatorFromBottom;
  final bool noRadiusForIndicator;
  final bool overlayShadow;
  final Color ?overlayShadowColors;
  final double overlayShadowSize;
  final bool autoplay;
  final Duration autoplayDuration;
  final void Function(int)? onImageTap;
  final void Function(int, int)? onImageChange;

  const Carousel({Key? key,
    this.images,
    this.animationCurve = Curves.ease,
    this.animationDuration = const Duration(milliseconds: 300),
    this.dotSize = 8.0,
    this.dotSpacing = 25.0,
    this.dotIncreaseSize = 2.0,
    this.dotColor = Colors.white,
    this.dotBgColor,
    this.dotIncreasedColor = Colors.white,
    this.showIndicator = true,
    this.indicatorBgPadding = 20.0,
    this.boxFit = BoxFit.cover,
    this.borderRadius = false,
    this.radius,
    this.dotPosition = DotPosition.bottomCenter,
    this.dotHorizontalPadding = 0.0,
    this.dotVerticalPadding = 0.0,
    this.moveIndicatorFromBottom = 0.0,
    this.noRadiusForIndicator = false,
    this.overlayShadow = false,
    this.overlayShadowColors,
    this.overlayShadowSize = 0.5,
    this.autoplay = true,
    this.autoplayDuration = const Duration(seconds: 3),
    this.onImageTap,
    this.onImageChange,
    this.defaultImage,
  }) : super(key: key);

  @override
  State createState() => CarouselState();
}

class CarouselState extends State<Carousel> {
  Timer ?timer;
  int _currentImageIndex = 0;
  final PageController _controller = PageController();

  @override
  void initState() {
    super.initState();

    if (widget.images != null && widget.images!.isNotEmpty) {
      if (widget.autoplay) {
        timer = Timer.periodic(widget.autoplayDuration, (_) {
          if (_controller.hasClients) {
            if (_controller.page!.round() == widget.images!.length - 1) {
              _controller.animateToPage(
                0,
                duration: widget.animationDuration,
                curve: widget.animationCurve,
              );
            } else {
              _controller.nextPage(
                  duration: widget.animationDuration,
                  curve: widget.animationCurve);
            }
          }
        });
      }
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    timer?.cancel();
    timer = null;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> listImages = (widget.images != null &&
        widget.images!.isNotEmpty)
        ? widget.images!.map<Widget>(
          (netImage) {
        if (netImage is ImageProvider) {
          return Container(
            decoration: BoxDecoration(
              borderRadius: widget.borderRadius
                  ? BorderRadius.all(widget.radius != null
                  ? widget.radius!
                  : const Radius.circular(8.0))
                  : null,
              image: DecorationImage(
                image: netImage,
                fit: widget.boxFit,
              ),
            ),
            child: widget.overlayShadow
                ? Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.center,
                  stops: [0.0, widget.overlayShadowSize],
                  colors: [
                    widget.overlayShadowColors != null
                        ? widget.overlayShadowColors!
                        .withOpacity(1.0)
                        : Colors.grey[800]!.withOpacity(1.0),
                    widget.overlayShadowColors != null
                        ? widget.overlayShadowColors!
                        .withOpacity(0.0)
                        : Colors.grey[800]!.withOpacity(0.0)
                  ],
                ),
              ),
            )
                : Container(),
          );
        } else if (netImage is FadeInImage) {
          return ClipRRect(
            borderRadius: widget.borderRadius
                ? BorderRadius.all(widget.radius != null
                ? widget.radius!
                : const Radius.circular(8.0))
                : null,
            child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.center,
                    stops: [0.0, widget.overlayShadowSize],
                    colors: [
                      widget.overlayShadowColors != null
                          ? widget.overlayShadowColors!.withOpacity(1.0)
                          : Colors.grey[800]!.withOpacity(1.0),
                      widget.overlayShadowColors != null
                          ? widget.overlayShadowColors!.withOpacity(0.0)
                          : Colors.grey[800]!.withOpacity(0.0)
                    ],
                  ),
                ),
                child: netImage),
          );
        } else {
          return netImage;
        }
      },
    ).toList()
        : [
      widget.defaultImage is ImageProvider
          ? Container(
        decoration: BoxDecoration(
          borderRadius: widget.borderRadius
              ? BorderRadius.all(widget.radius != null
              ? widget.radius!
              : const Radius.circular(8.0))
              : null,
          image: DecorationImage(
            //colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.2), BlendMode.dstATop),
            image: widget.defaultImage,
            fit: widget.boxFit,
          ),
        ),
        child: widget.overlayShadow
            ? Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.bottomCenter,
              end: Alignment.center,
              stops: [0.0, widget.overlayShadowSize],
              colors: [
                widget.overlayShadowColors != null
                    ? widget.overlayShadowColors!
                    .withOpacity(1.0)
                    : Colors.grey[800]!.withOpacity(1.0),
                widget.overlayShadowColors != null
                    ? widget.overlayShadowColors!
                    .withOpacity(0.0)
                    : Colors.grey[800]!.withOpacity(0.0)
              ],
            ),
          ),
        )
            : Container(),
      )
          : widget.defaultImage,
    ];

    final bottom = [
      DotPosition.bottomLeft,
      DotPosition.bottomCenter,
      DotPosition.bottomRight
    ].contains(widget.dotPosition)
        ? widget.dotVerticalPadding
        : null;
    final top = [
      DotPosition.topLeft,
      DotPosition.topCenter,
      DotPosition.topRight
    ].contains(widget.dotPosition)
        ? widget.dotVerticalPadding
        : null;
    double? left = [DotPosition.topLeft, DotPosition.bottomLeft]
        .contains(widget.dotPosition)
        ? widget.dotHorizontalPadding
        : null;
    double? right = [DotPosition.topRight, DotPosition.bottomRight]
        .contains(widget.dotPosition)
        ? widget.dotHorizontalPadding
        : null;

    if (left == null && right == null) {
      left = right = 0.0;
    }

    return Stack(
      children: <Widget>[
        Builder(
          builder: (_) {
            Widget pageView = PageView(
              physics: const AlwaysScrollableScrollPhysics(),
              controller: _controller,
              children: listImages,
              onPageChanged: (currentPage) {
                if (widget.onImageChange != null) {
                  widget.onImageChange!(_currentImageIndex, currentPage);
                }

                _currentImageIndex = currentPage;
              },
            );

            if (widget.onImageTap == null) {
              return pageView;
            }

            return GestureDetector(
              child: pageView,
              onTap: () => widget.onImageTap!(_currentImageIndex),
            );
          },
        ),
        widget.showIndicator
            ? Positioned(
          bottom: bottom,
          top: top,
          left: left,
          right: right,
          child: Container(
            decoration: BoxDecoration(
              color: widget.dotBgColor ?? Colors.grey[800]!.withOpacity(0.5),
              borderRadius: widget.borderRadius
                  ? (widget.noRadiusForIndicator
                  ? null
                  : BorderRadius.only(
                  bottomLeft: widget.radius!,
                  bottomRight: widget.radius != null
                      ? widget.radius!
                      : const Radius.circular(8.0)))
                  : null,
            ),
            padding: EdgeInsets.all(widget.indicatorBgPadding),
            child: Center(
               child: DotsIndicator(
                controller: _controller,
                itemCount: listImages.length,
                color: widget.dotColor,
                increasedColor: widget.dotIncreasedColor,
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
      {Key? key, this.controller,
        this.itemCount,
        this.onPageSelected,
        this.color,
        this.increasedColor,
        this.dotSize,
        this.dotIncreaseSize,
        this.dotSpacing})
      : super(key: key, listenable: controller!);
  final PageController ?controller;
  final int ?itemCount;
  final ValueChanged<int> ? onPageSelected;
  final Color ?color;
  final Color ?increasedColor;
  final double ?dotSize;
  final double ?dotIncreaseSize;
  final double ?dotSpacing;
  Widget _buildDot(int index) {
    double selectedNess = Curves.easeOut.transform(
      max(
        0.0,
        1.0 - ((controller!.page ?? controller!.initialPage) - index).abs(),
      ),
    );
    double zoom = 1.0 + (dotIncreaseSize! - 1.0) * selectedNess;
    final dotColor = zoom > 1.0 ? increasedColor : color;
    return SizedBox(
      width: dotSpacing,
      child: Center(
        child: Material(
          color: dotColor,
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