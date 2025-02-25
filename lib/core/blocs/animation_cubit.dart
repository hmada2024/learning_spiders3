//lib/core/blocs/animation_cubit.dart
/*import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class AnimationState {}

class AnimationInitial extends AnimationState {}

class AnimationReady extends AnimationState {
  final AnimationController controller;
  AnimationReady(this.controller);
}

class AnimationCubit extends Cubit<AnimationState> {
  final Duration duration;
  final double scaleDownTo;
  AnimationController? _controller;

  AnimationCubit({required this.duration, this.scaleDownTo = 0.95})
      : super(AnimationInitial());

  void init(TickerProvider vsync) {
    _controller = AnimationController(vsync: vsync, duration: duration);
    _controller!.addListener(() {
      if (!isClosed) {
        emit(AnimationReady(_controller!));
      }
    });

    emit(AnimationReady(_controller!));
  }

  Future<void> animate(BuildContext context) async {
    if (_controller == null || !context.mounted) return;
    await _controller!.forward(from: 0.0);
    await _controller!.reverse();
  }

  @override
  Future<void> close() {
    _controller?.dispose();
    return super.close();
  }
}*/