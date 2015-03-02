// Copyright (c) 2015, Will Squire. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

library behaviour_tree.test;

import 'package:unittest/unittest.dart';
import 'package:behaviour_tree/behaviour_tree.dart';

/**
 * Nodes
 */
// Actions
part 'nodes/actions/set_path_path_to_file.dart';

// Conditions
part 'nodes/conditions/has_path.dart';
part 'nodes/conditions/is_path_to_file_path.dart';

/**
 * Trees
 */
// Sequences
part 'trees/sequences/router_sequence.dart';

// Selectors
part 'trees/selectors/route_selector.dart';

main() {

  /**
   * Condition test
   */
  group('Condition', () {

    test('Has variable', () {

      expect(new HasPath().process({'path' : 'path/to/file'}), isTrue);

    });

    test('Does not have variable', () {

      expect(new HasPath().process({'other' : 'path/to/file'}), isFalse);

    });
  });

  /**
   * Action test
   */
  group('Action', () {

    Map<String, dynamic> blackboard = new Map<String, dynamic>();

    test('Set variable', () {

      expect(new SetPathPathToFile().process(blackboard), isTrue);

    });

    test('Check if variable was set', () {

      expect(new SetPathPathToFile().process(blackboard), isTrue);

    });
  });

  /**
   * Sequence test
   */
  group('Sequence', () {

    Map<String, dynamic> blackboard;

    setUp(() {

      blackboard = {
          'path' : 'path/to/file'
      };

    });

    test('Successful sequence', () {

      expect(new RouterSequence().process(blackboard), isTrue);

    });

  });

  /**
   * Selector test
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

}
