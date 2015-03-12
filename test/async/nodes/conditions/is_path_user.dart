part of behaviour_tree.test;

class IsPathUser implements Condition {
  
  String filePath = 'user';

  Future<bool> process(Map<String, dynamic> blackboard) {
    
    if (blackboard['path'] == filePath)
      return new Future(() => true);
    
    return new Future(() => false);
  }

}