// Copyright (c) 2015, Will Squire. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

part of behaviour_tree.test;

inverter_test() {
  /**
   * Inverter async test
   */
  group('Inverter', () {

    Node invertedNode;

    setUp(() {
      // Encapsulated
      invertedNode = new Inverter(new IsPathIndex());
    });

    test('Inverted true node is false', () {
      return invertedNode.process({'path' : 'index'}).then((bool value) { expect(value, isFalse); });
    });

    test('Inverted false node is true', () {
      return invertedNode.process({'doesntHavePath' : 'No'}).then((bool value) { expect(value, isTrue); });
    });

  });
}