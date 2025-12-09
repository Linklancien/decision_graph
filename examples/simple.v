import linklancien.decision_graph as deci

struct App {
	some f32
}

fn main() {
	app := App{
		some: 30
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

	base.do(app)
}

fn conditionnal_fn(data App) bool {
	return data.some == 30
}

fn action_true_fn(data App) {
	println('TRUE')
}

fn action_false_fn(data App) {
	println('FALSE')
}
