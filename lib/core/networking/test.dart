import 'package:dio/dio.dart';

class ApiResponseInterceptor extends Interceptor {

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    // Check if response indicates an error

    try {
      // Make your Dio request here
    } on DioError catch (e) {
      if (e.response != null) {
        // The request was made and the server responded with a status code
        print("Server responded with status code: ${e.response!.statusCode}");
        print("Response data: ${e.response!.data}");
        // Extract the error message from the response
        String errorMessage = e.response!.data["message"];
        print("Error message: $errorMessage");
        // Handle the error based on the error message
      } else {
        // Something went wrong in making the request
        print("Error: ${e.message}");
      }
    }
    if (response.statusCode != 200) {
      // Handle error response
      // You can implement your error handling logic here
      print('Error ${response.statusCode}: ${response.statusMessage}');
    } else {
      // Response is successful, continue as usual
      super.onResponse(response, handler);
    }
  }

}
