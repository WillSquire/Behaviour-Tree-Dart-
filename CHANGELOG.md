behaviour_tree
--------------

v0.9.1
======
- Changed Tree class to no longer use a named constructor for 
instantiating with nodes, instead it takes an option parameter (and 
still uses a default constructor in inheritance usages).

v0.9.0
======
- Added async library, replacing all the previous components with
async ones and renaming the previous sync components with 'Sync'
appended to the end of the names. The new async components return 
futures.

v0.8.1
======
- Refined classes, did some unit testing and added to documentation.