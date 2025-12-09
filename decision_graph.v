module decision_graph

type Node[T] = Action_node[T] | Conditionnal_node[T]

type Action_fn[T] = fn (T)

fn action_null[T](data T) {}

pub struct Action_node[T] {
pub:
	make_action Action_fn[T] = action_null[T]
}

pub fn (node Action_node[T]) do[T](data T) {
	node.make_action(data)
}

type Evaluation_fn[T] = fn (T) bool

fn evaluation_null[T](data T) bool {
	return true
}

pub struct Conditionnal_node[T] {
pub:
	evaluation Evaluation_fn[T] = evaluation_null[T]
	true_next  Node[T]
	false_next Node[T]
}

pub fn (node Node[T]) do[T](data T) {
	match node {
		Action_node[T] {
			node.make_action(data)
		}
		Conditionnal_node[T] {
			if node.evaluation(data) {
				node.true_next.do(data)
			} else {
				node.false_next.do(data)
			}
		}
	}
}
