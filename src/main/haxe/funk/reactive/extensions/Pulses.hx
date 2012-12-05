package funk.reactive.extensions;

import funk.reactive.Pulse;
import funk.types.Function1;

class Pulses {

	public static function time<T>(pulse : Pulse<T>) : Float {
		return Type.enumParameters(pulse)[0];
	}

	public static function value<T>(pulse : Pulse<T>) : T {
		return Type.enumParameters(pulse)[1];
	}

	public static function map<T, E>(pulse : Pulse<T>, func : Function1<T, E>) : Pulse<E> {
		return withValue(pulse, func(value(pulse)));
	}

	public static function withValue<T, E>(pulse : Pulse<T>, value : E) : Pulse<E> {
		return Pulse(time(pulse), value);
	}
}
