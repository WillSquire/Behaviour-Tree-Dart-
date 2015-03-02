part of behaviour_tree.test;

class IsPathToFilePath implements Condition {

  String filePath = 'path/to/file';

  bool process(Map<String, dynamic> blackboard) {

    if (blackboard['path'] == filePath) {
      return true;
    }

    return false;
  }

}