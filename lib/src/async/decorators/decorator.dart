part of behaviour_tree_async;

/**
 * The decorator node (or wrapper node) is a node that contains or 'wraps' another node inside itself,
 * extending the contained node's functionality without altering its encapsulated implementation or
 * building a new class.
 */
abstract class Decorator<T> implements Node<T> {

  Node node;

}