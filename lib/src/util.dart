// Copyright (c) 2015, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

library which.src.util;

import 'dart:async';

/// Transparently call `firstWhere` on a [Stream] or [Iterable].
// TODO: Remove once https://dartbug.com/22028 is fixed.
firstWhere(sequence, test, { orElse() }) => sequence is Iterable ?
  sequence.firstWhere(test, orElse: orElse) :
    _streamFirstWhere(sequence, test, orElse: orElse);

Future _streamFirstWhere(Stream stream, test(item), { orElse() }) {
  var pairs = stream.asyncMap((item) => test(item).then((result) => [item, result]));
  return pairs.firstWhere((pair) => pair.last, defaultValue: () => [orElse(), null]).then((pair) => pair.first);
}

/// The identity function simply returns its argument ([x]).
identity(x) => x;
