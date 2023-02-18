extension BoolExtension on bool {
  bool get isTrue => this == true;
  bool get isFalse => this == false;

  bool get isNotTrue => this != true;
  bool get isNotFalse => this != false;
}
