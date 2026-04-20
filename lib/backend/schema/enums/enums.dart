import 'package:collection/collection.dart';

enum Status {
  error,
  warning,
  success,
  info,
}

enum Language {
  English,
  Deutsch,
  French,
  Korean,
}

enum Gender {
  Male,
  Female,
  Secret,
}

enum Type {
  Math,
  Geometry,
  Chemistry,
  Physics,
}

enum PlantType {
  plant,
  mushroom,
  weed,
  disease,
  toxicity,
  tree,
}

enum Subscription {
  lifetime,
  weekly,
}

enum RequiresType {
  Sunlight,
  Fertilizer,
  Propagating,
  Humidity,
  Soil,
  Pruning,
  Potting,
  Diseases,
  Temperature,
  Container,
  Grow,
  FunFact,
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
    case (Status):
      return Status.values.deserialize(value) as T?;
    case (Language):
      return Language.values.deserialize(value) as T?;
    case (Gender):
      return Gender.values.deserialize(value) as T?;
    case (Type):
      return Type.values.deserialize(value) as T?;
    case (PlantType):
      return PlantType.values.deserialize(value) as T?;
    case (Subscription):
      return Subscription.values.deserialize(value) as T?;
    case (RequiresType):
      return RequiresType.values.deserialize(value) as T?;
    default:
      return null;
  }
}
