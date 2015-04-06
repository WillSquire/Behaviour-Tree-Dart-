behaviour_tree
--------------
The Behaviour Tree framework is a foundation for the classic design pattern structure, often associated
with the field of AI (artificial intelligence) and used predominantly within the games industry. These
frameworks are a solution to systems that have complex logical infrastructures and have 
similar structure to neural networks but with discrete responses rather than probability 
(fuzzy logic).

This behaviour tree library contains the foundations for building behaviour tree systems.

Structure
=========
The library components and inheritance hierarchy:

- Node
    - Action
    - Condition
    - Composite
        - Selector
        - Sequence

Components
==========
### Blackboard
Behaviour tree frameworks often define a 'Blackboard' object to act as the 
'container' for (or to represent) the problem domain/s that the behaviour tree system is 
to address. The responsibility of the behaviour tree system is then to interact with and incur a state of change 
upon the problem domain, passing the blackboard around its internal structure, accessing and changing the information 
within the blackboard as it transverses each node.

Whilst it is common place to have a blackboard object defined in a behaviour tree,
this framework does not define a specific class for this. The reason being is so the blackboard is more than just a container. Separating the blackboard from the dependency of the
tree means the tree (out of the box) does not need to depend on using a specific blackboard object, and thus the tree has been designed to
have any class passed to it to be worked on as the blackboard object. 

### Node
The behaviour tree's internal structure comprises of nodes that are responsible 
for interacting with the blackboard individually, without any explicit dependency on adjacent nodes.
It is up the the node to carry out some process on the blackboard object and return a Boolean (true or false) value pending
the outcome of that process. One reason for using a behaviour tree is modularity, thus the absence of explicit dependency is important, 
but all nodes must be able to 'know' this blackboard object.

Each of the nodes will specialise in the performance of a particular task, which when in a particular sequence, help reach the overall 
solution. The response of these nodes feed back to a composite node (explained below) that
determines the flow of the system, affecting what future nodes will be processed.
 
These nodes/components/modules of the tree (terms that can be used
interchangeably in the context) are also known as the KSs (knowledge sources).
The blackboard, or problem domain, is worked on collectively by each node the tree 
comprises of, to break down the problem into 'sub-problems' that are each resolved 
by specific nodes, which reach a solution for the overall system.

### Composite
Composite nodes (also know as the control flow nodes, or a branch) are nodes that contain an array of nodes within 
themselves, along with the logic behind how these encapsulated nodes should be executed. As such,
these nodes are responsible for controlling the flow of execution of the encapsulated nodes within them through use of their own logic.

The two most common types of composite nodes are the Selector and Sequence nodes. 
Both of these are included in this framework.

#### Sequence
The sequence composite node contains an array of nodes inside itself, which it iterated through processing each. Along the way, the sequence node will stop its iterating processing of internal nodes if any node returns false. If any node returns false, the sequence returns false.
The sequence will return true if the processing of the internal array reaches the end without any of the nodes returning false; thus completing the sequence.

#### Selector
The selector composite node contains an array of nodes inside itself, which it iterated through processing each. Along the way, the selector node will stop its iterating processing of internal nodes if any node returns true. If any node returns true, the selector returns true.
The selector will return false if the processing of the internal array reaches the end without any of the nodes returning true; thus failing to make a selection.

Features
========
### Optionally Typed
This framework has be built with the option of specifying a type for the 
blackboard object in mind to reduce errors. This is optional, and will of course
fall back to the `dynamic` type if not set as specified by the language. 

The tree's component interface defines a `dynamic` type for the 'blackboard' parameter. 
With this interface, the components can define their own function's parameters,
such as `Map<String, dynamic>`, if suitable.
 
This helps keep the package as flexible as possible.

### Encapsulated vs Decapsulated Dependency
For clarification in this context, encapsulated dependency here will refer to anything defined 
'inside' of an object, that is, anything utilised as a self-referential within it's own scope to act 
in accordance to its own functionality. A decapsulated dependency here will be referencing anything 'outside' 
the object but is coupled to its functionality, such as the use of dependency injection (and
imports). 

Both of these have their uses and trade offs.

The design of the nodes in this framework accommodates for both of these design pattern approaches. 
New nodes can either be defined by creating a new class that implements the Node interface, or through passing the implementation logic to the Node 
object via dependency injection in the constructor.

Whilst it is highly recommended to produce a class for each node (for modularity purposes), 
it can be tedious and impractical to have to define this new class each time something needs to be quickly tested.
This addition of defining an entirely new class can act as an 'antipattern' if a node 
is only ever going to be called for one instance or used temporarily. This helps to save time
as a new class does not need to be defined for each node. If the node logic did later need to be encapsulated in a class,
it is still easily moved over as the decapsulated function passed in must use the same parameters and return type as an encapsulated one.
 
Usage
=====
### Node
Each node require a function called `process()` to be called and return a bool. Since all components of 
the behaviour tree are nodes and the nodes are generally contained within nodes, the starting node that contains
(or makes reference to) all of the other nodes is the root node. The root node is the one that needs to begin the processing 
within the tree and is the entry point for the blackboard object (although this may differ in other behaviour tree frameworks).
Generally speaking, the root node is going to be a type of composite node (such as a sequence or selector), to be able to contain other nodes
within it. By calling `process()` on this node, and passing the blackboard object in this function, it trickles through all internal nodes,
returning once the tree has finished the processing.

This example defines a new node as a new class, and is the best approach to use for making nodes.
By encapsulating the logic in the class, it makes the node reusable, but takes a little longer
to set up.

    class HasPath implements Node {
    
      // Every implementation of Node must have the process function,
      // which executes all of the nodes processing logic
      Future<bool> process(Map<String, dynamic> blackboard) {
    
        // Carry out the logic that must return a Boolean (wrapped in 
        // a future as this is an asynchronous framework by nature).
        if (blackboard['path'] != null)
          return new Future(() => true);
        
        return new Future(() => false);
      }
    
    }

This next example creates a node from the base object, injecting the functionality. By
using the decapsulated approach, code can be tested much faster as a new class does not
need to be defined, however this is not a reusable pattern and is only good for testing or
for code that will only be used once.

    new Node((blackboard) {
      if (blackboard['isLoggedIn'] != null)
        return new Future(() => true);
    
      return new Future(() => false);
    })
    
### Composite
For the composite nodes, again there is both an encapsulation approach or decapsulation approach. 
Whilst it is best to define a new class, the injection method is much faster as a temporary measure.
(Note, this is only applicable for the sequence and selector classes implementing the composite. A decapsulated approach
to the composite itself wouldn't be the best approach).

#### Sequence
The encapsulated approach for a sequence:

    class CheckLoggedIn<T> extends Sequence<T> {
    
      // Acting as a wrapper for the sequence constructor, simply pass the nodes 
      // to the parent constructor in the new class's constructor
      CheckLoggedIn() : super([
          // Instantiating node classes
          new HasPath(),
          new IsPathIndex(),
    
          // Instantiating base node class and injecting logic
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
    
    }

And the decapsulated approach:

    new Sequence([
        // Instantiating node classes
        new HasPath(),
        new IsPathIndex(),
        
        // Instantiating base node class and injecting logic
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

#### Selector
The encapsulated approach for a selector:

    class Route<T> extends Selector<T> {
    
      // Acting as a wrapper for the selector constructor, simply pass the nodes 
      // to the parent constructor in the new class's constructor
      Route() : super([
          // Instantiating node classes
          new IsPathIndex(),
          new IsPathUser(),
    
          // Instantiating base node class and injecting logic
          new Node((blackboard) {
            if (blackboard['path'] == '404')
              return new Future(() => true);
    
            return new Future(() => false);
          }),
          new Node((blackboard) {
            if (blackboard['noPath'] == 'somePath')
              return new Future(() => true);
    
            return new Future(() => false);
          })
      ]);
    
    }
    
And the decapsulated approach:

    new Selector([
        // Instantiating node classes
        new IsPathIndex(),
        new IsPathUser(),
        
        // Instantiating base node class and injecting logic
        new Node((blackboard) {
          if (blackboard['path'] == '404')
            return new Future(() => true);
    
          return new Future(() => false);
        }),
        new Node((blackboard) {
          if (blackboard['noPath'] == 'somePath')
            return new Future(() => true);
    
          return new Future(() => false);
        })
    ]);

Features and bugs
=================
If there is any feature requests, bugs or questions, please feel free to email myself or find me on 
[twitter][Twitter]. Any and all feedback is great, so
feel free to contact me.

[Twitter]: https://twitter.com/WillSquire