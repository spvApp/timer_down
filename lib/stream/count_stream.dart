import 'package:timerdown/model/count.dart';

class CountStream {
  double _radius = 1;
  bool _isActive = true;
  late Duration _currentTime;
  late Duration _fullTime;

  Stream<Count> stream() async* {
    yield* Stream.periodic(Duration(seconds: 1), (int s) {
      if (_isActive) {
        _currentTime = _currentTime - Duration(seconds: 1);
        _radius = _currentTime.inSeconds / _fullTime.inSeconds;

        if (_currentTime.inSeconds <= 0) {
          _isActive = false;
        }
      }

      return Count(_currentTime.inSeconds.toString(), _radius);
    });
  }

  bool getActive() => _isActive;

  void start() {
    _isActive = true;
  }

  void stop() {
    _isActive = false;
  }

  void setTime(int senconds) {
    _currentTime = Duration(seconds: senconds);
    _fullTime = Duration(seconds: senconds);
  }

  void reset(){
    _currentTime = Duration(seconds: _fullTime.inSeconds);
  }
}
