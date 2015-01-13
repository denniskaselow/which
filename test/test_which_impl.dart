
library which.test.which_impl;

import 'dart:async';

import 'package:unittest/unittest.dart';
import 'package:which/src/which_impl.dart';

import 'util.dart';

main() {
  group('which', () {
    test('should find find', () {
      var candidatePaths = getPosixCandidatePaths('z', '/x/y:/a/b/c', '/foo/bar');

      return which('find', candidatePaths, false, (path, isWindows) => new Future.value(path == '/a/b/c/z'), null)
          .then((path) => expect(path, '/a/b/c/z'));
    });
  });

  group('whichSync', () {
    test('should find find', () {
      var candidatePaths = getWindowsCandidatePaths('z', r'C:\x\y;C:\a\b\c', '.EXE;.BAT', r'C:\foo\bar');

      var result = whichSync('find', candidatePaths, true, (path, isWindows) => path == r'C:\x\y\z.BAT', null);

      expect(result, r'C:\x\y\z.BAT');
    });
  });
}
