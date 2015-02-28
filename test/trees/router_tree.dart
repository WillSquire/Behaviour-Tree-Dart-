part of behaviour_tree.test;

class RouterTree extends Sequence {

  List<Node> nodes = [
      new HasPath(),
      new IsPathToFilePath(),
  ];

}