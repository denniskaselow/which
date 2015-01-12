
library which;

import 'dart:async';
import 'dart:io';

import 'src/candidate_paths.dart';
import 'src/is_executable.dart';
import 'src/which_impl.dart' as impl;

Future<String> which(String command) => new Future(() =>
    impl.which(command, getRealCandidatePaths(command), Platform.isWindows, (path, isWindows) => isExecutable(path, isWindows, FileStat.stat)));

String whichSync(String command) =>
    impl.whichSync(command, getRealCandidatePaths(command), Platform.isWindows, (path, isWindows) => isExecutableSync(path, isWindows, FileStat.statSync));
