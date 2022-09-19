import 'package:analyzer/dart/element/element.dart';
import 'package:sealed_class_creators/src/manifest/manifest_reader_builder.dart';
import 'package:sealed_class_creators/src/options/null_safety.dart';
import 'package:sealed_class_writer/sealed_class_writer.dart';

class SourceReader {
  const SourceReader();

  /// read manifest from element
  Manifest read(Element element) {
    const NullSafety().checkIsNullSafe(element);
    return const ManifestReaderBuilder().build(element).read();
  }
}
