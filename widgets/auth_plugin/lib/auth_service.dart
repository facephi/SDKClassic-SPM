import 'package:auth_plugin/auth.dart';
import 'package:chopper/chopper.dart';
part 'auth_service.chopper.dart';

@ChopperApi()
abstract class AuthService extends ChopperService{
  static AuthService create([ChopperClient? client]) =>
      _$AuthService(client);

  @Post(path: 'realms/inphinite/protocol/openid-connect/token')
  Future<Response<String>> getToken(@Field() String scope, @Field() String grant_type);
}