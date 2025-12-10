A V #Module to simulate decisions with a graphs  
In all this module, T will design our own type that is need for the action and to check the conditions

How to use:
- Create a tree as in the examples
- Call the function do(T) on the node at the base of the tree

API:  
Useful types:
- ``type Node[T] = Action_node[T] | Conditionnal_node[T]``
- ``Action_fn[T] = fn (mut T)``
- ``Evaluation_fn[T] = fn (T) bool``
The tree is composed of either 
- ``Action_node[T]`` has the following fields:
	- action is an ``Action_fn[T]`` type, it is the function that will be call each time the graph ends-up on this node 
- ``Conditionnal_node[T]`` has the following fields:
	- evaluation is an ``Evaluation_fn[T]`` that will check whether the given condition is true or false and 
	- true_next is the ``Node[T]`` that is called when the condition is TRUE
	- false_next is the  ``Node[T]`` that is called when the condition is FALSE

Useful function:
``Node.do(T)`` will execute the tree starting at Node
