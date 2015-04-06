// Copyright (c) 2015, Will Squire. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

part of behaviour_tree.test;

selector_test() {

  /**
   * Selector sync test
   */
  /*
  group('Sequence', () {

    Map<String, dynamic> blackboard;

    setUp(() {

      blackboard = {
          'path' : 'path/to/file'
      };

    });

    test('First Test', () {

      expect(new RouteSelector().process(blackboard), isTrue);

    });
  });
  */

  /**
   * Selector async test
   */
  group('Selector', () {

    Selector selector;
    Selector selector_injected;

    setUp(() {
      // Encapsulated
      selector = new Route();

      // Injected
      selector_injected = new Selector([
          new IsPathIndex(),
          new IsPathUser(),
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
    });

    test('Selector completed selection with encapsulated implementation', () {
      return selector.process({'path' : 'index'}).then((bool value) { expect(value, isTrue); });
    });

    test('Selector completed selection with injected implementation', () {
      return selector_injected.process({'path' : 'index'}).then((bool value) { expect(value, isTrue); });
    });

    test('Selector failed selection', () {
      return selector.process({'doesntHavePath' : 'No'}).then((bool value) { expect(value, isFalse); });
    });

  });
}