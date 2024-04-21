import 'package:dio/dio.dart';

class ApiConstants {
  // static const String apiBaseUrl = "https://dev05.matrix-clouds.com/Tourist_Tour/public/api/";
  static const String apiBaseUrl = "https://tourist-t.com/api/";

  static const String login = "auth/login";
  static const String signup = "auth/register";
  static const String getProfile = "getProfile";
  static const String updateProfile = "updateProfile";
  static const String deleteProfile = "deleteProfile";
  static const String getCountryCode = "countries";
  static const String getTerms = "terms-and-conditions";
  static const String getSliders = "getSliders";
  static const String getPrograms = "getProgramsPaginate";
  static const String getOffers = "getOffers";
  static const String getPlaces = "getDestinationPaginate";
  static const String getFavoriteProgram = "getWishlist";
  static const String getBookingProgram = "getBookingPrograms";
  static const String getCompletedProgram = "getFinishPrograms";
  static const String getCanceledProgram = "getCancelPrograms";
  static const String bookProgram = "bookingProgram";
  static const String cancelProgram = "cancelProgram";
  static const String finishProgram = "finishProgram";
  static const String getFavoritePlaces = "getfavoriteplaces";
  static const String searchPlaces = "search";
  static const String notification = "notifacations";
  static const String history = "getProgramsHistory";
  static const String payment = "SavePayment";
  static const String rating = "rating";

  //More
  static const String getAbout = "about-us";
  static const String getPrivacy= "privacy";
  static const String changePassword= "changePassword";
//Make Program
  static const String places= "getplaces";
  static const String makeProgram= "makeProgram";


}

class ApiErrors {
  static const String badRequestError = "badRequestError";
  static const String noContent = "noContent";
  static const String forbiddenError = "forbiddenError";
  static const String unauthorizedError = "unauthorizedError";
  static const String notFoundError = "notFoundError";
  static const String conflictError = "conflictError";
  static const String internalServerError = "internalServerError";
  static const String unknownError = "unknownError";
  static const String timeoutError = "timeoutError";
  static const String defaultError = "defaultError";
  static const String cacheError = "cacheError";
  static const String noInternetError = "noInternetError";
  static const String loadingMessage = "loading_message";
  static const String retryAgainMessage = "retry_again_message";
  static const String ok = "Ok";
}
