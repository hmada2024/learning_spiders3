//lib/core/widgets/shared/bloc_provider_widget.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BlocProviderWidget<T extends Bloc<dynamic, dynamic>>
    extends StatefulWidget {
  final T bloc;
  final Widget child;

  const BlocProviderWidget({
    super.key,
    required this.bloc,
    required this.child,
  });

  @override
  BlocProviderWidgetState<T> createState() => BlocProviderWidgetState<T>();
}

class BlocProviderWidgetState<T extends Bloc<dynamic, dynamic>>
    extends State<BlocProviderWidget<T>> {
  @override
  void dispose() {
    widget.bloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<T>.value(
      value: widget.bloc,
      child: widget.child,
    );
  }
}
