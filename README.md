## About

This is from [this course](https://www.pluralsight.com/courses/rspec-ruby-application-testing).

This repository contains code that I've writen while watching and some personal notes.


### Things that I found intersting about this course

- It's made by one of the core team members
- .rspec (for parameters) scope and where it goes
    - Global ~/.rspec
    - Project ./.rspec (on your projects root)
    - Local ./.rspec-local (that can be gitignored)

### Concepts to wrap your mind around

- One branch / spec (didn't get that yet.)
- Focus on the expected behavior, not implementation.
- You should right for confidence, not for proof.
- Spec should only change when behaviour does (This one is powerful)
    - Example: Then you right a test for Card.new(suit: :spaces, rank: 10)
    - If anything changes about the parameters, it breaks!
    - That's why it's defined card method that encapsulates the creation of a card.
    - Considering that it can change to Card.build(suit: :space, rank: 10)