part of behaviour_tree_async;
/*
/**
 * Composite implementation class
 */
class _Composite<T> implements Composite<T> {

  Process<T> _process;
  List<Node<T>> nodes;

  _Composite(Process<T> this._process, List<Node<T>> this.nodes);

  Future<bool> process(T blackboard) => _process(blackboard);

}
*/