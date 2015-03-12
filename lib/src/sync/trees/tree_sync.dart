part of behaviour_tree_sync;

/**
 * Tree is the container for tasks, responsible for
 * executing them.
 */
abstract class TreeSync implements NodeSync {

  List<NodeSync> nodes;

}