package funk.actors.dispatch;

import funk.types.AnyRef;

using funk.Funk;

enum Envelope {
    Envelope(message : AnyRef, sender : ActorRef);
}

class EnvelopeTypes {

    public static function message(envelope : Envelope) : AnyRef {
        return switch (envelope) {
            case Envelope(message, _): message;
        }
    }

    public static function sender(envelope : Envelope) : ActorRef {
        return switch (envelope) {
            case Envelope(_, sender): sender;
        }
    }
}
