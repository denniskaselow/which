// Copyright (c) 2015, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

library which.test.candidate_paths;

import 'package:unittest/unittest.dart';

import 'util.dart';

main() {
  group('getCandidatePaths', () {
    test('posix', () {
      var candidatePaths = getPosixCandidatePaths('z', '/x/y:/a/b/c', '/foo/bar');
      expect(candidatePaths, ['/x/y/z', '/a/b/c/z']);
    });

    test('windows', () {
      var candidatePaths = getWindowsCandidatePaths('z', r'C:\x\y;C:\a\b\c', '.EXE;.BAT', r'C:\foo\bar');
      expect(candidatePaths, [
        r'C:\foo\bar\z.EXE',
        r'C:\foo\bar\z.BAT',
        r'C:\x\y\z.EXE',
        r'C:\x\y\z.BAT',
        r'C:\a\b\c\z.EXE',
        r'C:\a\b\c\z.BAT']);
    });
  });
}
