// Copyright (c) 2015, Will Squire. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

part of behaviour_tree.test;

action_test() {

  /**
   * Action sync test
   */
  group('Action', () {

    Map<String, dynamic> blackboard = new Map<String, dynamic>();

    test('Set variable', () {

      expect(new SetPathPathToFileSync().process(blackboard), isTrue);

    });

    test('Check if variable was set', () {

      expect(new SetPathPathToFileSync().process(blackboard), isTrue);

    });
  });

}