import 'package:sealed_class_annotations/sealed_class_annotations.dart';

part 'result_no_upper_2.sealed.dart';

@Sealed()
abstract class _Result<D, E> {
  void success(D? data);

  void error(E? exception);
}
