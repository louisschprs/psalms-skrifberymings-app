enum SangTipe {
  psalm,
  skrifBeryming,
}

extension SangTipeText on SangTipe {
  String get text {
    switch (this) {
      case SangTipe.psalm:
        return 'Psalm';
      case SangTipe.skrifBeryming:
        return 'Skrifberyming';
      default:
        return "Geen";
    }
  }
}
