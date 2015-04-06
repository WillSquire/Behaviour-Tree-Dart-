part of behaviour_tree.test;

class Route<T> extends Selector<T> {

  Route() : super([
      // Encapsulated
      new IsPathIndex(),
      new IsPathUser(),

      // Injected
      new Node((blackboard) {
        if (blackboard['path'] == '404')
          return new Future(() => true);

        return new Future(() => false);
      }),
      new Node((blackboard) {
        if (blackboard['noPath'] == 'somePath')
          return new Future(() => true);

        return new Future(() => false);
      })
  ]);

}