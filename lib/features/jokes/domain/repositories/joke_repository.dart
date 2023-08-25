import 'package:dartz/dartz.dart';
import 'package:sb_myreports/core/modals/no_params.dart';
import 'package:sb_myreports/features/jokes/data/models/get_random_joke_response_model.dart';

import '../../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';

abstract class JokeRepository {

  Future<Either<Failure, GetRandomJokeResponseModel>> getRandomJoke(NoParams params);


}
