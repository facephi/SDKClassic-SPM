import 'package:tracking_plugin/tracking.dart';
import 'package:chopper/chopper.dart';
part 'tracking_service.chopper.dart';

@ChopperApi()
abstract class TrackingService extends ChopperService{
  static TrackingService create([ChopperClient? client]) =>
      _$TrackingService(client);

  @Post(path: 'tracking/events')
  Future<Response<String>> postEvent(@Body() String event);
}