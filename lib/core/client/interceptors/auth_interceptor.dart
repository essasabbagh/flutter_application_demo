import 'package:dio/dio.dart';

// final secureStorage = locator<SecureStorageService>();

class AuthInterceptor extends Interceptor {
  AuthInterceptor();

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    // 'Authorization': 'Bearer ${secureStorage.read()}'

    // var expiration = await TokenRepository().getAccessTokenRemainingTime();

    // if (expiration.inSeconds < 60) {
    //   dio.interceptors.requestLock.lock();

    //   // Call the refresh endpoint to get a new token
    //   await UserService().refresh().then((response) async {
    //     await TokenRepository().persistAccessToken(response.accessToken);
    //     accessToken = response.accessToken;
    //   }).catchError((error, stackTrace) {
    //     handler.reject(error, true);
    //   }).whenComplete(() => dio.interceptors.requestLock.unlock());
    // }
    
    // final accessToken = await secureStorage.read();

    // final token = accessToken.isEmpty ? defaultToken : accessToken;

    // options.headers['Authorization'] = 'Bearer $token';

    return handler.next(options);
  }
}
