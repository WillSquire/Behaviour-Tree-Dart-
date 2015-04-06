part of behaviour_tree_async;

/**
 * Node injected implementation class
 */
class _Node<T> implements Node<T> {

  Process<T> _process;

  _Node(Process<T> this._process);

  Future<bool> process(T blackboard) => _process(blackboard);

}