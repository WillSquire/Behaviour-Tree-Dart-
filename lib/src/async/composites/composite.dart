part of behaviour_tree_async;

/**
 * The composite node is a node that contains an array of nodes within it and is responsible for
 * controlling the flow of execution of these encapsulated nodes.
 */
abstract class Composite<T> implements Node<T> {

  List<Node<T>> nodes;

  //factory Composite(Process<T> implementation, List<Node<T>> nodes) => new _Composite(implementation, nodes);

}