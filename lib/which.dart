// Copyright (c) 2015, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

library which;

import 'dart:async';
import 'dart:io';

import 'src/candidate_paths.dart';
import 'src/is_executable.dart';
import 'src/which_impl.dart' as impl;

/// Returns a future for the first [command] executable in the `PATH`.
///
/// If [command] is not found, [orElse] is called, which defaults to throwing.
Future<String> which(String command, { orElse() }) => new Future(() => impl.which(
    command,
    getRealCandidatePaths(command),
    Platform.isWindows,
    (path, isWindows) => isExecutable(path, isWindows, FileStat.stat),
    orElse));

/// Returns the first [command] executable in the `PATH`.
///
/// If [command] is not found, [orElse] is called, which defaults to throwing.
String whichSync(String command, { orElse() }) => impl.whichSync(
    command,
    getRealCandidatePaths(command),
    Platform.isWindows,
    (path, isWindows) => isExecutableSync(path, isWindows, FileStat.statSync),
    orElse);
