part of behaviour_tree.test;

class CheckLoggedIn<T> extends Sequence<T> {

  CheckLoggedIn() : super([
      // Encapsulated
      new HasPath(),
      new IsPathIndex(),

      // Injected
      new Node((blackboard) {
        if (blackboard['isLoggedIn'] != null)
          return new Future(() => true);

        return new Future(() => false);
      }),
      new Node((blackboard) {
        if (blackboard['isLoggedIn'] == true)
          return new Future(() => true);

        return new Future(() => false);
      })
  ]);

}