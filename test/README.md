# QuizTonic - Testing Documentation

Comprehensive guide for testing QuizTonic Flutter application.

## Table of Contents

- [Overview](#overview)
- [Test Structure](#test-structure)
- [Running Tests](#running-tests)
- [Writing Tests](#writing-tests)
- [Coverage Goals](#coverage-goals)
- [CI/CD Integration](#cicd-integration)

## Overview

QuizTonic uses Flutter's testing framework to ensure code quality and prevent regressions. Tests are organized by type and focus on critical business logic and utilities.

## Test Structure

```
test/
├── unit/                          # Unit tests for business logic
│   ├── api_config_test.dart      # API configuration tests
│   ├── error_messages_test.dart  # Error message generation tests
│   ├── quiz_validators_test.dart # Input validation tests
│   ├── retry_helper_test.dart    # Retry logic tests
│   └── quiz_generation_service_test.dart  # Service layer tests
├── widget/                        # Widget tests (future)
└── integration/                   # Integration tests (future)
```

## Running Tests

### Run All Tests

```bash
flutter test
```

### Run Unit Tests Only

```bash
flutter test test/unit/
```

### Run Specific Test File

```bash
flutter test test/unit/quiz_validators_test.dart
```

### Run Tests with Coverage

```bash
flutter test --coverage
```

View coverage report:
```bash
genhtml coverage/lcov.info -o coverage/html
open coverage/html/index.html
```

### Run Tests in Watch Mode

```bash
flutter test --watch
```

## Writing Tests

### Unit Test Template

```dart
import 'package:flutter_test/flutter_test.dart';
import 'package:quiz_tonic/path/to/your_class.dart';

void main() {
  group('YourClass', () {
    setUp(() {
      // Setup before each test
    });

    tearDown() {
      // Cleanup after each test
    });

    test('should do something', () {
      // Arrange
      final input = 'test';
      
      // Act
      final result = yourFunction(input);
      
      // Assert
      expect(result, 'expected');
    });
  });
}
```

### Widget Test Template

```dart
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:quiz_tonic/widgets/your_widget.dart';

void main() {
  testWidgets('YourWidget displays correctly', (WidgetTester tester) async {
    // Build widget
    await tester.pumpWidget(
      MaterialApp(
        home: YourWidget(),
      ),
    );

    // Verify
    expect(find.text('Expected Text'), findsOneWidget);
  });
}
```

## Test Guidelines

### What to Test

- **Business logic**: Validators, helpers, utilities
- **API services**: Service layer methods
- **Data models**: Struct serialization/deserialization
- **Critical widgets**: Custom components
- **User flows**: Integration tests for key features

### What NOT to Test

- **Generated code**: FlutterFlow-generated widgets
- **Third-party packages**: Firebase, Google Fonts, etc.
- **Simple getters/setters**: Unless they contain logic
- **UI styling**: Unless it affects functionality

### Best Practices

1. **Arrange-Act-Assert** pattern
2. **One assertion per test** (when possible)
3. **Descriptive test names**: "should return error when input is null"
4. **Test edge cases**: null, empty, min/max values
5. **Mock external dependencies**: API calls, Firebase
6. **Keep tests fast**: < 100ms per test
7. **Independent tests**: No shared state between tests

## Coverage Goals

### Current Coverage

- **Utilities**: ~90% (error handling, validation, retry)
- **Services**: ~80% (quiz generation service)
- **Overall**: Target 60% for critical paths

### Priority Areas

1. **High priority** (must have 80%+ coverage):
   - Validators (`lib/utils/quiz_validators.dart`)
   - Error handling (`lib/utils/error_helpers.dart`, `error_messages.dart`)
   - Retry logic (`lib/utils/retry_helper.dart`)
   - Services (`lib/services/`)

2. **Medium priority** (target 60% coverage):
   - Custom actions (`lib/custom_code/actions/`)
   - Data models (`lib/backend/schema/structs/`)

3. **Low priority** (optional):
   - FlutterFlow-generated code
   - UI-only widgets

## CI/CD Integration

### GitHub Actions

Tests run automatically on:
- Every push to `develop` or `main` branches
- Every pull request

See `.github/workflows/flutter_ci.yml` for pipeline configuration.

### Local Pre-commit Checks

Before committing, run:

```bash
flutter analyze        # Static analysis
flutter test          # All tests
flutter test --coverage  # Coverage check
```

### Pipeline Stages

1. **Analyze**: `flutter analyze` - static code analysis
2. **Test**: `flutter test test/unit/` - run all unit tests
3. **Build**: `flutter build apk` - verify builds succeed

## Common Issues

### Test Failures

#### Import Errors
```
Error: Cannot run with sound null safety because dependencies don't support it
```
Solution: Ensure all dependencies support null safety in `pubspec.yaml`

#### Missing Dependencies
```
Error: Cannot find package 'flutter_test'
```
Solution: Ensure `flutter_test` is in `dev_dependencies`

#### Timeout Errors
```
Test timed out after 30 seconds
```
Solution: Use `timeout` parameter or optimize test

### Widget Test Issues

#### Missing MaterialApp
```
Error: No MediaQuery widget ancestor found
```
Solution: Wrap widget with `MaterialApp` in test

#### Localization Errors
```
Error: No Localizations found
```
Solution: Mock `FFLocalizations` or wrap with localization delegates

## Adding New Tests

### For New Utilities

1. Create test file in `test/unit/your_utility_test.dart`
2. Follow unit test template above
3. Aim for 80%+ coverage
4. Run `flutter test` before committing

### For New Widgets

1. Create test file in `test/widget/your_widget_test.dart`
2. Follow widget test template above
3. Test rendering and interactions
4. Mock dependencies as needed

### For Integration Tests

1. Create test file in `test/integration/`
2. Test complete user flows
3. Use `IntegrationTestWidgetsFlutterBinding`
4. Run on real devices/emulators

## Resources

- [Flutter Testing Documentation](https://docs.flutter.dev/testing)
- [Widget Testing Guide](https://docs.flutter.dev/cookbook/testing/widget/introduction)
- [Integration Testing](https://docs.flutter.dev/testing/integration-tests)
- [Mockito for Mocking](https://pub.dev/packages/mockito)

## Support

For test-related questions:
1. Check this documentation
2. Review existing test files for examples
3. Consult Flutter testing docs
4. Ask in project discussions

---

**Last Updated**: November 2025  
**Test Count**: 43 unit tests  
**Coverage**: ~15-20% (core utilities)

