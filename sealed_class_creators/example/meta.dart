import 'package:sealed_class_annotations/sealed_class_annotations.dart';

part 'meta.sealed.dart';

@Sealed()
@WithPrefix('Prefix')
abstract class _Weather {
  void sunny();

  @WithName('BadWeather')
  void rainy(int rain);

  @WithName('VeryBadWeather')
  @WithEquality(Equality.distinct)
  void windy(double velocity, double? angle);
}

@Sealed()
@WithPrefix('')
abstract class _ApiError {
  void internetError();

  void serverError(int code);

  void otherError(String? message);
}
