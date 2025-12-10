module decision_graph

// A: Node
// B: Action_node
// C: Conditionnal_node

// A: Node
pub type Node[T] = Action_node[T] | Conditionnal_node[T]

pub fn (node Node[T]) do[T](mut data T) {
	match node {
		Action_node[T] {
			node.do(mut data)
		}
		Conditionnal_node[T] {
			node.do(mut data)
		}
	}
}

// B: Action_node
pub struct Action_node[T] {
pub:
	action Action_fn[T] = action_null[T]
}

type Action_fn[T] = fn (mut T)

fn action_null[T](mut data T) {}


pub fn (node Action_node[T]) do[T](mut data T) {
	node.action(mut data)
}

// C: Conditionnal_node
pub struct Conditionnal_node[T] {
pub:
	evaluation Evaluation_fn[T] = evaluation_null[T]
	true_next  Node[T]
	false_next Node[T]
}

type Evaluation_fn[T] = fn (T) bool

fn evaluation_null[T](data T) bool {
	return true
}

pub fn (node Conditionnal_node[T]) do[T](mut data T) {
	if node.evaluation(data) {
		node.true_next.do(mut data)
	} else {
		node.false_next.do(mut data)
	}
}
