// Copyright (c) 2015, Will Squire. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

part of behaviour_tree.test;

sequence_test() {

  /**
   * Sequence sync test
   */
  group('Sequence', () {

    Map<String, dynamic> blackboard;

    test('Successful sequence', () {
      expect(new RouterSequenceSync().process({'path' : 'path/to/file'}), isTrue);
    });

  });

  /**
   * Sequence async test
   */
  group('Sequence', () {

    Sequence sequence;

    setUp(() {
      sequence = new Sequence([
          new HasPath(),
          new IsPathIndex(),
          new IsPathUser()
      ]);
    });

    test('Returns', () {
      sequence.process({'doesntHavePath' : 'No'}).then((bool value) { expect(value, isFalse); });
      sequence.process({'path' : 'index'}).then((bool value) { expect(value, isTrue); });
      sequence.process({'path' : 'user'}).then((bool value) { expect(value, isTrue); });
      sequence.process({'path' : '404'}).then((bool value) { expect(value, isFalse); });
    });

  });
}