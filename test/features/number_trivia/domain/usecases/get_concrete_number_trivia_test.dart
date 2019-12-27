import 'package:dartz/dartz.dart';
import 'package:flutter_app/features/number_trivia/domain/entities/number_trivia.dart';
import 'package:flutter_app/features/number_trivia/domain/repositories/number_trivia_repository.dart';
import 'package:flutter_app/features/number_trivia/domain/usecases/get_concrete_number_trivia.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockNumberTriviaRepository extends Mock implements NumberTriviaRepository {}

void main() {
  GetConcreteNumberTriviaUseCase useCase;
  MockNumberTriviaRepository mockNumberTriviaRepository;

  setUp(() {
    mockNumberTriviaRepository = MockNumberTriviaRepository();
    useCase = GetConcreteNumberTriviaUseCase(mockNumberTriviaRepository);
  });

  final int tNumber = 1;
  final NumberTrivia tNumberTrivia = NumberTrivia(number: tNumber, text: "Test");

  test(
    'should get entity from numbertriviarepository',
    ()async {

      // arrange
      // Create data dummy
      when(mockNumberTriviaRepository.getConcreteNumberTrivia(any))
        .thenAnswer((_) async => Right(tNumberTrivia));

      // act
      final result = await useCase(tNumber);
      // print("Number ${tNumberTrivia.number}");

      // print("Right ${tNumberTrivia}");
      // print("Result ${result}");

      // assert
      expect(Right(tNumberTrivia), result);
      verify(mockNumberTriviaRepository.getConcreteNumberTrivia(tNumber));
      verifyNoMoreInteractions(mockNumberTriviaRepository);
    },
  );

}