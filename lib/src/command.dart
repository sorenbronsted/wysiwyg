
part of wysiwyg.base;

class Command {
  String _name;
  String _cmdName;
  
  Command(String this._name, [String this._cmdName]);
  
  void exec() {
    if (_cmdName != null) {
      document.execCommand(_cmdName, false, _name);
    }
    else {
      document.execCommand(_name, false, '');
    }
  }
}
