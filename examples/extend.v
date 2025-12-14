import linklancien.decision_graph as deci

struct App {
mut:
	sum f64
}

fn (app App) convert_to_map() map[string]f64 {
	return {
		'sum': app.sum
	}
}

fn main() {
	mut app := App{
		sum: 0
	}
	base := deci.Conditionnal_node{
		evaluation: conditionnal_fn
		true_next:  deci.Action_node{
			action: action_true_fn
		}
		false_next: deci.Action_node{
			action: action_false_fn
		}
	}

	for base.evaluation(app.convert_to_map()) {
		res := base.do(app.convert_to_map())
		app.sum += res['sum']
	}
}

fn conditionnal_fn(data deci.Result) bool {
	return data['sum'] < 30
}

fn action_true_fn(data deci.Result) deci.Result {
	println('TRUE sum ${data['sum']}')
	return {
		'sum': 1.0
	}
}

fn action_false_fn(data deci.Result) deci.Result {
	println('FALSE sum ${data['sum']}')
	return deci.Result{}
}
