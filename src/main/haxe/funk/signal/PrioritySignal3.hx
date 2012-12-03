package funk.signal;

import funk.Funk;
import funk.collections.immutable.List;
import funk.collections.immutable.extensions.Lists;
import funk.types.Function3;
import funk.types.Option;
import funk.types.extensions.Functions3;
import funk.types.extensions.Options;
import funk.signal.Signal3;

using funk.collections.immutable.extensions.Lists;
using funk.types.extensions.Functions3;
using funk.types.extensions.Options;

class PrioritySignal3<T1, T2, T3> extends Signal3<T1, T2, T3> {

	public function new() {
		super();
	}

    public function addWithPriority(	func : Function3<T1, T2, T3, Void>,
    									?priority : Int = 0) : Option<Slot3<T1, T2, T3>> {
        return registerListenerWithPriority(func, false, priority);
    }

    public function addOnceWithPriority(	func : Function3<T1, T2, T3, Void>,
    										?priority:Int = 0) : Option<Slot3<T1, T2, T3>> {
        return registerListenerWithPriority(func, true, priority);
    }

    private function registerListenerWithPriority(	func : Function3<T1, T2, T3, Void>,
    												once : Bool,
    												priority : Int) : Option<Slot3<T1, T2, T3>> {
    	if(registrationPossible(func, once)) {
    		var added : Bool = false;
    		var slot : Slot3<T1, T2, T3> = new PrioritySlot3<T1, T2, T3>(	this,
    																		func,
    																		once,
    																		priority);

			_list = _list.flatMap(function(value : Slot3<T1, T2, T3>) {
				var prioritySlot : PrioritySlot3<T1, T2, T3> = cast value;

				var list = Nil.prepend(value);
				return if(priority >= prioritySlot.priority) {
					added = true;
					list.append(slot);
				} else {
					list;
				};
			});

			if(!added) {
				_list = _list.prepend(slot);
			}

			return Some(slot);
    	}

    	return _list.find(function(s : Slot3<T1, T2, T3>) : Bool {
			return s.listener.equals(func);
		});
    }
}

class PrioritySlot3<T1, T2, T3> extends Slot3<T1, T2, T3> {

	public var priority(get_priority, never) : Int;

	private var _priority : Int;

	public function new(	signal : ISignal3<T1, T2, T3>,
							listener : Function3<T1, T2, T3, Void>,
							once : Bool,
							priority : Int) {
		super(signal, listener, once);

		_priority = priority;
	}

	private function get_priority() : Int {
		return _priority;
	}

}
