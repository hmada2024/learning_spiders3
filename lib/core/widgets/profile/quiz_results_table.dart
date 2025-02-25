//lib/core/widgets/profile/quiz_results_table.dart
import 'package:flutter/material.dart';
import 'package:learning_spiders/core/config/app_constants.dart';
import 'package:learning_spiders/core/user/user_model.dart';

class QuizResultsTable extends StatelessWidget {
  final UserModel? currentUser;
  const QuizResultsTable({super.key, this.currentUser});

    Widget _buildQuizResultsTable(ThemeData theme, UserModel? currentUser) {
    Widget dataCell(String text, {bool isBold = false}) {
      return IntrinsicWidth(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
          child: Text(
            text,
            style: theme.textTheme.bodyMedium?.copyWith(
              fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
              color: AppConstants.textColorDark,
            ),
          ),
        ),
      );
    }

     DataRow buildQuizResultRow(String quizType, int score, int correctAnswers, int totalQuestions, ThemeData theme) {
        Widget dataCell(String text, {bool isBold = false}) {
          return IntrinsicWidth(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
              child: Text(
                text,
                style: theme.textTheme.bodyMedium?.copyWith(
                  fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
                  color: AppConstants.textColorDark,
                ),
              ),
            ),
          );
        }

        return DataRow(
          cells: [
            DataCell(dataCell(quizType)),
            DataCell(dataCell('$score')),
            DataCell(dataCell('$correctAnswers')),
            DataCell(dataCell('$totalQuestions')),
          ],
        );
      }

    final defaultDataRow = buildQuizResultRow('Nouns Quiz', 0, 0, 0, theme);
    final defaultDataRowAdjectives = buildQuizResultRow('Adjectives Quiz', 0, 0, 0, theme);
    final defaultDataRowSentences = buildQuizResultRow('Sentences Quiz', 0, 0, 0, theme);
    final defaultDataRowVerbs = buildQuizResultRow('Verbs Quiz', 0, 0, 0, theme);

    return DataTable(
      columnSpacing: 16,
      dataRowMinHeight: 48,
      dataRowMaxHeight: 60,
      headingRowColor: WidgetStateProperty.all(
          theme.colorScheme.secondary.withValues(alpha: 2.2)),
      dividerThickness: 1,
      columns: [
        DataColumn(label: dataCell('Quiz Type', isBold: true)),
        DataColumn(label: dataCell('Score', isBold: true)),
        DataColumn(label: dataCell('Correct', isBold: true)),
        DataColumn(label: dataCell('Total', isBold: true)),
      ],
      rows: currentUser == null
          ? [
              defaultDataRow,
              defaultDataRowAdjectives,
              defaultDataRowSentences,
              defaultDataRowVerbs
            ]
          : [
              buildQuizResultRow('Nouns Quiz', 0, 0, 0, theme),
              buildQuizResultRow('Adjectives Quiz', 0, 0, 0, theme),
              buildQuizResultRow('Sentences Quiz', 0, 0, 0, theme),
              buildQuizResultRow('Verbs Quiz', 0, 0, 0, theme),
            ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return LayoutBuilder(
      builder: (context, constraints) {
        return SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: ConstrainedBox(
            constraints: BoxConstraints(minWidth: constraints.maxWidth),
            child: _buildQuizResultsTable(theme, currentUser),
          ),
        );
      },
    );
  }
}