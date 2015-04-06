part of behaviour_tree_async;

typedef Future<bool> Process<B>(B blackboard);

/**
 * Takes a blackboard entity on each process. Where in most AI systems
 * this would generally be passed upon initialisation and remain constant,
 * here the node can be associated with multiplicity of sources, one
 * instance can work on multiple problem domains.
 */
abstract class Node<T> {

  factory Node(Process<T> implementation) => new _Node(implementation);

  Future<bool> process(T blackboard);

}