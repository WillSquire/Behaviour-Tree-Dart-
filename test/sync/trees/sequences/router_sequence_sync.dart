part of behaviour_tree.test;

class RouterSequenceSync extends SequenceSync {

  List<NodeSync> nodes = [
      new HasPathSync(),
      new IsPathToFilePathSync(),
  ];

}