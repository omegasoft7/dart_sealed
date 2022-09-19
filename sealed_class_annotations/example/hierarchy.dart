import 'package:sealed_class_annotations/sealed_class_annotations.dart';

part 'hierarchy.sealed.dart';

@Sealed()
abstract class _Apple {
  void friend(_Banana banana);
}

@Sealed()
abstract class _Banana {
  void friend(_Apple apple);
}

@Sealed()
abstract class _Basket {
  void friends(
    _Apple? apple,
    _Banana? banana,
  );
}
