which [![pub package](http://img.shields.io/pub/v/which.svg)](https://pub.dartlang.org/packages/which) [![Build Status](https://travis-ci.org/dart-lang/which.svg?branch=master)](https://travis-ci.org/dart-lang/which) [![Coverage Status](https://coveralls.io/repos/dart-lang/which/badge.svg)](https://coveralls.io/r/dart-lang/which)
=====

Check for and locate installed executables.  Just like unix [which(1)][unix_which], except:

* Doesn't shell out (fast).
* Cross-platform (works on windows).  

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

[unix_which]: http://en.wikipedia.org/wiki/Which_%28Unix%29
