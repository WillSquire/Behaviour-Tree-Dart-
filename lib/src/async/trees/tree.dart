part of behaviour_tree_async;

/**
 * Tree is the container for tasks, responsible for
 * executing them.
 */
abstract class Tree<T> extends Node<T> {

  List<Node<T>> nodes;

  Tree([this.nodes]);

}