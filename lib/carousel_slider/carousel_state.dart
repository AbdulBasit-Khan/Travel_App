import 'package:flutter/material.dart';

import 'carousel_options.dart';

class CarouselState {
  CarouselOptions options;
  PageController? pageController;
  int realPage = 10000;
  int initialPage = 0;
  int? itemCount;
  Function onResetTimer;
  Function onResumeTimer;

  Function(CarouselPageChangedReason) changeMode;

  CarouselState(
      this.options, this.onResetTimer, this.onResumeTimer, this.changeMode);
}
