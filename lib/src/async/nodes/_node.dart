part of behaviour_tree_async;

/*
The base class defines a typeless function. At the
foundation, the type cannot be defined (unfortunately).
Doing so means favouring either the sync and async as
the base, this approach instead favours the neutral.
 */

abstract class _Node<T> {

  process(T blackboard);

}