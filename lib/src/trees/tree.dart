part of behaviour_tree.base;

/**
 * Tree is the container for tasks, responsible for
 * executing them.
 */
abstract class Tree implements Node {

  List<Node> nodes;

}