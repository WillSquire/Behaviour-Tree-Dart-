// Copyright (c) 2015, Will Squire. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

library behaviour_tree.test;

import 'package:unittest/unittest.dart';
import 'package:behaviour_tree/behaviour_tree.dart';

// Nodes
part 'nodes/has_path.dart';
part 'nodes/is_path_to_file_path.dart';

// Tress
part 'trees/router_tree.dart';

main() {

  /**
   * Conditions test
   */
  group('Conditions', () {

    test('Has variable', () {

      expect(new HasPath().process({'path' : 'path/to/file'}), isTrue);

    });

    test('Does not have variable', () {

      expect(new HasPath().process({'other' : 'path/to/file'}), isFalse);

    });
  });

  group('A group of tests', () {

    RouterTree routeTree;

    setUp(() {

      routeTree = new RouterTree();

    });

    test('First Test', () {

      Object blackboard = {
          'path' : 'path/to/file'
      };

      expect(routeTree.process(blackboard), isTrue);

    });
  });

}
