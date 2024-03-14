# sets.elv - Set operations.

fn new {|@elements| unique $@elements }

fn union {|a b| new $a $b }

fn intersection {|a b|
    new { each {|e| if (contains $b $e) { put $e } } $@a }
}

fn difference {|a b|
    new { each {|e| if (not (contains $b $e)) { put $e } } $@a }
}

fn is-subset {|a b|
    all { each {|e| contains $b $e } } $@a
}

fn is-superset {|a b| issubset $b $a }