package funk.actors;

class ActorContext {

    public function new() {
    }

    public function actorOf(props : Props, name : String) : ActorRef {
        return null;
    }

    public function child(name : String) : Option<ActorRef> {
        return null;
    }

    public function children() : List<ActorRef> {
        return null;
    }

    public function parents() : ActorRef {
        return null;
    }

    public function props() : Props {
        return null;
    }

    public function self() : ActorRef {
        return null;
    }

    public function sender() : ActorRef {
        return null;
    }

    public function system() : ActorSystem {
        return null;
    }
}