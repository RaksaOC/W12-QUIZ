# Quiz Application - Layered Architecture (AI GENERATED DOC)

This is a Dart console application that implements a quiz system using layered architecture principles. The application allows users to take quizzes, tracks their answers, and stores data persistently in JSON files.

## Features

- **Quiz Management**: Create and manage quiz questions with multiple choice answers
- **User Sessions**: Track individual user sessions with scores and answers
- **Persistent Storage**: Data is stored in separate JSON files for quiz content and user sessions
- **ID-Based References**: Uses UUIDs for all entities to ensure unique identification
- **Scoring System**: Calculates both percentage scores and point-based scores

## Architecture

The application follows a layered architecture pattern:

- **Domain Layer** (`lib/domain/quiz.dart`): Contains core business logic classes (Question, Answer, Quiz, Session)
- **Data Layer** (`lib/data/quiz_file_provider.dart`): Handles data persistence with QuizRepository and SessionRepository
- **UI Layer** (`lib/ui/quiz_console.dart`): Manages user interaction and console interface
- **Main** (`lib/main.dart`): Application entry point and orchestration

## Data Storage

The application uses two separate JSON files for data persistence:

1. **`lib/data/quiz_data.json`**: Stores quiz questions and correct answers

   - Contains quiz ID, questions with their choices and correct answers
   - Only quiz content, no user-specific data

2. **`lib/data/sessions.json`**: Stores user sessions and their answers
   - Contains session ID, username, scores, and individual answers
   - Each session tracks all answers given by a user

## How It Works

1. **Quiz Creation**: Sample quiz data is created if the quiz file doesn't exist
2. **User Interaction**: Users enter their name and answer questions through the console
3. **Answer Tracking**: Each answer is stored in the current session with the question ID
4. **Scoring**: Scores are calculated based on correct answers and question points
5. **Data Persistence**: Sessions are saved to the sessions JSON file after each quiz completion

## Testing

The test suite (`test/quiz_test.dart`) includes:

- **ID-based functionality**: Tests question retrieval by ID
- **Scoring calculations**: Verifies percentage and point scoring works correctly
- **JSON serialization**: Tests data persistence and retrieval from JSON files
- **Session management**: Ensures answers are properly stored in sessions

Run tests with: `dart test`

## Usage

Run the application with: `dart run lib/main.dart`

The application will create sample quiz data if needed and start accepting user sessions. Each session is saved automatically after completion.
