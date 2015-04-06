part of behaviour_tree_async;

/**
 * Returns false if any node in the sequence returns false,
 * and true if the sequence is completed.
 */
class Sequence<T> implements Composite<T> {

  List<Node<T>> nodes;

  Sequence(List<Node<T>> this.nodes);

  Future<bool> process(T blackboard) async {

    for(Node node in nodes) {
      if (!await node.process(blackboard))
        return new Future(() => false);
    }

    return new Future(() => true);
  }

  /*
  * Old way

  /**
   * Recursively iterates through the node array.
   *
   * If the current iteration to start from is not defined,
   * it will start at 0.
   */
  Future<bool> _sequence(T blackboard, [int i = 0]) {

    Completer completer = new Completer();

    if (i < nodes.length) {

      nodes[i].process(blackboard).then((bool result) {

        if (!result)

          completer.complete(false);

        else {

          i++;
          _sequence(blackboard, i).then((bool result) {
            completer.complete(result);
          });

        }
      });

    } else
      completer.complete(true);

    return completer.future;
  }
  */
}