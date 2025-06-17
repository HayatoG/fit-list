class WeekDay {
  final String name;
  final String shortName;
  final int index;

  const WeekDay({
    required this.name,
    required this.shortName,
    required this.index,
  });
}

const List<WeekDay> weekDays = [
  WeekDay(name: 'Monday', shortName: 'Mon', index: 1),
  WeekDay(name: 'Tuesday', shortName: 'Tue', index: 2),
  WeekDay(name: 'Wednesday', shortName: 'Wed', index: 3),
  WeekDay(name: 'Thursday', shortName: 'Thu', index: 4),
  WeekDay(name: 'Friday', shortName: 'Fri', index: 5),
  WeekDay(name: 'Saturday', shortName: 'Sat', index: 6),
  WeekDay(name: 'Sunday', shortName: 'Sun', index: 7),
];
