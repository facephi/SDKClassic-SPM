class SelphIDTestType {

  final _value;
  const SelphIDTestType._internal(this._value);
  toString() => '$_value';

  static const TT_FILE = const SelphIDTestType._internal('File');
  static const TT_BASE64 = const SelphIDTestType._internal('Base64');
}