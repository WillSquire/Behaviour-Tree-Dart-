part of behaviour_tree.test;

class HasPath implements Condition {

  bool process(Map<String, dynamic> blackboard) {

    if (blackboard['path'] != null)
      return true;
    
    return false;
  }

}