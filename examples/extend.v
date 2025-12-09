import linklancien.decision_graph as deci

struct App {
mut:
	sum int
}

fn main() {
	mut app := App{
		sum: 0
	}
	base := deci.Conditionnal_node[App]{
		evaluation: conditionnal_fn
		true_next:  deci.Action_node[App]{
			make_action: action_true_fn
		}
		false_next: deci.Action_node[App]{
			make_action: action_false_fn
		}
	}

	for base.evaluation(app){
		base.do(mut app)
	}
}

fn conditionnal_fn(data App) bool {
	return data.sum < 30
}

fn action_true_fn(mut data App) {
	data.sum += 1
	println('TRUE sum ${data.sum}')
}

fn action_false_fn(mut data App) {
	println('FALSE sum ${data.sum}')
}

