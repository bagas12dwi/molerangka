class Helper {
  static String getFirstText(String text) {
    String textFirst = text;
    List<String> output = textFirst.split(" ");
    return output[0];
  }
}