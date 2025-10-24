## Project structure (high-level)

- `lib/`
  - `auth/` — Auth abstractions and Firebase implementations (email, Google, Apple, anonymous, phone, JWT). Entry points: `auth_manager.dart`, `firebase_auth/firebase_auth_manager.dart` and helpers under `firebase_auth/`.
  - `backend/` — Firestore models, querying utilities, Firebase config, and API client.
    - `api_requests/` — `api_manager.dart` (HTTP client with multipart support), `api_calls.dart` (AI generation endpoint wrapper).
    - `schema/` — Firestore records and structs: `users`, `my_quiz`, `my_folders`, `my_statistics`, `my_subscription`, and structs like `QuestionCardStruct`, `FlashcardStruct`.
    - `firebase/` — `firebase_config.dart` initializes Firebase for web/mobile.
    - `firebase_storage/` — Upload helpers.
  - `components/` — Reusable UI widgets like `QuestionCard`, `AnswerItem`, `ItemFlashcard`, list items, loading, empty states.
  - `dialogs/` — UI dialogs (create/edit folder, password check, pick folder, reset password).
  - `flutter_flow/` — Generated utilities: theming, widgets, navigation, localization, revenuecat, timers, request manager, etc.
  - `main_pages/` — Feature pages: quiz generation, quiz runner, answers review, score, loading view, flashcards.
  - `tab_pages/` — Bottom navigation tabs: home, library, profile.
  - `settings_pages/` — Profile editing, language, legal, security, subscription, support/contact, feedback.
  - `custom_code/actions/` — Small utility actions (PDF to binary, clipboard paste, URL normalization, RevenueCat, Firestore ID generation, etc.).
  - `app_state.dart` — Global app state storage with request managers.
  - `app_constants.dart` — Constants (e.g., layout max width, initial credits).
  - `main.dart` — App entry point and routing (via FlutterFlow-generated navigation).

## Technical approach and stack

- **Flutter + FlutterFlow** for cross-platform mobile and web UI with Material 3 styling.
- **Firebase** for authentication (email, Google, Apple), user management, and data storage in Cloud Firestore; file uploads via Cloud Storage.
- **Serverless AI API**: `AiContentGenerationApiCall` posts a JSON payload with content selectors (text/url/pdf), quiz parameters, and expects structured JSON for questions and flashcards.
- **Data modeling** in Firestore with typed record classes (e.g., `UsersRecord`, `MyQuizRecord`, `MyFoldersRecord`) and value structs (`QuestionCardStruct`, `FlashcardStruct`). Collections are nested under user documents for per-user data isolation.
- **State** handled with FlutterFlow models and Provider; ephemeral UI state resides in page/component models.
- **Auth utilities** (`auth/firebase_auth/auth_util.dart`) expose current user info, JWT token stream, and an `AuthUserStreamWidget` for reactive UI.
- **Payments/credits** backed by `MySubscriptionRecord` and RevenueCat custom actions; initial credits set from `FFAppConstants` on first social/email sign-in.
- **Navigation and localization** via FlutterFlow utilities (`GoRouter` helpers, `FFLocalizations`).

## Classic user flow

1. **Onboarding & auth**: User opens the app and logs in via email/password, Google, or Apple. On first login the user document and default stats/subscription are created.
2. **Home/library**: User can view folders, previous quizzes, and basic statistics.
3. **Generate quiz**: In the generate page, user selects content source:
   - Paste raw text
   - Enter a URL (normalized)
   - Upload/select a PDF (converted to binary)
   Parameters (number of questions/choices, flashcards) are set.
4. **AI request**: App calls the AI API through `AiContentGenerationApiCall`, sending the prepared payload. A loading view is shown.
5. **Store results**: On success, the structured quiz is mapped to `QuestionCardStruct`/`FlashcardStruct` and stored as a `MyQuizRecord` under the current user, optionally linked to a folder.
6. **Take quiz**: User starts the quiz. Each question is displayed with choices; selection is locked per question, giving immediate feedback and storing `userSelectionIndex` and `questionIsDone`.
7. **Scoring**: After finishing, the score page shows totals and correctness; statistics such as `nbQuizDone`, `nbQuestionsDone`, `nbCorrectAnswers`, and time are updated.
8. **Review**: The user can review answers, explanations, and flashcards later from the library.
9. **Manage**: In settings, user can change language, profile, password, review legal policies, manage subscription/credits, and send feedback.

Refer to the README for features and stack, and to `recommandation.md` for improvement suggestions.

