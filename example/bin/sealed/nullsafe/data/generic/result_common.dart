import 'package:sealed_class_annotations/sealed_class_annotations.dart';

part 'result_common.sealed.dart';

@Sealed()
abstract class _Result<D extends num> {
  Object? get value;

  void success(D value);

  void error();
}
