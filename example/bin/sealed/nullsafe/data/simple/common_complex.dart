import 'package:sealed_class_annotations/sealed_class_annotations.dart';

part 'common_complex.sealed.dart';

@Sealed()
abstract class _Common {
  Object? get x;

  final String y = '';

  void one(String x);

  void two(Object x);

  void three();

  void four(Object? x);
}

@Sealed()
abstract class _CommonWithOverride {
  @WithType('Object?')
  dynamic get x;

  @WithType('String')
  final dynamic y = null;

  void one(@WithType('String') dynamic x);

  void two(@WithType('Object') dynamic x);

  void three();

  void four(@WithType('Object?') dynamic x);
}

@Sealed()
abstract class _CommonHierarchy {
  _Common get x;

  void one();
}
