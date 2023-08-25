import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:sb_myreports/features/jokes/data/models/get_random_joke_response_model.dart';
import 'package:sb_myreports/features/jokes/domain/use_cases/get_random_joke.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/modals/no_params.dart';
import '../../../../core/utils/globals/snack_bar.dart';

class JokeProvider extends ChangeNotifier {
  JokeProvider(this._getRandomJokeUseCase);

  //usecases
  GetRandomJokeUseCase _getRandomJokeUseCase;
  //properties
  GetRandomJokeResponseModel? getRandomJokeResponseModel;

  //valuenotifiers

  ValueNotifier<bool> randomJokeLoading = ValueNotifier(false);

  //usecases calls
  Future<void> getRandomJoke() async {
    randomJokeLoading.value = false;
    var loginEither = await _getRandomJokeUseCase(NoParams());
    if (loginEither.isLeft()) {
      handleError(loginEither);
      randomJokeLoading.value = false;
    } else if (loginEither.isRight()) {
      loginEither.foldRight(null, (response, previous) async {
        print(response.toJson());
        getRandomJokeResponseModel = response;
        randomJokeLoading.value = false;
      });
    }
  }

  // Error Handling
  void handleError(Either<Failure, dynamic> either) {
    either.fold((l) => ShowSnackBar.show(l.message), (r) => null);
  }
}
