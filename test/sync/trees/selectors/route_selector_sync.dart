part of behaviour_tree.test;

class RouteSelectorSync extends SelectorSync {

  List<NodeSync> nodes = [
      new HasPathSync(),
      new IsPathToFilePathSync(),
  ];

}