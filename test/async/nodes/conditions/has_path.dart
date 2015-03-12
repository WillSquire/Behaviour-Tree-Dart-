part of behaviour_tree.test;

class HasPath implements Condition {

  Future<bool> process(Map<String, dynamic> blackboard) {

    if (blackboard['path'] != null)
      return new Future(() => true);
    
    return new Future(() => false);
  }

}