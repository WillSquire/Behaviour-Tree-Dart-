part of behaviour_tree.test;

class HasPath implements Condition {

  bool process(dynamic blackboard) {

    if (blackboard['path'] != null)
      return true;
    
    return false;
  }

}