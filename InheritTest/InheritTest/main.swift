protocol Human {
    func go()
}

class Person: Human {
    func go() {
        print("go")
    }
}

class Girl: Person, Human {

}

class Boy: Person {
    
}
