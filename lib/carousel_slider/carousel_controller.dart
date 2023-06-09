import 'dart:async';

import 'package:flutter/material.dart';

import 'package:travel_app_template/utils/common_functions.dart';

import 'carousel_options.dart';
import 'carousel_state.dart';

abstract class CarouselController {
  bool get ready;

  Future<void> get onReady;

  Future<void> nextPage({Duration? duration, Curve? curve});

  Future<void> previousPage({Duration? duration, Curve? curve});

  void jumpToPage(int page);

  Future<void> animateToPage(int page, {Duration? duration, Curve? curve});

  void startAutoPlay();

  void stopAutoPlay();

  factory CarouselController() => CarouselControllerImpl();
}

class CarouselControllerImpl implements CarouselController {
  final Completer<void> _readyCompleter = Completer<void>();

  CarouselState? _state;

  set state(CarouselState? state) {
    _state = state;
    if (!_readyCompleter.isCompleted) {
      _readyCompleter.complete();
    }
  }

  void _setModeController() =>
      _state!.changeMode(CarouselPageChangedReason.controller);

  @override
  bool get ready => _state != null;

  @override
  Future<void> get onReady => _readyCompleter.future;
  @override
  Future<void> nextPage(
      {Duration? duration = const Duration(milliseconds: 300),
      Curve? curve = Curves.linear}) async {
    final bool isNeedResetTimer = _state!.options.pauseAutoPlayOnManualNavigate;
    if (isNeedResetTimer) {
      _state!.onResetTimer();
    }
    _setModeController();
    await _state!.pageController!.nextPage(duration: duration!, curve: curve!);
    if (isNeedResetTimer) {
      _state!.onResumeTimer();
    }
  }


  @override
  Future<void> previousPage(
      {Duration? duration = const Duration(milliseconds: 300),
      Curve? curve = Curves.linear}) async {
    final bool isNeedResetTimer = _state!.options.pauseAutoPlayOnManualNavigate;
    if (isNeedResetTimer) {
      _state!.onResetTimer();
    }
    _setModeController();
    await _state!.pageController!
        .previousPage(duration: duration!, curve: curve!);
    if (isNeedResetTimer) {
      _state!.onResumeTimer();
    }
  }


  @override
  void jumpToPage(int page) {
    final index = CommonFunctions.getRealIndex(
        _state!.pageController!.page!.toInt(),
        _state!.realPage - _state!.initialPage,
        _state!.itemCount);

    _setModeController();
    final int pageToJump = _state!.pageController!.page!.toInt() + page - index;
    return _state!.pageController!.jumpToPage(pageToJump);
  }


  @override
  Future<void> animateToPage(int page,
      {Duration? duration = const Duration(milliseconds: 300),
      Curve? curve = Curves.linear}) async {
    final bool isNeedResetTimer = _state!.options.pauseAutoPlayOnManualNavigate;
    if (isNeedResetTimer) {
      _state!.onResetTimer();
    }
    final index = CommonFunctions.getRealIndex(
        _state!.pageController!.page!.toInt(),
        _state!.realPage - _state!.initialPage,
        _state!.itemCount);
    _setModeController();
    await _state!.pageController!.animateToPage(
        _state!.pageController!.page!.toInt() + page - index,
        duration: duration!,
        curve: curve!);
    if (isNeedResetTimer) {
      _state!.onResumeTimer();
    }
  }


  @override
  void startAutoPlay() {
    _state!.onResumeTimer();
  }


  @override
  void stopAutoPlay() {
    _state!.onResetTimer();
  }
}
