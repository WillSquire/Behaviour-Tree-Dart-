// Copyright (c) 2015, Will Squire. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

part of behaviour_tree.test;

condition_test() {

  /**
   * Condition sync test
   */
  group('Condition', () {

    test('Has variable', () {

      expect(new HasPathSync().process({'path' : 'path/to/file'}), isTrue);

    });

    test('Does not have variable', () {

      expect(new HasPathSync().process({'other' : 'path/to/file'}), isFalse);

    });
  });

}