void main() {
  // ── int ──
  int age = 25;
  int hex = 0xDEADBE;

  // ── double ──
  double pi = 3.14;
  double scientific = 1.5e4;

  // ── String ──
  String name = 'Alice';
  String greeting = "Hello, $name!";
  String multi = '''line1
line2''';

  // ── bool ──
  bool isRaining = false;
  bool isSunny = true;

  // ── var (type inference — inferred once, then fixed) ──
  var count = 10; // inferred int
  var price = 19.99; // inferred double
  var label = 'Price'; // inferred String
  // count = 'hello';  // ❌ error: int != String

  // ── dynamic (opt-out of type checking) ──
  dynamic anything = 42;
  anything = 'now a string';
  anything = true;
  // anything.length;  // compiles when String, crashes at runtime if int

  // ── Object (root type — safe, needs cast) ──
  Object obj = 42;
  obj = 'hello';
  // obj.length;       // ❌ compile error: Object has no .length
  (obj as String).length; // ✅ explicit cast required

  // ── Null safety (? makes it nullable) ──
  int? nullableAge; // null by default
  // int nonNullable = null;  // ❌ compile error

  // ── final (single-assignment, runtime value) ──
  final now = DateTime.now(); // runtime
  // now = someOtherTime;     // ❌ can't reassign

  // ── const (compile-time constant, deeply immutable) ──
  const gravity = 9.81; // known before the program runs
  const primes = [2, 3, 5, 7]; // deeply immutable
  // primes.add(11);              // ❌ compile error

  final mutablePrimes = [2, 3, 5, 7];
  mutablePrimes.add(11); // ✅ final ≠ immutable (contents can change)
  // mutablePrimes = [13];        // ❌ can't reassign final

  // ── late (deferred initialization / lazy evaluation) ──
  late String description; // declare now, assign later
  description = 'now assigned'; // ✅ must assign before first read

  late final int heavy = _compute(); // lazily computed, cached after
  // _compute() hasn't run yet — it runs on first access of `heavy`

  // ── Use the values (to suppress unused-variable warnings) ──
  print(age + hex + heavy);
  print(pi + scientific);
  print('$greeting $multi');
  print('$isRaining $isSunny');
  print('$count $price $label');
  print('$anything $obj $nullableAge');
  print('$now $gravity ${primes.length} ${mutablePrimes.length}');
  print(description);
}

int _compute() {
  print('  _compute() ran');
  return 42;
}
