
library which.test.is_executable;

import 'dart:io';

import 'package:mockito/mockito.dart';
import 'package:unittest/unittest.dart';
import 'package:which/src/is_executable.dart';

import 'util.dart';

main() {
  group('isExecutableStat', () {
    test('false if not a file', () {

      var stat = new MockFileStat();

      // A directory.
      when(stat.type).thenReturn(FileSystemEntityType.DIRECTORY);

      var result = isExecutableStat(stat, false);

      expect(result, isFalse);

      verifyNever(stat.mode);
    });

    test('true for all files on windows', () {

      var stat = new MockFileStat();

      // A file.
      when(stat.type).thenReturn(FileSystemEntityType.FILE);

      var result = isExecutableStat(stat, true);

      expect(result, isTrue);

      verifyNever(stat.mode);
    });

    test('true if has world execute permission', () {

      var stat = new MockFileStat();

      // A file.
      when(stat.type).thenReturn(FileSystemEntityType.FILE);

      // Last bit is world execute.
      when(stat.mode).thenReturn(int.parse('000000000001', radix: 2));

      var result = isExecutableStat(stat, false);

      expect(result, isTrue);
    });

    test('false if missing world execute permission', () {

      var stat = new MockFileStat();

      // A file.
      when(stat.type).thenReturn(FileSystemEntityType.FILE);

      // Last bit is world execute.
      when(stat.mode).thenReturn(int.parse('111111111110', radix: 2));

      var result = isExecutableStat(stat, false);

      expect(result, isFalse);
    });
  });
}
