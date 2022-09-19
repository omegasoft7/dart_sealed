import 'package:sealed_class_annotations/sealed_class_annotations.dart';

part 'result_common_split.sealed.dart';

@Sealed()
abstract class _ResultLeftRight<D extends num> {
  D get data;

  void successLeft();

  void successRight();
}
