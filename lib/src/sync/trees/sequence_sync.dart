part of behaviour_tree_sync;

/**
 * Returns false if any node in the sequence returns false,
 * and true if the sequence is completed.
 */
abstract class SequenceSync extends TreeSync {

  bool process(dynamic blackboard) {

    nodes.forEach((NodeSync node) {

      if (!node.process(blackboard))
        return false;

    });

    return true;
  }

}