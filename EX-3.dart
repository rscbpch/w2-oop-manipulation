class Duration {
  final int _milliseconds;

  const Duration(this._milliseconds)
      : assert(_milliseconds > 0, 'Duration must be positive');

  const Duration.fromHour(int hours)
      : assert(hours > 0, 'Hours must be positive'),
        _milliseconds = hours * 60 * 60 * 1000;

  const Duration.fromMinute(int minute)
      : assert(minute > 0, 'Minutes must be positive'),
        _milliseconds = minute * 60 * 1000;

  const Duration.fromSecond(int second)
      : assert(second > 0, 'Seconds must be positive'),
        _milliseconds = second * 1000;

  int get milliseconds => _milliseconds;

  bool operator >(Duration other) => _milliseconds > other._milliseconds;

  Duration operator +(Duration other) {
    return Duration(_milliseconds + other._milliseconds);
  }

  Duration operator -(Duration other) {
    if (_milliseconds - other._milliseconds < 0) {
      throw ('The result cannot be negative');
    }
    return Duration(_milliseconds - other._milliseconds); 
  }

  @override
  String toString() {
    return '${_milliseconds}ms';
  }
}

void main() {
  const d1 = Duration.fromMinute(1);
  const d2 = Duration(3580);

  print('Sum: ${d1 + d2}');
  print('Sub: ${d1 - d2}');
}