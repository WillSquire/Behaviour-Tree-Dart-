part of behaviour_tree_async;

/**
 * Returns true if any node in the sequence returns true,
 * and false if the sequence is completed.
 */
class Selector<T> implements Composite<T> {

  List<Node<T>> nodes;

  Selector(List<Node<T>> this.nodes);

  Future<bool> process(T blackboard) async {

    for(Node node in nodes) {
      if (await node.process(blackboard))
        return new Future(() => true);
    }

    return new Future(() => false);
  }

}