# sets.elv - Set operations.

# Creates a new set from a list, removing duplicates.
fn new {|@elements|
    unique $@elements
}

# Returns a new set containing all unique elements from two sets.
fn union {|$set1 $set2|
    new { $@set1 $@set2 }
}

# Returns a new set containing elements present in both sets.
fn intersection {|$set1 $set2|
    new { each {|e| if (contains $set2 $e) { put $e } } $@set1 }
}

# Returns a new set containing elements present in the first set but not in the second.
fn difference {|$set1 $set2|
    new { each {|e| if (not (contains $set2 $e)) { put $e } } $@set1 }
}

# Checks if the first set is a subset of the second set.
fn issubset {|$set1 $set2|
    all { each {|e| contains $set2 $e } } $@set1
}

# Checks if the first set is a superset of the second set.
fn issuperset {|$set1 $set2|
    issubset $set2 $set1
}
