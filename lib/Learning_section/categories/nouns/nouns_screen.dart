//lib/Learning_section/categories/nouns/nouns_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning_spiders/Learning_section/blocs/learn_noun/learn_noun_bloc.dart';
import 'package:learning_spiders/Learning_section/blocs/learn_noun/learn_noun_events.dart';
import 'package:learning_spiders/Learning_section/blocs/learn_noun/learn_noun_state.dart';
import 'package:learning_spiders/core/config/app_routes.dart';
import 'package:learning_spiders/core/config/database_constants.dart';
import 'package:learning_spiders/core/widgets/shared/custom_app_bar.dart';
import 'package:learning_spiders/core/widgets/shared/custom_gradient.dart';
import 'package:learning_spiders/core/widgets/text/string_formatter.dart';
import 'package:learning_spiders/main.dart';
import 'package:learning_spiders/core/data/repositories/noun_repository.dart';
import 'package:learning_spiders/core/widgets/shared/category_filter.dart';
import 'package:learning_spiders/core/widgets/shared/category_title.dart';
import 'package:learning_spiders/Learning_section/categories/nouns/noun_content.dart';

class NounsScreen extends StatelessWidget {
  static const routeName = AppRoutes.nouns;

  const NounsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<String>>(
      future: getIt<NounRepository>().getAllCategories(),
      builder: (context, snapshot) {
        if (snapshot.connectionState != ConnectionState.done) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }
        if (snapshot.hasError) {
          return Scaffold(
            body: Center(
                child: Text("Error loading categories: ${snapshot.error}")),
          );
        }

        return BlocProvider<LearnNounBloc>(
          create: (context) => getIt<LearnNounBloc>()
            ..add(const LoadNouns(category: Constants.categoryBird)),
          child: const _NounsPageView(),
        );
      },
    );
  }
}

class _NounsPageView extends StatelessWidget {
  const _NounsPageView();

  String _getTitle(String category) {
    return category == 'all'
        ? 'All Categories'
        : StringFormatter.formatFieldName(category);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Nouns',
        actions: [
          _buildCategoryFilter(context),
        ],
      ),
      body: CustomGradient(
        child: RefreshIndicator(
          onRefresh: () async {
            final selected =
                context.read<LearnNounBloc>().state.selectedCategory;
            context.read<LearnNounBloc>().add(LoadNouns(category: selected));
          },
          child: Column(
            children: [
              BlocBuilder<LearnNounBloc, LearnNounState>(
                  builder: (context, state) {
                return CategoryTitle(title: _getTitle(state.selectedCategory));
              }),
              Expanded(
                child: BlocBuilder<LearnNounBloc, LearnNounState>(
                  builder: (context, state) {
                    return NounContent(
                      state: state,
                      onPlayAudio: (item) {
                        if (item.audio != null && item.audio!.isNotEmpty) {
                          context
                              .read<LearnNounBloc>()
                              .add(PlayNounAudio(item));
                        }
                      },
                      onRetry: () {
                        context
                            .read<LearnNounBloc>()
                            .add(LoadNouns(category: state.selectedCategory));
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCategoryFilter(BuildContext context) {
    // Receive context
    return BlocBuilder<LearnNounBloc, LearnNounState>(
        builder: (context, state) {
      final selected = state.selectedCategory;

      return CategoryFilterDropdown(
        categories: <String>['all', ...state.categories],
        selectedCategory: selected,
        onCategoryChanged: (String? newValue) {
          if (newValue != null) {
            context.read<LearnNounBloc>().add(LoadNouns(category: newValue));
          }
        },
      );
    });
  }
}
