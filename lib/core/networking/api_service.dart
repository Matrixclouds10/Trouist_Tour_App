import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:tourist_tour_app/core/networking/api_constants.dart';
import 'package:tourist_tour_app/core/networking/api_response.dart';
import 'package:tourist_tour_app/feature/auth/login/data/models/login_request_body.dart';
import 'package:tourist_tour_app/feature/auth/login/data/models/login_response.dart';
import 'package:tourist_tour_app/feature/auth/sign_up/data/models/country_code_response.dart';
import 'package:tourist_tour_app/feature/auth/sign_up/data/models/sign_up_request_body.dart';
import 'package:tourist_tour_app/feature/auth/sign_up/data/models/sign_up_response.dart';
import 'package:tourist_tour_app/feature/auth/sign_up/data/models/terms_response.dart';
import 'package:tourist_tour_app/feature/booking/data/models/booking_request.dart';
import 'package:tourist_tour_app/feature/booking/data/models/booking_response.dart';
import 'package:tourist_tour_app/feature/booking/data/models/canceled_request.dart';
import 'package:tourist_tour_app/feature/home/data/models/program_response.dart';
import 'package:tourist_tour_app/feature/home/data/models/sliders_response.dart';
import 'package:tourist_tour_app/feature/home/data/models/tourist_places_response.dart';
import 'package:tourist_tour_app/feature/more/data/models/about_us_response.dart';
import 'package:tourist_tour_app/feature/more/data/models/profile_response.dart';
import 'package:tourist_tour_app/feature/more/data/models/update_profile_request.dart';


part 'api_service.g.dart';

@RestApi(baseUrl: ApiConstants.apiBaseUrl)
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  //Auth
  @POST(ApiConstants.login)
  Future<LoginResponse> login(
    @Body() LoginRequestBody loginRequestBody,
  );
  @POST(ApiConstants.signup)
  Future<SignupResponse> signup(
    @Body() SignupRequestBody signupRequestBody,
  );

  @GET(ApiConstants.getCountryCode)
  Future<ApiResponse<List<CountryResponse>>> getCountryCode(
      @Header('Accept-Language') String acceptLanguage
      );

  @GET(ApiConstants.getTerms)
  Future<ApiResponse<TermsResponse>> getTerms(
      @Header('Accept-Language') String acceptLanguage
      );

  @GET(ApiConstants.getProfile)
  Future<ApiResponse<ProfileResponse>> getProfile(
      @Header('Authorization') String token
      );

  @POST(ApiConstants.updateProfile)
  Future<ApiResponse> updateProfile(
      @Header('Authorization') String token,
      @Body() UpdateProfileRequest updateProfileRequest,
      );
  @POST(ApiConstants.deleteProfile)
  Future<ApiResponse> deleteProfile(
      @Header('Authorization') String token,
      );



  //Home
  @GET(ApiConstants.getSliders)
  Future<ApiResponse<List<SlidersResponse>>> getSliders();

  @GET(ApiConstants.getPrograms)
  Future<ApiResponse<List<ProgramResponse>>> getPrograms(
      @Header('Accept-Language') String acceptLanguage
      );

  @GET(ApiConstants.getOffers)
  Future<ApiResponse<List<ProgramResponse>>> getOffers(
      @Header('Accept-Language') String acceptLanguage
      );

  @GET(ApiConstants.getPlaces)
  Future<ApiResponse<List<TouristPlaceResponse>>> getTouristPlaces(
      @Header('Accept-Language') String acceptLanguage
      );

 //Favorite
  @GET(ApiConstants.getFavoriteProgram)
  Future<ApiResponse<List<ProgramResponse>>> getFavoriteProgram(
      @Header('Authorization') String token,
      @Header('Accept-Language') String acceptLanguage
      );

  @GET("https://dev05.matrix-clouds.com/Tourist_Tour/public/api/add_remove_wishlist/{id}") // Assuming 'id' is the dynamic part of the URL
  Future<ApiResponse> addFavoriteProgram(
      @Path('id') int id, // Use @Path to specify the dynamic part of the URL
      @Header('Authorization') String token,
      );
//Booking
  @GET(ApiConstants.getBookingProgram)
  Future<ApiResponse<List<BookingResponse>>> getBookingProgram(
      @Header('Authorization') String token,
      @Header('Accept-Language') String acceptLanguage
      );

 @GET(ApiConstants.getCanceledProgram)
  Future<ApiResponse<List<BookingResponse>>> getCanceledPrograms(
      @Header('Authorization') String token,
      @Header('Accept-Language') String acceptLanguage
      );

 @POST(ApiConstants.bookProgram)
  Future<ApiResponse> bookingPrograms(
      @Header('Authorization') String token,
      @Body()BookingRequest bookingRequest
      );
 @POST(ApiConstants.cancelProgram)
  Future<ApiResponse> cancelingProgram(
      @Header('Authorization') String token,
      @Body()CanceledRequest canceledRequest
      );




  //More
  @GET(ApiConstants.getAbout)
  Future<ApiResponse<AboutUsResponse>> getAboutUs(
      @Header('Accept-Language') String acceptLanguage
      );


  @GET(ApiConstants.getTerms)
  Future<ApiResponse<AboutUsResponse>> getTermsApp(
      @Header('Accept-Language') String acceptLanguage
      );

  @GET(ApiConstants.getPrivacy)
  Future<ApiResponse<AboutUsResponse>> getPrivacy(
      @Header('Accept-Language') String acceptLanguage
      );


}
