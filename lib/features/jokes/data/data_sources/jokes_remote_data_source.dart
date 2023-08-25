import 'dart:async';
import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import 'package:sb_myreports/core/modals/no_params.dart';
import 'package:sb_myreports/features/jokes/data/models/get_random_joke_response_model.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/modals/error_response_model.dart';
import '../../../../core/utils/constants/app_messages.dart';
import '../../../../core/utils/constants/app_url.dart';

abstract class JokeRemoteDataSource {
  Future<GetRandomJokeResponseModel> getRandomJoke(NoParams params);
}

class JokeRemoteDataSourceImp implements JokeRemoteDataSource {
  Dio dio;
  JokeRemoteDataSourceImp({required this.dio});

  @override
  Future<GetRandomJokeResponseModel> getRandomJoke(NoParams params) async {
    String url = AppUrl.baseUrl + AppUrl.randomJokeUrl;

    try {
      final response = await dio.get(
        url,
      );

      // var decryptedResponse = Encryption.decryptObject(response.data['Text']);
      // var jsonResponse = jsonDecode(decryptedResponse);

      if (response.statusCode == 200) {
        var object = GetRandomJokeResponseModel.fromJson(response.data);

        // var object = GetPaymentRateListResponse.fromJson(jsonResponse);

        return object;
      }

      throw const SomethingWentWrong(AppMessages.somethingWentWrong);
    } on DioError catch (exception) {
      Logger().i('returning error');
      if (exception.type == DioErrorType.connectTimeout) {
        throw TimeoutException(AppMessages.timeOut);
      } else {
        // var decryptedResponse = Encryption.decryptObject(exception.response?.data['Text']);
        // var jsonResponse = jsonDecode(decryptedResponse);
        ErrorResponseModel errorResponseModel =
            ErrorResponseModel.fromJson(exception.response?.data);
        throw SomethingWentWrong(errorResponseModel.msg);
      }
    } catch (e) {
      throw SomethingWentWrong(e.toString());
    }
  }
}
