part of behaviour_tree_async;

/**
 * The inverter inverts the response given by a node contained within it. Returning true
 * if the contained node returned false, and vice versa.
 */
class Inverter<T> implements Decorator<T> {

  Node node;

  Inverter(Node this.node);

  Future<bool> process(T blackboard) async {
    return !await node.process(blackboard);
  }

}