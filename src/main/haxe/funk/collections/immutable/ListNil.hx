package funk.collections.immutable;

import funk.collections.IList;
import funk.collections.IteratorUtil;
import funk.collections.immutable.List;
import funk.collections.immutable.Nil;
import funk.errors.NoSuchElementError;
import funk.errors.RangeError;
import funk.product.Product1;
import funk.option.Option;
import funk.tuple.Tuple2;
import funk.util.Require;

using funk.collections.IteratorUtil;
using funk.collections.immutable.Nil;
using funk.option.Option;
using funk.tuple.Tuple2;
using funk.util.Require;

class ListNil<T> extends Product1<T>, implements IList<T> {
	
	public var nonEmpty(get_nonEmpty, never) : Bool;

	public var head(get_head, never) : T;
	
	public var headOption(get_headOption, never) : Option<T>;

	public var indices(get_indices, never) : IList<Int>;

	public var init(get_init, never) : IList<T>;

	public var isEmpty(get_isEmpty, never) : Bool;

	public var last(get_last, never) : Option<T>;

	public var reverse(get_reverse, never) : IList<T>;

	public var tail(get_tail, never) : IList<T>;
	
	public var tailOption(get_tailOption, never) : Option<IList<T>>;

	public var zipWithIndex(get_zipWithIndex, never) : IList<ITuple2<T, Int>>;
	
	public var size(get_size, never) : Int;
	
	public var hasDefinedSize(get_hasDefinedSize, never) : Bool;
	
	public var toArray(get_toArray, never) : Array<T>;
	
	public var flatten(get_flatten, never) : IList<T>;
	
	public function new() {
		super();
	}
	
	public function contains(value : T) : Bool {
		return false;
	}
	
	public function count(f : (T -> Bool)) : Int {
		return 0;
	}
	
	public function drop(n : Int) : IList<T> {
		require("n must be positive.").toBe(n >= 0);
		
		return nil.list();
	}
	
	public function dropRight(n : Int) : IList<T> {
		require("n must be positive.").toBe(n >= 0);
		
		return nil.list();
	}
	
	public function dropWhile(f : (T -> Bool)) : IList<T> {
		return nil.list();
	}
	
	public function exists(f : (T -> Bool)) : Bool {
		return false;
	}
	
	public function filter(f : (T -> Bool)) : IList<T> {
		return nil.list();
	}
	
	public function filterNot(f : (T -> Bool)) : IList<T> {
		return nil.list();
	}
	
	public function find(f : (T -> Bool)) : Option<T> {
		return None;
	}
	
	public function flatMap(f : (T -> IList<T>)) : IList<T> {
		return nil.list();
	}
	
	public function foldLeft(x : T, f : (T -> T -> T)) : T {
		return x;
	}
	
	public function foldRight(x : T, f : (T -> T -> T)) : T {
		return x;
	}
	
	public function forall(f : (T -> Bool)) : Bool {
		return false;
	}
	
	public function foreach(f : (T -> Void)) : Void {
	}
	
	public function get(index : Int) : Option<T> {
		return None;
	}
	
	public function map(f : (T -> T)) : IList<T> {
		return nil.list();
	}
	
	public function partition(f : (T -> Bool)) : ITuple2<IList<T>, IList<T>> {
		return tuple2(nil.list(), nil.list()).instance();
	}
	
	public function prepend(value : T) : IList<T> {
		return new List<T>(value, this);
	}
	
	public function prependAll(value : IList<T>) : IList<T> {
		return value;
	}
	
	public function reduceLeft(f : (T -> T -> T)) : Option<T> {
		return None;
	}
	
	public function reduceRight(f : (T -> T -> T)) : Option<T> {
		return None;
	}
	
	public function take(n : Int) : IList<T> {
		require("n must be positive.").toBe(n >= 0);
		
		return nil.list();
	}
	
	public function takeRight(n : Int) : IList<T> {
		require("n must be positive.").toBe(n >= 0);
		
		return nil.list();
	}
	
	public function takeWhile(f : (IList<T> -> Bool)) : IList<T> {
		return nil.list();
	}
	
	public function zip(that : IList<T>) : IList<ITuple2<T, T>> {
		return nil.list();
	}
	
	public function findIndexOf(f: (T -> Bool)): Int {
		return -1;
	}
	
	public function indexOf(value : T) : Int {
		return -1;
	}
	
	public function prependIterator(iterator : Iterator<T>) : IList<T> {
		return iterator.toList();
	}
	
	public function prependIterable(iterable : Iterable<T>) : IList<T> {
		return iterable.iterator().toList();
	}
	
	public function append(value : T) : IList<T> {
		return new List<T>(value, this);
	}

	public function appendAll(value : IList<T>) : IList<T> {
		return value;
	}

	public function appendIterator(iterator : Iterator<T>) : IList<T> {
		return iterator.toList();
	}

	public function appendIterable(iterable : Iterable<T>) : IList<T> {
		return iterable.iterator().toList();
	}
	
	override public function productElement(i : Int) : Dynamic {
		throw new RangeError();
	}
	
	private function get_nonEmpty() : Bool {
		return false;
	}
	
	public function get_isEmpty() : Bool {
		return true;
	}
	
	private function get_head() : T {
		return null;
	}
	
	private function get_headOption() : Option<T> {
		return None;
	}
	
	private function get_indices() : IList<Int> {
		return nil.list();
	}
	
	private function get_init() : IList<T> {
		return nil.list();
	}
	
	private function get_last() : Option<T> {
		return None;
	}
	
	private function get_reverse() : IList<T> {
		return nil.list();
	}
	
	private function get_tail() : IList<T> {
		return null;
	}
	
	private function get_tailOption() : Option<IList<T>> {
		return None;
	}
	
	private function get_zipWithIndex() : IList<ITuple2<T, Int>> {
		return nil.list();
	}
	
	private function get_size() : Int {
		return 0;
	}
	
	private function get_hasDefinedSize() : Bool {
		return true;
	}

	private function get_toArray() : Array<T> {
		return [];
	}
	
	private function get_flatten() : IList<T> {
		return nil.list();
	}
	
	private function get_iterator() : Iterator<Dynamic> {
		return new NilIterator<Dynamic>();
	}
	
	override private function get_productArity() : Int {
		return 0;
	}

	override private function get_productPrefix() : String {
		return "List";
	}
}