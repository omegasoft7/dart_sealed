import 'package:test/test.dart';

import '../../bin/nullsafe/result.dart';
import '../utils/type_utils.dart';

void main() {
  group('class Result', () {
    test('initialization', () {
      final a = Result.error(exception: 12);
      expect(a.exception, equals(12));
      expect(a, hasType<Error<Object?>>());

      final b = Result.success(data: 1.5);
      expect(b.data, equals(1.5));
      expect(b, hasType<Success<double>>());

      final c = Result.success(data: 1);
      expect(c.data, equals(1));
      expect(c, hasType<Success<int>>());
    });

    test('equality', () {
      final a = Result.success(data: 1);
      final b = Result.success(data: 1);
      final c = Result.success(data: 2);
      final d = Result.success(data: 0.75);

      expect(a, equals(a));
      expect(a, equals(b));
      expect(a, isNot(equals(c)));
      expect(a, isNot(equals(d)));
    });
  });
}