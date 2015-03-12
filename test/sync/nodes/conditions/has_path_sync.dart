part of behaviour_tree.test;

class HasPathSync implements ConditionSync {

  bool process(Map<String, dynamic> blackboard) {

    if (blackboard['path'] != null)
      return true;
    
    return false;
  }

}