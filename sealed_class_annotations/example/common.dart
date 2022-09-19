import 'package:sealed_class_annotations/sealed_class_annotations.dart';

part 'common.sealed.dart';

@Sealed()
abstract class _ApiError {
  String get message;

  String? get code;

  void internetError();

  void badRequest();

  void internalError(Object? error);
}
