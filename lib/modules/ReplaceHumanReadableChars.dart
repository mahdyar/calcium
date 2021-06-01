String replaceHumanReadableChars(String input) {
  const english = ['×'];
  const farsi = ['*'];

  for (int i = 0; i < english.length; i++) {
    input = input.replaceAll(english[i], farsi[i]);
  }

  return input;
}
