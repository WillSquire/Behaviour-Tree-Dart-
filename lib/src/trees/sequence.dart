part of behaviour_tree.base;

/**
 * Returns false if any node in the sequence returns false,
 * and true if the sequence is completed.
 */
abstract class Sequence extends Tree {

  bool process(dynamic blackboard) {

    nodes.forEach((Node node) {

      if (!node.process(blackboard))
        return false;

    });

    return true;
  }

}