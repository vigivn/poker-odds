import 'package:poker_odds/core/combo.dart';
import 'package:test/test.dart';

main() {
  test("combo type (different types)", () {
    final compare =
        Combo(ComboType.Flush, 8, 9).compareTo(Combo(ComboType.Pair, 2, 5));
    expect(compare, 1);
  });

  test("combo type (different value)", () {
    final compare =
        Combo(ComboType.Pair, 8, 9).compareTo(Combo(ComboType.Pair, 2, 5));
    expect(compare, 1);
  });

  test("combo type (different kicker)", () {
    final compare =
        Combo(ComboType.Pair, 8, 9).compareTo(Combo(ComboType.Pair, 8, 14));
    expect(compare, -1);
  });

  test("tie", () {
    final compare =
        Combo(ComboType.Pair, 8, 9).compareTo(Combo(ComboType.Pair, 8, 9));
    expect(compare, 0);
  });
}
