import 'package:build/build.dart';
import 'package:sealed_class_creators/src/generator.dart';
import 'package:source_gen/source_gen.dart';

Builder sealedBuilder() {
  return PartBuilder(
    const [SealedGenerator()],
    '.sealed.dart',
  );
}
