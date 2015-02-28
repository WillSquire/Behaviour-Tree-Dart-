part of behaviour_tree.base;

/**
 * Returns true if any node in the sequence returns true,
 * and false if the sequence is completed.
 */
abstract class Selector extends Tree {

  bool process(dynamic blackboard) {

    nodes.forEach((Node node) {

      if (node.process(blackboard))
        return true;

    });

    return false;
  }

}