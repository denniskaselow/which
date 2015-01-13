
library which.bin.which;

import 'dart:io';

import 'package:which/which.dart';
import 'package:unscripted/unscripted.dart';

main(arguments) => declare(whichCommand).execute(arguments);

@Command(help: 'Like unix which(1). Find the first instance of an executable on the PATH.')
whichCommand(
    @Positional(help: 'The command to search for.')
    String command) => which(command).then(print, onError: (e) {
      print(e);
      exit(1);
    });