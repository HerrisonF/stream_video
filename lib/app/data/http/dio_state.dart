import 'package:dio/dio.dart';

enum State { OK, ERROR }

class DioState {
  final State state;
  final Response result;
  DioState(this.state, this.result);
}
