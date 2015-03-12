part of behaviour_tree_async;

/**
 * Returns true if any node in the sequence returns true,
 * and false if the sequence is completed.
 */
class Selector<T> extends Tree<T> {

  Selector.WithNodes(List<Node<T>> nodes) : super.WithNodes(nodes);

  Future<bool> process(T blackboard) {

    return _selector(blackboard);
  }

  /**
   * Recursively iterates through the node array.
   *
   * If the current iteration to start from is not defined,
   * it will start at 0.
   */
  Future<bool> _selector(T blackboard, [int i = 0]) {

    Completer completer = new Completer();

    if (i < nodes.length) {

      nodes[i].process(blackboard).then((bool result) {

        if (result)

          completer.complete(true);

        else {

          i++;
          _selector(blackboard, i).then((bool result) {
            completer.complete(result);
          });

        }
      });

    } else
      completer.complete(false);

    return completer.future;
  }
}