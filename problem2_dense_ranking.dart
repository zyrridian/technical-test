List<int> denseRanking(List<int> leaderboard, List<int> gitsScores) {
  final unique = <int>[];
  for (final s in leaderboard) {
    if (unique.isEmpty || unique.last != s) unique.add(s);
  }

  final ranks = <int>[];
  for (final score in gitsScores) {
    var low = 0;
    var high = unique.length;
    while (low < high) {
      final mid = (low + high) ~/ 2;
      if (unique[mid] > score) {
        low = mid + 1;
      } else {
        high = mid;
      }
    }
    ranks.add(low + 1);
  }
  return ranks;
}

void main() {
  print(
    denseRanking([100, 100, 50, 40, 40, 20, 10], [5, 25, 50, 120]).join(' '),
  );
  print(denseRanking([100, 80, 80, 70], [60, 70, 100]).join(' '));
  print(denseRanking([90, 90, 90], [90, 100, 10]).join(' '));
}
