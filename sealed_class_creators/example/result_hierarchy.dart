import 'package:sealed_class_annotations/sealed_class_annotations.dart';

part 'result_hierarchy.sealed.dart';

@Sealed()
abstract class _Result<D extends num> {
  void success(D data);

  void error(Object exception);
}

@Sealed()
abstract class _Basket {
  void hold(
    _Result<int> x,
    _Result<double>? y,
  );
}
