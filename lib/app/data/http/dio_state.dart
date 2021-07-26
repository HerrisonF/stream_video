import 'package:dio/dio.dart';

enum State { OK, BAD_REQUEST, UNAUTHORIZED }

class DioState {
  final State state;
  final Response result;
  DioState(this.state, this.result);
}
