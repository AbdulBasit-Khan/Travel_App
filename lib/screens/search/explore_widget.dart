import 'package:flutter/material.dart';
import 'package:travel_app_template/screens/search/ui_helper.dart';
import 'package:travel_app_template/utils/colors_const.dart';
import 'package:travel_app_template/utils/strings.dart';


class ExploreWidget extends StatelessWidget {
  final double currentSearchPercent;

  final double currentExplorePercent;

  final Function(bool) animateExplore;

  final Function(DragUpdateDetails) onVerticalDragUpdate;
  final Function() onPanDown;

  final bool isExploreOpen;

  const ExploreWidget(
      {Key? key,
      required this.currentSearchPercent,
      required this.currentExplorePercent,
      required this.animateExplore,
      required this.isExploreOpen,
      required this.onVerticalDragUpdate,
      required this.onPanDown})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        animateExplore(!isExploreOpen);
      },
      onVerticalDragUpdate: onVerticalDragUpdate,
      onVerticalDragEnd: (_) {
        _dispatchExploreOffset();
      },
      onPanDown: (_) => onPanDown(),
      child: Opacity(
        opacity: 1 - currentSearchPercent,
        child: Container(
          alignment: Alignment.bottomCenter,
          width: realW(159 + (standardWidth - 159) * currentExplorePercent),
          height: realH(122 + (766 - 122) * currentExplorePercent),
          decoration: BoxDecoration(
             color: ColorsConstants.amberColor,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(
                      realW( currentExplorePercent)),
                  topRight: Radius.circular(
                      realW( currentExplorePercent)))),
          child: Stack(
            children: [
              Positioned(
                  top: realH(65 + (-5 * currentExplorePercent)),
                  left: realW(49 + (91 - 49) * currentExplorePercent),
                  child: Text(
                    Strings.explore,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize:
                            realW(18 + (32 - 18) * currentExplorePercent)),
                  )),
              Positioned(
                  top: realH(20 + (60 - 20) * currentExplorePercent),
                  left: realW(63 + (44 - 63) * currentExplorePercent),
                  child: Icon(
                    Icons.location_on,
                    size: realW(34),
                    color: Colors.white,
                  )),
              Positioned(
                  top: realH(currentExplorePercent < 0.9
                      ? realH(-35)
                      : realH(-35 +
                          (6 + 35) * (currentExplorePercent - 0.9) * 8)),
                  left: realW(63 + (170 - 63) * currentExplorePercent),
                  child: GestureDetector(
                    onTap: () {
                      animateExplore(false);
                    },

                  )),
            ],
          ),
        ),
      ),
    );
  }

  /// dispatch Explore state
  ///
  /// handle it by [isExploreOpen] and [currentExplorePercent]
  void _dispatchExploreOffset() {
    if (!isExploreOpen) {
      if (currentExplorePercent < 0.3) {
        animateExplore(false);
      } else {
        animateExplore(true);
      }
    } else {
      if (currentExplorePercent > 0.6) {
        animateExplore(true);
      } else {
        animateExplore(false);
      }
    }
  }
}
