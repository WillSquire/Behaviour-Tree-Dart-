behaviour_tree
--------------

A behaviour tree library. The library components and hierarchy:

- Node
    - Action
    - Condition
    - Tree
        - Selector
        - Sequence

In many behaviour tree frameworks it is quite common place to find a 'Blackboard' 
object that will act as the 'container' for (or representing) problem domain/s. 
The blackboard object is 'known' by all components of the tree and is 'worked on' 
collectively by each component the behaviour tree comprises of. The tree components each
specialises in performing a particular task, which together helps to reach an overall 
solution in the system. These nodes/components/modules of the tree (I use 
interchangeably here) are also known as the KSs (knowledge sources). The foundation 
classes used for building these components are what is included in this package.

Whilst it is common place to have this blackboard object defined, 
this framework does not define and depend on this class. The reason for this is
so it can be defined as more than just a wrapper. Separating the blackboard from the 
tree; the tree does not depend on using a blackboard object, the tree can be 
used to have any class passed to it to be worked on. 
The tree's component interface defines a `dynamic` type for the 'blackboard' parameter. 
With this interface, the components can define their own function's parameters,
such as `Map<String, dynamic>`, if suitable.
 
This helps keep the package as flexible as possible.

Each node require a function called `process()` to be called and return a bool.

Usage
=====

TBC

## Features and bugs

Please email myself feature requests and bugs, or find me on 
[twitter][Twitter]. It's lovely to hear feedback, so
feel free to contact me whenever.

[Twitter]: https://twitter.com/WillSquire