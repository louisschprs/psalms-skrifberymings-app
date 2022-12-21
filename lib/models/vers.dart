class Vers {
  int _nommer = 0;
  String _text = "Geen Vers";

  Vers(int nommer, String text) {
    _nommer = nommer;
    _text = text;
  }

  int get nommer => _nommer;
  String get text => _text;

  factory Vers.mock({int nommer = 1}) {
    return Vers(nommer,
        "Welsalig hy wat op die spoor nie gaan \nwaar sondaars lok; wat op hul pad nie staan, \nof neersit waar die spotglans in die oog is, \nwaar spotters vrolik spot met al wat hoog is; \nmaar wat Gods wet in stille mymering, \nby dag en nag, weer in gedagt'nis bring.");
  }
}
