part of behaviour_tree.test;

class IsPathIndex implements Condition {
  
  String filePath = 'index';

  Future<bool> process(Map<String, dynamic> blackboard) {
    
    if (blackboard['path'] == filePath)
      return new Future(() => true);
    
    return new Future(() => false);
  }

}