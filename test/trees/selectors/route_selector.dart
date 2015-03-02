part of behaviour_tree.test;

class RouteSelector extends Selector {

  List<Node> nodes = [
      new HasPath(),
      new IsPathToFilePath(),
  ];

}