import 'package:analyzer/dart/element/element.dart';
import 'package:build/build.dart';
import 'package:sealed_class_annotations/sealed_class_annotations.dart';
import 'package:sealed_class_creators/src/source/source_reader.dart';
import 'package:sealed_class_writer/sealed_class_writer.dart';
import 'package:source_gen/source_gen.dart';

class SealedGenerator extends GeneratorForAnnotation<Sealed> {
  const SealedGenerator();

  @override
  String generateForAnnotatedElement(
    Element element,
    ConstantReader annotation,
    BuildStep buildStep,
  ) =>
      SourceWriter(
        const SourceReader().read(
          element,
        ),
      ).write();

  @override
  String toString() => 'sealed_class_creators';
}
