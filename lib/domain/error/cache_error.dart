import 'package:quizapp/domain/error/failure.dart';

enum CacheErrorType{
  cacheError,
  unknownError
}

class CacheError implements Failure<CacheErrorType>{
  @override
  CacheErrorType getErrorType() {
    return CacheErrorType.cacheError;
  }

}