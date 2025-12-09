import linklancien.decision_graph as deci

struct App {
mut:
	some f32
}

fn main() {
	mut app := App{
		some: 31
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

	base.do(mut app)
	app.some = 30
	base.do(mut app)
}

fn conditionnal_fn(mut data App) bool {
	return data.some == 30
}

fn action_true_fn(mut data App) {
	println('TRUE')
}

fn action_false_fn(mut data App) {
	println('FALSE')
}
