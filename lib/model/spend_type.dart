enum SpendType {
  all,
  income,
  consumption,
  investent,
}

extension SpendTypeExtension on SpendType {
  String get title {
    switch (this) {
      case SpendType.all:
        return '전체 내역';
      case SpendType.income:
        return "수입";
      case SpendType.consumption:
        return "지출";
      case SpendType.investent:
        return "투자";
      default:
        throw new FormatException("unexpected case");
    }
  }
}
