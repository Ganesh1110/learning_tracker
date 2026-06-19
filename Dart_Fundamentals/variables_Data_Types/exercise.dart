// #### 🏋️ Mini Exercises

// - [ ] Create variables for: name, age, height, isStudent, score
// - [ ] Try to reassign a `final` variable — observe the error
// - [ ] Try to reassign a `const` variable — observe the error
// - [ ] Create a `late` String, print it before assigning — observe the LateInitializationError
// - [ ] Use `var` for 5 variables and verify inferred types using the IDE tooltip

void main() {
  // -- Explicitly-typed variables --

  // late: declared now, assigned later (must be assigned before use).
  late String userName;

  // Standard type annotations.
  String name = "Test User";
  int age = 20;
  double height = 150.5;
  bool isStudent = true;
  double score = 75.5;

  print('\n');
  print(
    'name: $name, age: $age, height: $height, isStudent: $isStudent , score: $score ',
  );
  print('\n--------------------\n');

  // -- final (runtime constant, set-once) --

  final now = DateTime.now();
  // ERROR: now = "String";   // Can't reassign a final variable.
  print(now);
  print('\n');

  // -- const (compile-time constant) --

  const color = "#FFFFFF";
  // ERROR: color = 12;       // Can't reassign a const variable.
  print(color);
  print('\n');

  // -- late — actually using it --

  // userName hasn't been assigned yet at line above; this would crash
  // if uncommented:
  // print(userName);
  userName = name; // Now it's safe to use.
  print(userName);
  print('\n');

  // -- var (type inferred from initialiser) --

  var char = "name"; // inferred String
  var ph = 1232312332321; // inferred int
  var weight = 89.23; // inferred double
  var isRed = false; // inferred bool
  var aged = 12; // inferred int
}
