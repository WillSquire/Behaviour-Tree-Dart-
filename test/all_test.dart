// Copyright (c) 2015, Will Squire. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

library behaviour_tree.test;

import 'package:unittest/unittest.dart';
import 'package:behaviour_tree/behaviour_tree.dart';
import 'dart:async';

/**
 * Sync Nodes
 */
// Actions
part 'sync/nodes/actions/set_path_path_to_file_sync.dart';

// Conditions
part 'sync/nodes/conditions/has_path_sync.dart';
part 'sync/nodes/conditions/is_path_to_file_path_sync.dart';

/**
 * Trees
 */
// Sequences
part 'sync/trees/sequences/router_sequence_sync.dart';

// Selectors
part 'sync/trees/selectors/route_selector_sync.dart';

/**
 * Async Nodes
 */
// Conditions
part 'async/nodes/conditions/has_path.dart';
part 'async/nodes/conditions/is_path_index.dart';
part 'async/nodes/conditions/is_path_user.dart';

/**
 * Tests
 */
part 'condition_test.dart';
part 'action_test.dart';
part 'selector_test.dart';
part 'sequence_test.dart';

main() {
  condition_test();
  action_test();
  selector_test();
  sequence_test();
}
