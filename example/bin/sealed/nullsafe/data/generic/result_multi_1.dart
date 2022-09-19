import 'package:sealed_class_annotations/sealed_class_annotations.dart';

part 'result_multi_1.sealed.dart';

@Sealed()
abstract class _Result<D extends num, E extends Object> {
  void success(D data);

  void error(E exception);

  void mixed(D data, E exception);
}
