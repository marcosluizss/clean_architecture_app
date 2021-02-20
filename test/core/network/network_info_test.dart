import 'package:clean_architecture_app/core/network/network_info.dart';
import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockDataConnectionChecker extends Mock implements DataConnectionChecker {}

void main() {
  NetworkInfoImpl networkInfoImpl;
  MockDataConnectionChecker mockDataConnectionChecker;

  setUp(() {
    mockDataConnectionChecker = MockDataConnectionChecker();
    networkInfoImpl = NetworkInfoImpl(mockDataConnectionChecker);
  });

  group('isConnected', () {
    
    test('should foward call to DataConnectionChecker.hasConnection', () async {
      when(mockDataConnectionChecker.hasConnection)
          .thenAnswer((_) async => true);

      final result = await networkInfoImpl.isConnected;

      verify(mockDataConnectionChecker.hasConnection);
      expect(result, true);
    });
  });
}
