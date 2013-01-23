package ;

import funk.collections.immutable.List;
import funk.collections.immutable.extensions.ListsUtil;
import funk.types.Function1;
import funk.types.Pass;
import funk.types.Wildcard;
import support.CanvasPainter;
import support.Layer;
import CommonJS;
import UserAgentContext;

using funk.collections.immutable.extensions.Lists;
using funk.types.extensions.Tuples2;
using support.HtmlWildcards;

class Example01 {

    public function new() {
        CanvasPainter.init(getCanvas());

        // Create a list of 6 layers instances.
        var layers = ListsUtil.fill(6)(Pass.instanceOf(Layer));

        // Map the layers to their styles object and apply a
        // function on each of them.
        layers.map(_.context()).foreach(function(c) {
            c.fillStyle("#00ffff");
            c.fillRect(0, 0, 20, 20);
        });

        // Combine the Layers objects with their index, resulting
        // in a List.&lt;Tuple2.&lt;Layer, Int&gt;&gt;
        //
        // Apply a function on each tuple in order to position the
        // sprite based on its index in the list.
        layers.zipWithIndex().foreach(function(tuple) {
            var element : Layer = tuple._1();
            var index : Int = tuple._2();

            var pos = index * 21;

            element.x = pos;
            element.y = pos;
        });

        // Add all layers to the dom
        layers.foreach(_.addLayer(getCanvas()));
    }

    public function getCanvas() : HTMLCanvasElement {
        return CommonJS.getHtmlDocument().body.getElementsByTagName('canvas')[0];
    }

    public static function main() {
        new Example01();
    }
}