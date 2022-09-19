import 'package:sealed_class_annotations/sealed_class_annotations.dart';

part 'weather.sealed.dart';

@Sealed()
abstract class _Weather {
  void sunny();

  void rainy(int rain);

  void windy(double velocity, double? angle);
}
