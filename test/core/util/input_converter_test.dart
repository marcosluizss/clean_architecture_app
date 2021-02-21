import 'package:clean_architecture_app/core/util/input_converter.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  InputConverter inputConverter;

  setUp(() {
    inputConverter = InputConverter();
  });

  group('stringToUnsignedInt', () {
    test(
      'should return an integer when the string represents an unsigned integer',
      () {
        final str = '123';

        final result = inputConverter.stringToUnsignedInteger(str);

        expect(result, Right(123));
      },
    );

    test(
      'should return an failure when the string is not an integer',
      () {
        final str = 'abc';

        final result = inputConverter.stringToUnsignedInteger(str);

        expect(result, Left(InvalidInputFailure()));
      },
    );

    test(
      'should return an failure when the string is a negative integer',
      () {
        final str = '-123';

        final result = inputConverter.stringToUnsignedInteger(str);

        expect(result, Left(InvalidInputFailure()));
      },
    );
  });
}
