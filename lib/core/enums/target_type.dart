enum TargetType {
  subject('App\\Models\\Subject'),
  lesson('App\\Models\\Lesson'),
  category('App\\Models\\Category');

  const TargetType(this.value);

  final String value;
}
