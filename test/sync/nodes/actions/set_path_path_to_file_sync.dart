part of behaviour_tree.test;

class SetPathPathToFileSync implements ActionSync {

  bool process(Map<String, dynamic> blackboard) {

    blackboard['path'] = 'path/to/file';
    return true;

  }

}