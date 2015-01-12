
library which.src.which;

import 'dart:async';
import 'dart:io';

import 'package:when/when.dart';

import 'is_executable.dart';
import 'util.dart';

Future<String> which(String command, Iterable<String> candidatePaths, bool isWindows, Future<bool> isExecutable(String path, bool isWindows)) => new Future(() => _which(
    command,
    candidatePaths,
    isWindows,
    isExecutable,
    toSequence: (items) => new Stream.fromIterable(items)));

String whichSync(String command, Iterable<String> candidatePaths, bool isWindows, bool isExecutable(String path, bool isWindows)) => _which(
    command,
    candidatePaths,
    isWindows,
    isExecutable);

_which(String command, Iterable<String> candidatePaths, bool isWindows, isExecutable(String path, bool isWindows),
    {toSequence(Iterable items): identity}) => when(
    () => firstWhere(
        toSequence(candidatePaths),
        (path) => isExecutable(path, isWindows),
        orElse: () => _commandNotFound(command, null)),
    identity,
    onError: (e) => _commandNotFound(command, e));

_commandNotFound(String command, e) {
  var message = 'Command not found: $command';
  if (e != null) message += '\n$e';
  throw new StateError(message);
}
