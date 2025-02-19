import 'package:sealed_class_writer/src/manifest/manifest.dart';
import 'package:sealed_class_writer/src/utils/string_utils.dart';
import 'package:sealed_class_writer/src/writer/base/base_cast_utils_writer.dart';

/// top cast writer
class TopCastWriter extends BaseCastUtilsWriter {
  const TopCastWriter(Manifest manifest) : super(manifest);

  /// ex. isRainy
  String topCastIs(ManifestItem item) =>
      'bool get is${subUpper(item)} => this ${isSub(item)};';

  Iterable<String> topCastsIs() => manifest.items.map(topCastIs);

  /// ex. asRainy()
  String topCastAs(ManifestItem item) =>
      '${subCall(item)} get as${subUpper(item)} =>'
      ' this ${asSub(item)};';

  Iterable<String> topCastsAs() => manifest.items.map(topCastAs);

  /// ex. asRainyOrNull()
  String topCastAsOrNull(ManifestItem item) => [
        '${subCall(item)}$n get as${subUpper(item)}OrNull {',
        initThisValue(),
        'return $topLower ${isSub(item)} ? $topLower : null;',
        '}',
      ].joinLines();

  Iterable<String> topCastsAsOrNull() => manifest.items.map(topCastAsOrNull);

  Iterable<String> topCastMethods() => [
        ...topCastsIs(),
        ...topCastsAs(),
        ...topCastsAsOrNull(),
      ];
}
