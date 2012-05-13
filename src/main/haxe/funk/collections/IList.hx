package funk.collections;

import funk.product.Product1;
import funk.option.Option;
import funk.tuple.Tuple2;

interface IList<T> implements IProduct1<T>, implements ICollection<T> {

    var nonEmpty(dynamic, never): Bool;
	
    var flatten(dynamic, never): IList<T>;
	
    var head(dynamic, never): Option<T>;

    var indices(dynamic, never): IList<Int>;

    var init(dynamic, never): IList<T>;

    var isEmpty(dynamic, never): Bool;

    var last(dynamic, never): Option<T>;
	
	var reverse(dynamic, never): IList<T>;

    var tail(dynamic, never): Option<IList<T>>;
	
	var zipWithIndex(dynamic, never): IList<T>;
	
    function contains(value: T): Bool;

    function count(f: (T -> Bool)): Int;

    function drop(n: Int): IList<T>;

    function dropRight(n: Int): IList<T>;

    function dropWhile(f: (T -> Bool)): IList<T>;

    function exists(f: (T -> Bool)): Bool;

    function filter(f: (T -> Bool)): IList<T>;

    function filterNot(f: (T -> Bool)): IList<T>;

    function find(f: (T -> Bool)): Option<T>;

    function findIndexOf(f: (T -> Bool)): Int;

    function flatMap(f: (T -> IList<T>)): IList<T>;

    function foldLeft(x: T, f: (T -> T -> T)): T;

    function foldRight(x: T, f: (T -> T -> T)): T;

    function forall(f: (T -> Bool)): Bool;

    function foreach(f: (T -> Void)): Void;

    function get(index: Int): Option<T>;

    function indexOf(value: T): Int;

    function map(f: (T -> T)): IList<T>;

    function partition(f: (T -> Bool)): ITuple2<IList<T>, IList<T>>;

    function prepend(value: T): IList<T>;

    function prependAll(value: IList<T>): IList<T>;

    function prependIterator(iterator: Iterator<T>): IList<T>;

    function prependIterable(iterable: Iterable<T>): IList<T>;

    function append(value: T): IList<T>;

    function appendAll(value: IList<T>): IList<T>;
    
    function appendIterator(iterator: Iterator<T>): IList<T>;

    function appendIterable(iterable: Iterable<T>): IList<T>;

    function reduceLeft(f: (T -> T -> T)): Option<T>;

    function reduceRight(f: (T -> T -> T)): Option<T>;
	
    function take(n: Int): IList<T>;

    function takeRight(n: Int): IList<T>;

    function takeWhile(f : (IList<T> -> Bool)) : IList<T>;

    function zip(that: IList<T>): IList<ITuple2<T, T>>;
}
