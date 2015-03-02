part of behaviour_tree.test;

class RouterSequence extends Sequence {

  List<Node> nodes = [
      new HasPath(),
      new IsPathToFilePath(),
  ];

}