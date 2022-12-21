import 'package:psalms_skrifberymings/src/enums/beryming.dart';
import 'package:psalms_skrifberymings/src/enums/sang_tipe.dart';
import 'package:psalms_skrifberymings/models/vers.dart';

class Sang {
  SangTipe _tipe = SangTipe.geen;
  String _naam = "Geen Naam";
  Beryming _beryming = Beryming.geen;
  List<Vers> _verse = [];

  Sang(SangTipe tipe, String naam, Beryming beryming, List<Vers> verse) {
    _tipe = tipe;
    _naam = naam;
    _beryming = beryming;
    _verse = verse;
  }

  String get naam => _naam;
  Beryming get beryming => _beryming;
  List<Vers> get verse => _verse;
  SangTipe get tipe => _tipe;

  factory Sang.fromJson() {
    throw UnimplementedError();
  }

  Map<String, dynamic> toJson() {
    throw UnimplementedError();
  }
}
