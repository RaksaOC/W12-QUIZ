class Distance {
  // assuming its in metre
  final double _distance;

  Distance(this._distance);

  Distance.m(this._distance);

  Distance.km(double distance) : this._distance = distance * 1000;

  Distance.cm(double distance) : this._distance = distance / 100;

  Distance operator +(Distance other) {
    return Distance.m(this._distance + other._distance);
  }

  double get km => _distance / 1000;
  double get m => _distance;
  double get cm => _distance * 100;
}

main() {
  Distance d1 = Distance.km(3.4);
  Distance d2 = Distance.cm(100);
  print((d1 + d2).km);
}
