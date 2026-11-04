String highestPalindrome(String s, int k) {
  if (k < 0 || s.isEmpty || !allDigits(s, 0)) return '-1';

  final mismatches = countMismatches(s, 0, s.length - 1);
  if (mismatches > k) return '-1';

  return buildPalindrome(s, 0, s.length - 1, k - mismatches);
}

bool allDigits(String s, int i) {
  if (i == s.length) return true;
  final code = s.codeUnitAt(i);
  if (code < 48 || code > 57) return false;
  return allDigits(s, i + 1);
}

int countMismatches(String s, int left, int right) {
  if (left >= right) return 0;
  final diff = s[left] != s[right] ? 1 : 0;
  return diff + countMismatches(s, left + 1, right - 1);
}

String buildPalindrome(String s, int left, int right, int remainingChanges) {
  if (left > right) return '';
  if (left == right) {
    return remainingChanges >= 1 ? '9' : s[left];
  }

  final a = s[left];
  final b = s[right];
  String digit;
  int nextSpare;

  if (a != b) {
    if (a == '9' || b == '9') {
      digit = '9';
      nextSpare = remainingChanges;
    } else if (remainingChanges >= 1) {
      digit = '9';
      nextSpare = remainingChanges - 1;
    } else {
      digit = a.compareTo(b) > 0 ? a : b;
      nextSpare = remainingChanges;
    }
  } else if (a != '9' && remainingChanges >= 2) {
    digit = '9';
    nextSpare = remainingChanges - 2;
  } else {
    digit = a;
    nextSpare = remainingChanges;
  }

  return digit + buildPalindrome(s, left + 1, right - 1, nextSpare) + digit;
}

void main() {
  print(highestPalindrome('3943', 1));
  print(highestPalindrome('932239', 2));
  print(highestPalindrome('1234', 3));
}
