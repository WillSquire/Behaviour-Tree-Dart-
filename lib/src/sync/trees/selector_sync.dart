part of behaviour_tree_sync;

/**
 * Returns true if any node in the sequence returns true,
 * and false if the sequence is completed.
 */
abstract class SelectorSync extends TreeSync {

  bool process(dynamic blackboard) {

    nodes.forEach((NodeSync node) {

      if (node.process(blackboard))
        return true;

    });

    return false;
  }

}