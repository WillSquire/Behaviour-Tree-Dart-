part of behaviour_tree.test;

class SetPathPathToFile implements Action {

  bool process(Map<String, dynamic> blackboard) {

    blackboard['path'] = 'path/to/file';
    return true;

  }

}