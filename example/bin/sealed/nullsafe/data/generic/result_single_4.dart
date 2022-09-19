import 'package:sealed_class_annotations/sealed_class_annotations.dart';

part 'result_single_4.sealed.dart';

@Sealed()
abstract class _Result<D extends num?> {
  void success(D? data);

  void error(Object exception);
}
