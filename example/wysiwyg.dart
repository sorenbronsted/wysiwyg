// Copyright (c) 2015, <your name>. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

library wysiwyg.example;

import 'package:wysiwyg/wysiwyg.dart';
import 'dart:html';

main() {
  var editor = new Wysiwyg(querySelector('#toolbar'), querySelector('#content'));
  editor.html = '<p>This a story from the hot countries...</p>';
  querySelector('#dumpHtml').onClick.listen((_) => print(editor.html));
}
