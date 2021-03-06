package support;

class Bounds {

    public var x(get_x, set_x) : Float;

    public var y(get_y, set_y) : Float;

    public var width(get_width, set_width) : Float;

    public var height(get_height, set_height) : Float;

    private var _x : Float;

    private var _y : Float;

    private var _width : Float;

    private var _height : Float;

    public function new() {
        _x = 0;
        _y = 0;
        _width = 0;
        _height = 0;
    }

    public function copy(value : Bounds) : Void {
        _x = value.x;
        _y = value.y;
        _width = value.width;
        _height = value.height;
    }

    public function isEmpty() : Bool {
        return _x == 0 && _y == 0 && _width == 0 && _height == 0;
    }

    public function toRectangle() : Rectangle {
        return Rectangle(_x, _y, _width, _height);
    }

    private function get_x() : Float {
        return _x;
    }

    private function set_x(value : Float) : Float {
        if (_x != value) {
            _x = value;
        }
        return _x;
    }

    private function get_y() : Float {
        return _y;
    }

    private function set_y(value : Float) : Float {
        if (_y != value) {
            _y = value;
        }
        return _y;
    }

    private function get_width() : Float {
        return _width;
    }

    private function set_width(value : Float) : Float {
        if (_width != value) {
            _width = value;
        }
        return _width;
    }

    private function get_height() : Float {
        return _height;
    }

    private function set_height(value : Float) : Float {
        if (_height != value) {
            _height = value;
        }
        return _height;
    }
}
