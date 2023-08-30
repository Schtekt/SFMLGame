#include "DummyClass.h"
#include <iostream>
#include <SFML/Graphics.hpp>

DummyClass::DummyClass()
{
    std::cout << "I am alive, fear me!\n";
    sf::RenderWindow window(sf::VideoMode(200, 200), "SFML works!");
    sf::CircleShape shape(100.f);
    shape.setFillColor(sf::Color::Green);

    while (window.isOpen())
    {
        sf::Event event;
        while (window.pollEvent(event))
        {
            if (event.type == sf::Event::Closed)
                window.close();
        }

        window.clear();
        window.draw(shape);
        window.display();
    }
}

DummyClass::~DummyClass()
{
    std::cout << "I am dead... or am I?\n";
}