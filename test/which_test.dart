// Copyright (c) 2015, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

library which.test.which;

import 'package:path/path.dart';
import 'package:unittest/unittest.dart';
import 'package:which/which.dart';

main() {
  group('which', () {
    // Any dart:io supported platform (*nix, osx, windows) should have `find`.
    test('should find `find`', () => which('find').then(_testResult));
  });

  group('whichSync', () {
    // Any dart:io supported platform (*nix, osx, windows) should have `find`.
    test('should find `find`', () {
      _testResult(whichSync('find'));
    });
  });
}

_testResult(String path) {
  expect(path, isNotNull);
  var base = basenameWithoutExtension(path);
  expect(base, 'find');
}
