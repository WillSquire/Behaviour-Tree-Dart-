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
    Sequence sequence_injected;

    setUp(() {
      // Encapsulated
      sequence = new CheckLoggedIn();

      // Injected
      sequence_injected = new Sequence([
          new HasPath(),
          new IsPathIndex(),
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
    });

    test('Sequence failed completion with encapsulated implementation', () {
      return sequence.process({'path' : 'index'}).then((bool value) { expect(value, isFalse); });
    });

    test('Sequence failed completion with injected implementation', () {
      return sequence_injected.process({'path' : 'index'}).then((bool value) { expect(value, isFalse); });
    });

    test('Sequence completed sequence', () {
      return sequence.process({'path' : 'index', 'isLoggedIn' : true }).then((bool value) { expect(value, isTrue); });
    });

  });
}