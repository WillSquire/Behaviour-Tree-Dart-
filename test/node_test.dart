// Copyright (c) 2015, Will Squire. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

part of behaviour_tree.test;

node_test() {
  /**
   * Node async test
   */
  group('Node', () {

    Node node;
    Node node_injected;

    setUp(() {
      // Encapsulated
      node = new IsPathIndex();

      // Injected
      node_injected = new Node((blackboard) {
        if (blackboard['path'] == '404')
          return new Future(() => true);

        return new Future(() => false);
      });
    });

    test('Node is true with encapsulated implementation', () {
      return node.process({'path' : 'index'}).then((bool value) { expect(value, isTrue); });
    });

    test('Node is true with injected implementation', () {
      return node_injected.process({'path' : '404'}).then((bool value) { expect(value, isTrue); });
    });

    test('Node is false', () {
      return node.process({'doesntHavePath' : 'No'}).then((bool value) { expect(value, isFalse); });
    });

  });
}