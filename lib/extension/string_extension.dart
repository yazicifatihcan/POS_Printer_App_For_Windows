

//POS printers are not able to work with the charachters below. With this extension we 
//gonna prevent special character error.
extension SpecialCharacterRemover on String {
static const diacritics = 'ÀÁÂÃÄÅàáâãäåÒÓÔÕÕÖØòóôõöøÈÉÊËèéêëðÇçÐÌÍÎÏİìíîïÙÚÛÜùúûüÑñŠšŸÿýŽžıŞşĞğ';
static const nonDiacritics = 'AAAAAAaaaaaaOOOOOOOooooooEEEEeeeeeCcDIIIIiiiiiUUUUuuuuNnSsYyyZziSsGg';
String get withoutDiacriticalMarks => splitMapJoin('',
onNonMatch: (char) =>
char.isNotEmpty && diacritics.contains(char) ? nonDiacritics[diacritics.indexOf(char)] : char);
}