class Vers {
  int _nommer = 0;
  String _text = "Geen Vers";

  Vers(int nommer, String text) {
    this._nommer = nommer;
    this._text = text;
  }

  int get nommer => _nommer;
  String get text => _text;
}
