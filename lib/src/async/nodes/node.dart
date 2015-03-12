part of behaviour_tree_async;

abstract class Node<T> {

  /**
   * Takes a blackboard entity on each process. Where in most AI systems
   * this would generally be passed upon initialisation and remain constant,
   * here the node can be associated with multiplicity of sources, one
   * instance can work on multiple problem domains.
   */
  Future<bool> process(T blackboard);

}