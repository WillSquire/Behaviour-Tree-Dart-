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

    Selector select;

    setUp(() {
      select = new Selector.WithNodes([
          new IsPathIndex(),
          new IsPathUser()
      ]);
    });

    test('Returns', () {
      select.process({'doesntHavePath' : 'No'}).then((bool value) { expect(value, isFalse); });
      select.process({'path' : 'index'}).then((bool value) { expect(value, isTrue); });
      select.process({'path' : 'user'}).then((bool value) { expect(value, isTrue); });
      select.process({'path' : '404'}).then((bool value) { expect(value, isFalse); });
    });

  });
}