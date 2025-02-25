//lib/Learning_section/screens/compound_words_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning_spiders/Learning_section/blocs/learn_compound_word/learn_compound_word_bloc.dart';
import 'package:learning_spiders/Learning_section/blocs/learn_compound_word/learn_compound_word_event.dart';
import 'package:learning_spiders/Learning_section/blocs/learn_compound_word/learn_compound_word_state.dart';
import 'package:learning_spiders/core/config/app_constants.dart';
import 'package:learning_spiders/core/config/app_routes.dart';
import 'package:learning_spiders/core/widgets/shared/custom_app_bar.dart';
import 'package:learning_spiders/core/widgets/shared/custom_gradient.dart';
import 'package:learning_spiders/Learning_section/categories/compound_words/compound_word_card.dart';
import 'package:learning_spiders/main.dart';
import 'package:learning_spiders/core/widgets/shared/error_display.dart'; // Import

class CompoundWordsScreen extends StatelessWidget {
  static const routeName = AppRoutes.compoundWords;

  const CompoundWordsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<LearnCompoundWordBloc>(
      create: (context) =>
          getIt<LearnCompoundWordBloc>()..add(const LoadCompoundWords()),
      child: const CompoundWordsView(),
    );
  }
}

class CompoundWordsView extends StatelessWidget {
  const CompoundWordsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Compound Words'),
      body: CustomGradient(
        child: RefreshIndicator(
          onRefresh: () async {
            context
                .read<LearnCompoundWordBloc>()
                .add(const LoadCompoundWords());
          },
          child:
              BlocBuilder<LearnCompoundWordBloc, LearnCompoundWordState>(
            builder: (context, state) {
              if (state.isLoading) {
                return const Center(
                    child: CircularProgressIndicator(
                        color: AppConstants.primaryColor));
              }
              if (state.error != null) {
                return ErrorDisplay(
                    errorMessage: state.error!,
                    onRetry: () {
                      context
                          .read<LearnCompoundWordBloc>()
                          .add(const LoadCompoundWords());
                    });
              }
              return CustomScrollView(
                physics: const BouncingScrollPhysics(
                    parent: AlwaysScrollableScrollPhysics()),
                slivers: [
                  SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (context, index) => CompoundWordCard(
                          compoundWord: state.compoundWords[index]),
                      childCount: state.compoundWords.length,
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}