part of behaviour_tree.test;

class IsPathToFilePathSync implements ConditionSync {

  String filePath = 'path/to/file';

  bool process(Map<String, dynamic> blackboard) {

    if (blackboard['path'] == filePath) {
      return true;
    }

    return false;
  }

}