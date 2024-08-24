class EthiopianDateConverter {
  static const List<int> ethiopianMonthsDays = [
    30, 30, 30, 30, 30, 30, 30, 30, 30, 30, 30, 30, 5
  ]; // 30 days each month, 5/6 days in the 13th month

  static Map<String, dynamic> fromGregorian(DateTime date) {
    int gregorianYear = date.year;

    int ethiopianYear;
    int ethiopianMonth;
    int ethiopianDay;

    // Ethiopian New Year usually starts on September 11th (or 12th in a leap year)
    DateTime ethiopianNewYearStart = DateTime(gregorianYear, 9, 11);
    if (isLeapYear(gregorianYear)) {
      ethiopianNewYearStart = DateTime(gregorianYear, 9, 12);
    }

    // Calculate the Ethiopian year
    if (date.isBefore(ethiopianNewYearStart)) {
      ethiopianYear = gregorianYear - 8;
      ethiopianNewYearStart = DateTime(gregorianYear - 1, 9, 11);
      if (isLeapYear(gregorianYear - 1)) {
        ethiopianNewYearStart = DateTime(gregorianYear - 1, 9, 12);
      }
    } else {
      ethiopianYear = gregorianYear - 7;
    }

    int daysSinceEthiopianNewYear = date.difference(ethiopianNewYearStart).inDays;

    // Determine the Ethiopian month and day
    int month = 0;
    int dayCounter = daysSinceEthiopianNewYear;
    for (int i = 0; i < ethiopianMonthsDays.length; i++) {
      if (dayCounter < ethiopianMonthsDays[i]) {
        month = i + 1;
        break;
      }
      dayCounter -= ethiopianMonthsDays[i];
    }

    ethiopianMonth = month;
    ethiopianDay = dayCounter + 1;

    return {
      'year': ethiopianYear,
      'month': ethiopianMonth,
      'day': ethiopianDay
    };
  }

  static bool isLeapYear(int year) {
    return (year % 4 == 3);
  }
}
