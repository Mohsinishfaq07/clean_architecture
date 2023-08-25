
import 'package:dartz/dartz.dart';
import 'package:sb_myreports/core/modals/no_params.dart';
import 'package:sb_myreports/features/jokes/data/models/get_random_joke_response_model.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/utils/constants/app_messages.dart';
import '../../../../core/utils/network/network_info.dart';
import '../../domain/repositories/joke_repository.dart';
import '../data_sources/jokes_remote_data_source.dart';

class jokeRepoImp extends JokeRepository {
  final NetworkInfo networkInfo;

  final JokeRemoteDataSource remoteDataSource;

  jokeRepoImp({
    required this.networkInfo,
    required this.remoteDataSource,
  });

  @override
  Future<Either<Failure, GetRandomJokeResponseModel>> getRandomJoke(NoParams params) async {
    if (!await networkInfo.isConnected) {
      return  const Left(NetworkFailure(AppMessages.noInternet));
    }
    try {
      return Right(await remoteDataSource.getRandomJoke(params));
    } on Failure catch (e) {
      return Left(e);
    } catch (e) {
      return Left(ServerFailure(e));
    }
  }




}
