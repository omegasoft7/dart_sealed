import 'package:sealed_class_writer/src/exceptions/exceptions.dart';
import 'package:sealed_class_writer/src/manifest/manifest_integrity.dart';
import 'package:sealed_class_writer/src/utils/list_equality_utils.dart';
import 'package:sealed_class_writer/src/utils/type_utils.dart';

/// Manifest
class Manifest {
  Manifest({
    required this.name,
    required this.items,
    required this.params,
    required this.fields,
  }) {
    check(name.isGenClassName());
    check(items.isNotEmpty);
    checkManifestIntegrity(this);
  }

  /// name, for example "WeatherState".
  final String name;

  /// items. can not be empty.
  final List<ManifestItem> items;

  /// params. can be empty.
  final List<ManifestParam> params;

  /// common fields.
  ///
  /// items should contain all of common fields
  /// by themselves.
  final List<ManifestField> fields;

  @override
  String toString() => 'Manifest{name: $name, items: $items,'
      ' params: $params, fields: $fields}';

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Manifest &&
          runtimeType == other.runtimeType &&
          name == other.name &&
          listEquals(items, other.items) &&
          listEquals(params, other.params) &&
          listEquals(fields, other.fields);

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      name.hashCode ^
      listHash(items) ^
      listHash(params) ^
      listHash(fields);
}

/// Manifest item
class ManifestItem {
  ManifestItem({
    required this.name,
    required this.shortName,
    required this.equality,
    required this.fields,
  }) {
    check(shortName.isGenFieldName());
    check(name.isGenClassName());
  }

  /// full name, for example "WeatherRainy".
  final String name;

  /// lower short name, for example "rainy".
  final String shortName;

  /// equality.
  final ManifestEquality equality;

  /// fields.
  final List<ManifestField> fields;

  @override
  String toString() => 'Item{name: $name, shortName: $shortName,'
      ' equality: $equality, fields: $fields}';

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ManifestItem &&
          runtimeType == other.runtimeType &&
          name == other.name &&
          shortName == other.shortName &&
          equality == other.equality &&
          listEquals(fields, other.fields);

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      name.hashCode ^
      shortName.hashCode ^
      equality.hashCode ^
      listHash(fields);
}

/// Manifest equality
enum ManifestEquality {
  data,
  identity,
  distinct,
}

/// Manifest field
class ManifestField {
  ManifestField({
    required this.name,
    required this.type,
  }) {
    check(name.isGenFieldName());
  }

  /// name, for example "direction".
  final String name;

  /// type.
  final ManifestType type;

  @override
  String toString() => 'Field{name: $name, type: $type}';

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ManifestField &&
          runtimeType == other.runtimeType &&
          name == other.name &&
          type == other.type;

  @override
  int get hashCode => runtimeType.hashCode ^ name.hashCode ^ type.hashCode;
}

/// Manifest type
///
/// nullable type
class ManifestType {
  ManifestType({
    required this.name,
    required this.isNullable,
  }) {
    check(name.isExternalNonNullableTypeName());
  }

  /// name without any ?, ! or *
  ///
  /// for example "double". but
  /// can NOT be "double?".
  final String name;

  /// is nullable ?
  final bool isNullable;

  @override
  String toString() => 'Type{name: $name, isNullable: $isNullable}';

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ManifestType &&
          runtimeType == other.runtimeType &&
          name == other.name &&
          isNullable == other.isNullable;

  @override
  int get hashCode =>
      runtimeType.hashCode ^ name.hashCode ^ isNullable.hashCode;
}

/// Manifest param
///
/// ex. 'T extends Object?'
class ManifestParam {
  ManifestParam({
    required this.name,
    required this.bound,
  }) {
    check(name.isGenTypeName());
  }

  /// generic type name without any ?, !
  ///
  /// for example "T". but
  /// can NOT be "T?".
  final String name;

  /// type param super type like 'Object?'.
  /// can be nullable.
  final ManifestType bound;

  @override
  String toString() => 'Param{name: $name, bound: $bound}';

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ManifestParam &&
          runtimeType == other.runtimeType &&
          name == other.name &&
          bound == other.bound;

  @override
  int get hashCode => runtimeType.hashCode ^ name.hashCode ^ bound.hashCode;
}
