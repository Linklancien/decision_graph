module decision_graph

// A: Node
// B: Action_node
// C: Conditionnal_node

// A: Node
pub type Result = map[string]f64
pub type Node = Action_node | Conditionnal_node

pub fn (node Node) do(data Result) Result {
	match node {
		Action_node {
			return node.do(data)
		}
		Conditionnal_node {
			return node.do(data)
		}
		// else {
		// 	panic('Unknown node: ${node}')
		// }
	}
}

pub fn (node Node) str() string{
 	match node {
		Action_node {
			return node.str()
		}
		Conditionnal_node {
			return node.str()
		}
		// else {
		// 	panic('Unknown node: ${node}')
		// }
	}
}

// B: Action_node
pub struct Action_node {
pub:
  name string = 'Action null fn'
	action Action_fn = action_null
}

pub type Action_fn = fn (Result) Result

fn action_null(data Result) Result {
	return Result{}
}

pub fn (node Action_node) do(data Result) Result {
	return node.action(data)
}

pub fn (node Action_node) str() string{
  return node.name
}

// C: Conditionnal_node
pub struct Conditionnal_node {
pub:
  eval_name string = "Evaluation null fn"
	evaluation Evaluation_fn = evaluation_null
	true_next  Node
	false_next Node
}

pub type Evaluation_fn = fn (Result) bool

fn evaluation_null(data Result) bool {
	return true
}

pub fn (node Conditionnal_node) do(data Result) Result {
	if node.evaluation(data) {
		return node.true_next.do(data)
	} else {
		return node.false_next.do(data)
	}
}

pub fn (node Conditionnal_node) str() string{
  return '
  {
    evaluation: ${node.eval_name}
  	true_next : ${node.true_next.str()}
  	false_next: ${node.false_next.str()}
  }
  '
}
