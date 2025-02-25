//lib/Learning_section/categories/adjectives/adjectives_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning_spiders/Learning_section/blocs/learn_adjective/learn_adjective_bloc.dart';
import 'package:learning_spiders/Learning_section/blocs/learn_adjective/learn_adjective_event.dart';
import 'package:learning_spiders/Learning_section/blocs/learn_adjective/learn_adjective_state.dart';
import 'package:learning_spiders/Learning_section/categories/adjectives/adjective_card.dart';
import 'package:learning_spiders/core/config/app_constants.dart';
import 'package:learning_spiders/core/config/app_routes.dart';
import 'package:learning_spiders/core/widgets/shared/custom_app_bar.dart';
import 'package:learning_spiders/core/widgets/shared/custom_gradient.dart';
import 'package:learning_spiders/core/widgets/shared/error_display.dart';
import 'package:learning_spiders/main.dart';

class AdjectivesScreen extends StatelessWidget {
  static const routeName = AppRoutes.adjectives;

  const AdjectivesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<LearnAdjectiveBloc>(
      create: (context) =>
          getIt<LearnAdjectiveBloc>()..add(LoadAllAdjectives()),
      child: const AdjectivesView(),
    );
  }
}

class AdjectivesView extends StatelessWidget {
  const AdjectivesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Adjectives'),
      body: CustomGradient(
        child: RefreshIndicator(
          onRefresh: () async =>
              context.read<LearnAdjectiveBloc>().add(LoadAllAdjectives()),
          child: BlocBuilder<LearnAdjectiveBloc, LearnAdjectiveState>(
            builder: (context, state) {
              if (state.isLoading) {
                return const Center(
                    child: CircularProgressIndicator(
                        color: AppConstants.primaryColor));
              }

              if (state.error != null) {
                return ErrorDisplay(
                  errorMessage: state.error!,
                  onRetry: () => context
                      .read<LearnAdjectiveBloc>()
                      .add(LoadAllAdjectives()),
                );
              }

              return CustomScrollView(
                physics: const BouncingScrollPhysics(
                  parent: AlwaysScrollableScrollPhysics(),
                ),
                slivers: [
                  SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (context, index) =>
                          AdjectiveCard(adjective: state.adjectives[index]),
                      childCount: state.adjectives.length,
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