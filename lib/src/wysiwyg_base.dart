// Copyright (c) 2015, Søren Brønsted. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

library wysiwyg.base;

import 'dart:html';

part 'command.dart';

class Wysiwyg {
  DivElement _toolbar;
  DivElement _editArea;
  
  static List<Command> commands = [
    new Command('bold'),
    new Command('italic'),
    new Command('strikethrough'),
    new Command('underline'),
    new Command('subscript'),
    new Command('superscript'),
    new Command('h1', 'formatblock'),
    new Command('h2', 'formatblock'),
    new Command('h3', 'formatblock'),
    new Command('h4', 'formatblock'),
    new Command('h5', 'formatblock'),
    new Command('h6', 'formatblock'),
    new Command('p', 'formatblock'),
    new Command('blockquote', 'formatblock'),
  ];

  /// You must provide a some input type buttons or select types in the 
  /// toolbar div and a div for the content.
  Wysiwyg(DivElement this._toolbar, DivElement this._editArea) {
    _editArea.contentEditable = 'true';
    _bindCommands();
  }

  String get html               => _editArea.innerHtml;
  void   set html(String text)  => _editArea.appendHtml(text);

  void _bindCommands() {
    _toolbar.querySelectorAll('input').forEach((elem) {
      elem.onClick.listen((event) {
        _execute(event.target);
      });
    });
    _toolbar.querySelectorAll('select').forEach((elem) {
      elem.onChange.listen((event) {
        _execute(event.target);
      });
    });
  }
  
  void _execute(Element element) {
    var value;
    
    if (element is InputElement) {
      value = (element as InputElement).value;
    }
    else if (element is SelectElement) {
      value = (element as SelectElement).value;
    }
    if (value != null) {
      var command = commands.firstWhere((cmd) => value == cmd._name , orElse: () => null);
      if (command != null) {
        command.exec();
      }
    }
  }
}
