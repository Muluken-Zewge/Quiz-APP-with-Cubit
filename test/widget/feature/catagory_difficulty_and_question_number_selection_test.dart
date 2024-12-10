// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_import, directives_ordering

import 'package:bdd_widget_test/data_table.dart' as bdd;
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:quiz_app_with_cubit/core/injection_container.dart';

import './step/the_app_is_running.dart';
import './step/i_see_the_catagory_selection_page.dart';
import './step/i_tap_a_catagory.dart';
import './step/i_am_navigated_to_the_difficulty_selection_screen.dart';
import './step/i_am_on_the_difficulty_selection_screen.dart';
import './step/i_see_text.dart';
import './step/i_see_the_following_difficulty_levels.dart';
import './step/i_tap_a_difficulty.dart';
import './step/i_am_navigated_to_the_question_number_selection_screen.dart';
import './step/i_am_on_question_number_selection_screen.dart';
import './step/i_see_number.dart';
import './step/i_tap_the_icon.dart';

void main() {
  final dio = serviceLocator<Dio>();
  group('''Catagory, difficulty and question number Selection''', () {
    testWidgets('''Catagory Selection screen is presented''', (tester) async {
      await theAppIsRunning(tester);
      await iSeeTheCatagorySelectionPage(tester);
    });
    testWidgets('''User selects a Catagory''', (tester) async {
      await theAppIsRunning(tester);
      await iTapACatagory(tester, 'Music');
      await iAmNavigatedToTheDifficultySelectionScreen(tester);
    });
    testWidgets('''difficulty Selection screen is presented''', (tester) async {
      await iAmOnTheDifficultySelectionScreen(tester, dio);
      await iSeeText(tester, 'Choose a difficulty');
      await iSeeTheFollowingDifficultyLevels(
          tester,
          const bdd.DataTable([
            ['Easy', 'Medium', 'Hard']
          ]));
    });
    testWidgets('''User selects a difficulty''', (tester) async {
      await iAmOnTheDifficultySelectionScreen(tester, dio);
      await iTapADifficulty(tester, 'Medium');
      await iAmNavigatedToTheQuestionNumberSelectionScreen(tester);
    });
    testWidgets('''question number Selection screen is presented''',
        (tester) async {
      await iAmOnQuestionNumberSelectionScreen(tester, dio);
      await iSeeText(tester, 'Choose number of questions');
      await iSeeNumber(tester, 1);
      await iSeeText(tester, 'Start Quiz');
    });
    testWidgets('''User increment and decrement the counter''', (tester) async {
      await iAmOnQuestionNumberSelectionScreen(tester, dio);
      await iTapTheIcon(tester, '+');
      await iSeeNumber(tester, 2);
      await iTapTheIcon(tester, '-');
      await iSeeNumber(tester, 1);
    });
  });
}
