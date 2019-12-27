import 'package:dartz/dartz.dart';
import 'package:flutter_app/core/error/failures.dart';
import 'package:flutter_app/features/number_trivia/domain/entities/number_trivia.dart';
import 'package:flutter_app/features/number_trivia/domain/repositories/number_trivia_repository.dart';

class GetConcreteNumberTriviaUseCase  {
  final NumberTriviaRepository repository;

  GetConcreteNumberTriviaUseCase(this.repository);

  Future<Either<Failure, NumberTrivia>> call(int number) async {
    return await repository.getConcreteNumberTrivia(number);
  }

}