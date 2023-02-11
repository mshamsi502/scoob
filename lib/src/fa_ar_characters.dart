import 'dart:convert';

// --------------------------------------------
const List<int> ALEF_FA = [216, 167]; //arabic: ا
// dec: 216, 167 , hex: D8, A7

const List<int> ALEF_AR_01 = [216, 162]; // آ :arabic
// dec: 216, 162 , hex: D8, A2

const List<int> ALEF_AR_02 = [216, 163]; // arabic:	أ
// dec: 216, 163 , hex: D8, A3

const List<int> ALEF_AR_03 = [216, 165]; // arabic: إ
// dec: 216, 165 , hex: D8, A5

const List<int> ALEF_AR_04 = [217, 177]; // arabic: ٱ
// dec: 217, 177 , hex: D9, B1

// --------------------------------------------
const List<int> YE_FA = [219, 140]; // ی :farsi
// dec: 219, 140 , hex: DB, 8C

const List<int> YE_AR_01 = [217, 138]; //arabic: ي
// dec: 217, 138 , hex: D9, 8A

const List<int> YE_AR_02 = [216, 166]; //arabic: ئ
// dec: 216, 166 , hex: D8, A6

const List<int> YE_AR_03 = [217, 137]; //arabic: ى
// dec: 217, 137 , hex: D9, 89
// --------------------------------------------
const List<int> VAV_FA = [217, 136]; // و :arabic
// dec: 217, 136 , hex: D9, 88

const List<int> VAV_AR_01 = [216, 164]; //arabic: ؤ
// dec: 216, 164 , hex: D8, A4

// --------------------------------------------
const List<int> KAF_FA = [218, 169]; // ک :farsi
// dec: 218, 169 , hex: D8, DA

const List<int> KAF_AR_01 = [217, 131]; //arabic: ك
// dec: 217, 131 , hex: D9, 83

// --------------------------------------------

String arabicToPersianCharacter(String text) {
  text = checkALEF(text);
  text = checkYE(text);
  text = checkVAV(text);
  text = checkKAF(text);

  return text;
}

String checkALEF(String text) {
  for (var i = 0; i < text.length; i++) {
    if (((utf8.encode(text[i])).elementAt(0) == ALEF_AR_01.elementAt(0) &&
            (utf8.encode(text[i])).elementAt(1) == ALEF_AR_01.elementAt(1)) ||
        ((utf8.encode(text[i])).elementAt(0) == ALEF_AR_02.elementAt(0) &&
            (utf8.encode(text[i])).elementAt(1) == ALEF_AR_02.elementAt(1)) ||
        ((utf8.encode(text[i])).elementAt(0) == ALEF_AR_03.elementAt(0) &&
            (utf8.encode(text[i])).elementAt(1) == ALEF_AR_03.elementAt(1)) ||
        ((utf8.encode(text[i])).elementAt(0) == ALEF_AR_04.elementAt(0) &&
            (utf8.encode(text[i])).elementAt(1) == ALEF_AR_04.elementAt(1))) {
      text = text.substring(0, i) +
          utf8.decode([ALEF_FA.elementAt(0), ALEF_FA.elementAt(1)]) +
          text.substring(i + 1);
    }
  }
  return text;
}

String checkYE(String text) {
  for (var i = 0; i < text.length; i++) {
    if (((utf8.encode(text[i])).elementAt(0) == YE_AR_01.elementAt(0) &&
            (utf8.encode(text[i])).elementAt(1) == YE_AR_01.elementAt(1)) ||
        ((utf8.encode(text[i])).elementAt(0) == YE_AR_02.elementAt(0) &&
            (utf8.encode(text[i])).elementAt(1) == YE_AR_02.elementAt(1)) ||
        ((utf8.encode(text[i])).elementAt(0) == YE_AR_03.elementAt(0) &&
            (utf8.encode(text[i])).elementAt(1) == YE_AR_03.elementAt(1))) {
      text = text.substring(0, i) +
          utf8.decode([YE_FA.elementAt(0), YE_FA.elementAt(1)]) +
          text.substring(i + 1);
    }
  }
  return text;
}

String checkVAV(String text) {
  for (var i = 0; i < text.length; i++) {
    if (((utf8.encode(text[i])).elementAt(0) == VAV_AR_01.elementAt(0) &&
        (utf8.encode(text[i])).elementAt(1) == VAV_AR_01.elementAt(1))) {
      text = text.substring(0, i) +
          utf8.decode([VAV_FA.elementAt(0), VAV_FA.elementAt(1)]) +
          text.substring(i + 1);
    }
  }
  return text;
}

String checkKAF(String text) {
  for (var i = 0; i < text.length; i++) {
    if (((utf8.encode(text[i])).elementAt(0) == KAF_AR_01.elementAt(0) &&
        (utf8.encode(text[i])).elementAt(1) == KAF_AR_01.elementAt(1))) {
      text = text.substring(0, i) +
          utf8.decode([KAF_FA.elementAt(0), KAF_FA.elementAt(1)]) +
          text.substring(i + 1);
    }
  }
  return text;
}