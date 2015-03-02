part of behaviour_tree.base;

abstract class Node {

  /**
   * Takes a blackboard entity on each process. Where in most AI systems
   * this would generally be passed upon initialisation and remain constant,
   * here the node can be associated with multiplicity of sources, to have
   * one instance work on multiple problem domains.
   */
  bool process(dynamic blackboard);

}