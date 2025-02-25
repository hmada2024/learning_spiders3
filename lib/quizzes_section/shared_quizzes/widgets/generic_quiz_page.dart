import 'package:flutter/material.dart';
import 'package:learning_spiders/core/widgets/shared/custom_gradient.dart';
import 'package:learning_spiders/core/widgets/shared/custom_app_bar.dart';

class GenericQuizPage extends StatelessWidget {
  final String title;
  final Widget? leading;
  final List<Widget> actions;
  final Widget content;
  final Widget? floatingActionButton; // Add floatingActionButton here

  const GenericQuizPage({
    super.key,
    required this.title,
    this.leading,
    this.actions = const [],
    required this.content,
    this.floatingActionButton, // Initialize floatingActionButton here
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const CustomGradient(
          child: SizedBox.expand(), // اجعل التدرج يغطي المساحة كاملة
        ),
        Scaffold(
          backgroundColor: Colors.transparent, // اجعل خلفية Scaffold شفافة
          appBar: CustomAppBar(
            title: title,
            leading: leading,
            actions: actions,
          ),
          floatingActionButton:
              floatingActionButton, // Add floatingActionButton to the Scaffold
          body: content,
        ),
      ],
    );
  }
}