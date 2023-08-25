import 'package:dartz/dartz.dart';
import 'package:sb_myreports/features/jokes/data/models/get_random_joke_response_model.dart';
import 'package:sb_myreports/features/jokes/domain/repositories/joke_repository.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/modals/no_params.dart';
import '../../../../core/usecases/usecase.dart';

class GetRandomJokeUseCase
    extends UseCase<GetRandomJokeResponseModel, NoParams> {
  JokeRepository repository;
  GetRandomJokeUseCase(this.repository);

  @override
  Future<Either<Failure, GetRandomJokeResponseModel>> call(NoParams params) async {
    return await repository.getRandomJoke(params);
  }
}
