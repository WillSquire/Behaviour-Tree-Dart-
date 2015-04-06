// Copyright (c) 2015, Will Squire. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.
/*
part of behaviour_tree.test;

selector_test() {

  /**
   * Composite async test
   * (injecting selector implementation)
   */
  group('Composite', () {

    Composite composite;

    setUp(() {
      composite = new Composite([
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
    });

    test('Complete selection with encapsulated implementation', () {
      return composite.process({'path' : 'index'}).then((bool value) { expect(value, isTrue); });
    });

    test('Complete selection with injected implementation', () {
      return composite.process({'path' : '404'}).then((bool value) { expect(value, isTrue); });
    });

    test('Fail selection', () {
      return composite.process({'doesntHavePath' : 'No'}).then((bool value) { expect(value, isFalse); });
    });

  });
}
*/