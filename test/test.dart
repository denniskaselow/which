
library which.test;

import 'test_candidate_paths.dart' as candidate_paths;
import 'test_has_permission.dart' as has_permission;
import 'test_is_executable.dart' as is_exe;
import 'test_which.dart' as which;
import 'test_which_impl.dart' as which_impl;

main() {
  candidate_paths.main();
  has_permission.main();
  is_exe.main();
  which.main();
  which_impl.main();
}
