enum AppErrors {
  ignore(''),
  noUser('Given user does not exist');

  final String message;

  const AppErrors(this.message);
}
