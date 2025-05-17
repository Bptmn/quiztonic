import 'package:collection/collection.dart';

enum QuizInputFormat {
  rawText,
  websiteUrl,
  pdfFile,
}

enum AuthMethod {
  email,
  google,
  apple,
}

enum SubscriptionType {
  monthly_subscription_quiztonic_premium,
  yearly_subscription_quiztonic_premium,
}

enum SubscriptionEntitlements {
  premium_access,
}

extension FFEnumExtensions<T extends Enum> on T {
  String serialize() => name;
}

extension FFEnumListExtensions<T extends Enum> on Iterable<T> {
  T? deserialize(String? value) =>
      firstWhereOrNull((e) => e.serialize() == value);
}

T? deserializeEnum<T>(String? value) {
  switch (T) {
    case (QuizInputFormat):
      return QuizInputFormat.values.deserialize(value) as T?;
    case (AuthMethod):
      return AuthMethod.values.deserialize(value) as T?;
    case (SubscriptionType):
      return SubscriptionType.values.deserialize(value) as T?;
    case (SubscriptionEntitlements):
      return SubscriptionEntitlements.values.deserialize(value) as T?;
    default:
      return null;
  }
}
