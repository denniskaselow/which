which [![pub package](http://img.shields.io/pub/v/which.svg)](https://pub.dartlang.org/packages/which) [![Build Status](https://drone.io/github.com/seaneagan/which.dart/status.png)](https://drone.io/github.com/seaneagan/which.dart/latest) [![Coverage Status](https://img.shields.io/coveralls/seaneagan/which.dart.svg)](https://coveralls.io/r/seaneagan/which.dart?branch=master)
=====

Like the which(1) unix command.  Check for and locate installed executables.

## Install

```shell
pub global activate den
den install which
```

## Usage

```dart
import 'dart:io';

import 'package:which/which.dart';

main(arguments) async {

  // Asynchronously
  var git = await which('git', orElse: () => null);

  // Or synchronously
  var git = whichSync('git', orElse: () => null);

  if (git == null) {
    print('Please install git and try again');
    exit(1);
  }

  await Process.run(git, ['add', '-A']);
  await Process.run(git, ['commit', '-m', arguments.first]);
}
```
