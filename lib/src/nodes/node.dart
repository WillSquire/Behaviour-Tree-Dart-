part of behaviour_tree.base;

abstract class Node {

  /**
   * Takes the blackboard entity on each process. Where as in an AI system
   * this would generally be passed upon initialisation and remain constant,
   * here the data is associated with only with only the current processing,
   * not a constant source.
   */
  bool process(dynamic blackboard);

}