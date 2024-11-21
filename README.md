# quiz_app_with_cubit

## Overview

A quiz application built using the Flutter framework that fetches multiple choice questions from The Trivia Api. This app allows users to test their knowledge on various topics while providing an engaging and intuitive user experience.

## Features

- **Interactive Quiz Interface**: Users can select answers from a list of alternatives, with instant feedback on whether their choice was correct or incorrect.
- **Visual Feedback**:
  - Correct answers are marked with a green checkmark (✔️).
  - Incorrect answers are marked with a red cross (❌), and the correct answer is highlighted.
- **Results Summary**:
  - Displays the number of correct answers and detailed feedback for each question.
  - Highlights correct answers and user-selected answers in the result summary.
- **Elegant UI**: The app features gradients, animations, and carefully crafted layouts for an enjoyable experience.

## Teck Stack

- **Flutter**: Framework for building beautiful cross-platform applications.
- **Dart**: Programming language for Flutter.
- **The Trivia API**: Provide questions for the app.
- **Cubit/Bloc**: State management for controlling the flow of data within the app.

## Architecture

The project follows a clean architecture approach with three main layers:

- **Data Layer**: Manages data sources (API) and implements repositories.
- **Domain Layer**: Contains core business logic and use cases.
- **Presentation Layer**: UI components and Cubit for state management.
