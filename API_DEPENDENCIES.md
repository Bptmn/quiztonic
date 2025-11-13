# External Dependencies

This document describes the external dependencies used by the QuizTonic mobile application.

## 🔗 QuizTonic API

### Overview
The QuizTonic mobile application depends on the QuizTonic API backend service for AI-powered quiz and flashcard generation.

### Repository
- **GitHub**: [https://github.com/Bptmn/quiztonic_api](https://github.com/Bptmn/quiztonic_api)
- **API Contract**: [API_CONTRACT.md](https://github.com/Bptmn/quiztonic_api/blob/main/API_CONTRACT.md)

### Current API Endpoint

#### Production
```
https://2mmjiwjyo27dfsa227qdc67jue0drajz.lambda-url.eu-west-1.on.aws/
```

#### Development
```
http://localhost:5050
```

### API Version
- **Current**: v1.0.0
- **Versioning**: Semantic versioning (MAJOR.MINOR.PATCH)

### Usage in Code

The API is called through `lib/backend/api_requests/api_calls.dart`:

```dart
import 'package:quiz_tonic/backend/api_requests/api_calls.dart';

// Generate quiz from URL
final response = await AiContentGenerationApiCall.call(
  url: 'https://example.com/article',
  numOfQuestions: 10,
  numOfChoices: 4,
  generateFlashcard: true,
);
```

### Request Format

```json
{
  "data": {
    "text_content": "string (optional)",
    "url": "string (optional)",
    "pdf_file": "string (base64, optional)",
    "num_questions": "number (required)",
    "num_choices": "number (required)",
    "generate_flashcards": "boolean (optional)"
  }
}
```

### Response Format

```json
{
  "quizName": "string",
  "questionCards": [
    {
      "questionText": "string",
      "questionChoices": ["string"],
      "questionAnswerIndex": "number",
      "answerExplanation": "string"
    }
  ],
  "flashcards": [
    {
      "front": "string",
      "back": "string"
    }
  ],
  "quizContext": {
    "contentSource": "string",
    "contentLanguage": "string",
    "tokens": {...},
    "costs": {...}
  }
}
```

### Configuration

The API URL is currently hardcoded in `lib/backend/api_requests/api_calls.dart`. For production deployments, consider:

1. **Environment Variables**: Use Flutter environment variables for different environments
2. **Remote Config**: Use Firebase Remote Config for dynamic URL updates
3. **Configuration File**: Create a config file that can be easily updated

### Example: Environment-Based Configuration

```dart
// lib/config/api_config.dart
class ApiConfig {
  static const String apiUrl = String.fromEnvironment(
    'API_URL',
    defaultValue: 'https://2mmjiwjyo27dfsa227qdc67jue0drajz.lambda-url.eu-west-1.on.aws/',
  );
}
```

### Error Handling

The API returns standard HTTP status codes:
- **200**: Success
- **400**: Bad Request (invalid parameters)
- **422**: Unprocessable Entity (parsing errors)
- **500**: Internal Server Error (API errors)

See [API_CONTRACT.md](https://github.com/Bptmn/quiztonic_api/blob/main/API_CONTRACT.md) for detailed error responses.

### Breaking Changes

When the API version changes:
1. Check the API changelog in the quiztonic_api repository
2. Update the API endpoint if needed
3. Update request/response handling if the contract changed
4. Test thoroughly before deploying

### Monitoring

Monitor API usage and costs through:
- AWS CloudWatch logs (for Lambda)
- API response includes token usage and cost estimates
- Firebase Analytics (for app-side tracking)

## 📚 Additional Resources

- [QuizTonic API README](https://github.com/Bptmn/quiztonic_api/blob/main/README.md)
- [API Contract Documentation](https://github.com/Bptmn/quiztonic_api/blob/main/API_CONTRACT.md)
- [Deployment Guide](https://github.com/Bptmn/quiztonic_api/blob/main/RAQAM_LAMBDA_DEPLOYMENT_GUIDE.md)

