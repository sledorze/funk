package funk.signal;

import funk.errors.IllegalOperationError;
import funk.collections.IList;
import funk.collections.immutable.Nil;
import funk.option.Option;
import funk.signal.Signal;
import funk.signal.Slot0;

using funk.collections.immutable.Nil;

interface ISignal0 implements ISignal {

	function add(func : (Void -> Void)) : IOption<ISlot0>;

	function addOnce(func : (Void -> Void)) : IOption<ISlot0>;

	function remove(func : (Void -> Void)) : IOption<ISlot0>;

	function dispatch() : Void;
}

class Signal0 extends Signal, implements ISignal0 {

	private var _list : IList<ISlot0>;

	public function new() {
		super();

		_list = Nil.list();
	}

	public function add(func : Void -> Void) : IOption<ISlot0> {
		return registerListener(func, false);
	}

	public function addOnce(func : Void -> Void) : ISlot0 {
		return registerListener(func, true);
	}

	public function remove(func : Void -> Void) : ISlot0 {
		var o = _list.find(function(s : ISlot0) : Bool {
			return listenerEquals(s.listener, func);
		});

		_list = _list.filterNot(function(s : ISlot0) : Bool {
			return listenerEquals(s.listener, func);
		});

		return o;
	}

	override public function removeAll() : Void {
		_list = Nil.list();
	}

	public function dispatch() : Void {
		var slots = _list;
		while(slots.nonEmpty) {
        	slots.head.execute();
        	slots = slots.tail;
      	}
	}

	public function productElement(index : Int) : Dynamic {
		return _list.productElement(index);
	}

	public function listenerEquals(func0 : Void -> Void, func1 : Void -> Void) : Bool {
		return if(func0 == func1) {
			true;
		}
		#if js
		else if(	Reflect.hasField(func0, 'scope') &&
					Reflect.hasField(func1, 'scope') &&
					Reflect.field(func0, 'scope') == Reflect.field(func1, 'scope') &&
					Reflect.field(func0, 'method') == Reflect.field(func1, 'scope')) {
			true;
		}
		#end
		else {
			false;
		}
	}

	private function registerListener(func : Void -> Void, once : Bool) : Option<ISlot0> {
		if(registrationPossible(func, once)) {
			var slot : ISlot0 = new Slot0(this, func, once);
			_list = _list.prepend(slot);
			return Some(slot);
		}

		return _list.find(function(s : ISlot0) : Bool {
			return listenerEquals(s.listener, func);
		});
	}

	private function registrationPossible(func : Void -> Void, once : Bool) : Bool {
		if(!_list.nonEmpty) {
			return true;
		}

		var slot = _list.find(function(s : ISlot0) : Bool {
			return listenerEquals(s.listener, func);
		});

		return switch(slot) {
			case None: true;
			case Some(x):
				if(x.once != once) {
					throw new IllegalOperationError('You cannot addOnce() then add() the same " +
					 "listener without removing the relationship first.');
				}
				false;
		}
	}

	override private function get_size() : Int {
		return _list.size;
	}
}