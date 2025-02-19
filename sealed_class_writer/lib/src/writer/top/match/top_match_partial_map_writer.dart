import 'package:sealed_class_writer/src/manifest/manifest.dart';
import 'package:sealed_class_writer/src/utils/branch_utils.dart';
import 'package:sealed_class_writer/src/utils/string_utils.dart';
import 'package:sealed_class_writer/src/writer/top/match/top_match_base_writer.dart';

/// match method writer partialMap()
class TopMatchPartialMapWriter extends TopMatchBaseWriter {
  const TopMatchPartialMapWriter(Manifest manifest) : super(manifest);

  /// ex. if (weather is WeatherSunny) { sunny?.call(weather); }
  If topMatchPartialMapIf(ManifestItem item) => If(
        condition: '$topLower ${isSub(item)}',
        code: Branch(
          ifs: [
            If(
              condition: '${subLower(item)} != null',
              code: '${subLower(item)}${topMatchItemCallArgs()};',
            ),
            If(
              condition: 'orElse != null',
              code: 'orElse${topMatchItemCallArgs()};',
            ),
          ],
        ).join(),
      );

  List<If> topMatchPartialMapIfs() =>
      manifest.items.map(topMatchPartialMapIf).toList();

  /// body of map method
  String topMatchPartialMapBody() => [
        initThisValue(),
        Branch(
          ifs: topMatchPartialMapIfs(),
          els: throwingElse(),
        ).join(),
      ].joinLines();

  Iterable<String> topMatchPartialMapArgs() => [
        ...manifest.items.map(topMatchVoidNArg),
        topMatchVoidNArgOrElse(),
      ];

  /// start of map method
  String topMatchPartialMapStart() => [
        'void partialMap',
        topMatchPartialMapArgs().joinArgsFull().withBraces().withParenthesis(),
      ].joinParts();

  /// void PartialMap(item...)
  /// {...}
  String topMatchPartialMap() => [
        "@Deprecated('Use `mapOrNull` instead. "
            "Will be removed by next release.')",
        topMatchPartialMapStart(),
        '{',
        topMatchPartialMapBody(),
        '}',
      ].joinLines();
}
