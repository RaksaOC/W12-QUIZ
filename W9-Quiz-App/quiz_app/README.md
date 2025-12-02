# Quiz App - Architecture Overview

This document provides an overview of the architecture and design decisions for this Flutter quiz application. The project is structured following a layered architecture pattern, adapted from a previous Dart CLI application to work seamlessly in a mobile environment.

## Application Structure

### Navigation & Screen Management

The application consists of **6 main screens** organized through a centralized navigation system:

- **Welcome Screen** - Main landing page with navigation options
- **Quiz Screen** - Displays available quizzes for selection
- **Question Screen** - Interactive quiz-taking interface
- **Result Screen** - Shows quiz completion results and scores
- **History Screen** - Displays previous quiz submission history
- **Auth Screen** - User authentication interface

Screen navigation is managed through a `Pages` enum that defines each page's identity, title, icon, and styling. The main `QuizApp` widget (`quiz_app.dart`) serves as the central controller, managing the current page state and handling all navigation through callback functions. This approach centralizes navigation logic and makes the flow between screens explicit and maintainable.

The `QuizApp` widget also acts as the primary data orchestrator, handling both data retrieval and submission operations. It manages service instances (`SubmissionService` and `SessionService`) and coordinates data flow between screens, ensuring that data is properly fetched before display and correctly formatted before submission.

## UI Layer

### Screens

Each screen is a self-contained widget that receives data and callbacks as parameters. Screens focus purely on presentation and user interaction, delegating business logic and data operations to the central `QuizApp` controller.

### Reusable Widgets

The application leverages a set of reusable widgets to maintain consistency and reduce code duplication:

- **`AppButton`** - Standardized button component with optional icon support
- **`AppInput`** - Consistent text input field styling and behavior
- **`BackButton`** - Navigation back button with consistent styling
- **`MenuButton`** - Menu navigation button styled with page metadata
- **`QuizCard`** - Displays quiz information as a selectable card
- **`QuestionCard`** - Renders individual quiz questions with choice selection
- **`QuestionNavigator`** - Controls navigation between questions (Previous/Next/Submit)
- **`QuestionResultCard`** - Displays question results with correct/incorrect indicators
- **`QuizHistoryCard`** - Shows submission history entries in a card format

These widgets encapsulate styling and behavior, making the UI layer more maintainable and consistent across different screens.

## Domain Layer - Services

The service layer acts as an intermediary between the UI and data layers, containing business logic and coordinating repository operations.

### SubmissionService

The `SubmissionService` handles quiz submission operations. Its primary responsibility is to process user answers and create submission records. When a user completes a quiz, the service:

1. Receives a list of `QuestionHistory` objects (user answers during gameplay)
2. Calculates the score by comparing selected choices against correct answers
3. Wraps the `QuestionHistory` list along with user and quiz identifiers into a `Submission` object
4. Persists the submission through the repository layer

This service encapsulates the business logic for score calculation and submission creation, keeping this complexity out of the UI layer.

### SessionService

The `SessionService` is a singleton that manages application session state and authentication. Originally developed for a Dart CLI application, it has been slightly modified for mobile use but retains the same core functionality:

- Maintains the current logged-in user
- Tracks the currently selected quiz during gameplay
- Handles user authentication (login/logout operations)
- Provides session state queries (e.g., `isUserLoggedIn`)

By centralizing session management, the application ensures consistent authentication state across all screens without requiring complex state management solutions.

## Data Layer - Repository Pattern

### RepositoryBase

The `RepositoryBase` is an abstract base class that provides common CRUD (Create, Read, Update, Delete) operations for all repositories. This base class was originally designed for a Dart CLI application, but has been enhanced to work in a mobile environment.

The key adaptation for mobile platforms involves handling different file system contexts:

- **Asset Bundle Support**: On mobile, initial data is packaged in Flutter's asset bundle. The `RepositoryBase` includes logic to copy initial data from assets to the application's documents directory on first launch.
- **Documents Directory Resolution**: Mobile applications (iOS/Android) require using the application's documents directory for file storage, which differs from the CLI's direct file path approach. The repository automatically resolves file paths to use the appropriate directory based on the platform.
- **Initialization Pattern**: The repository supports an initialization step that sets up the documents directory and handles asset-to-file copying asynchronously, ensuring data is available before first use.

Child repository classes only need to implement JSON serialization methods (`toJson` and `fromJson`), while inheriting all standard database operations. This approach significantly reduces boilerplate code and ensures consistent data access patterns across all repositories.

### Repository Implementations

- **`QuizRepository`** - Manages quiz data persistence and retrieval
- **`SubmissionRepository`** - Handles submission record storage and loading
- **`UsersRepository`** - Manages user account data

Each repository extends `RepositoryBase` and implements entity-specific serialization logic, leveraging the base class for all file I/O operations.

## Model Layer

The application uses a set of domain models to represent core entities:

- **`Quiz`** - Represents a complete quiz with title, timer, and a list of questions
- **`Question`** - Represents an individual question with title and multiple choice options
- **`Choices`** - Represents a single choice option with its text and correctness flag
- **`User`** - Represents a user account with authentication credentials
- **`Submission`** - Represents a completed quiz submission with user ID, quiz ID, score, and answer history

### QuestionHistory - A Special Case

The `QuestionHistory` model serves a unique dual purpose in the application architecture:

1. **Data Transfer Object**: During quiz gameplay, `QuestionHistory` objects are used to temporarily store user selections (question ID and selected choice ID) as the user progresses through questions.
2. **Submission Component**: When a quiz is completed, the list of `QuestionHistory` objects is wrapped within a `Submission` object along with calculated scores and metadata before being persisted to storage.

This pattern allows for clean separation between the interactive quiz-taking process (where answers are tracked individually) and the final submission (where all answers are collected into a single persistent record). The `QuestionHistory` model bridges the gap between transient gameplay state and persistent submission records.

## Development Notes

### AI-Assisted Development

This project utilized AI assistance in several key areas:

- **Database Data Generation**: AI was used to generate the initial fake database data (users, quizzes, questions) stored in JSON files within the asset bundle.
- **RepositoryBase Adaptation**: When adapting the repository base class from CLI to mobile, AI assistance was instrumental in resolving file system issues related to asset bundles and documents directory access—problems that were new challenges not previously encountered.
- **Architecture Documentation**: This README was generated with AI assistance, restructuring the original notes and improving wording for clarity while maintaining technical accuracy.

This project serves educational purposes, demonstrating layered architecture, repository patterns, and mobile application design principles.
