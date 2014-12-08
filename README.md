Lua Class Library
=================

This is a Lua module that allows you to simulate classes and <b>OOP</b> programming.

<h1>Loading the Library</h1>

The library can be loaded using <b>require</b>.
```lua
local class = require(path_to_file)
```

<h1>Using the Library</h1>
To define a new class, call the required file.
```lua
local class = require(path_to_file)
local Animal = class() --classes should be in UpperCamelCase
```
Calling the required file returns a new class.  To create an object of this class, simply call the class itself.
```lua
local class = require(path_to_file)
local Animal = class()
local pedro = Animal()
```
Now you have a new Animal object!  However, that isn't very exciting when there are no Animal methods.  One important feature of this library is the <b>init</b> method.  This method is automatically called when you declare a new object.  To pass objects into the <b>init</b> method, pass them as parameters when you define a new object.  For example:
```lua
local class = require(path_to_file)
local Animal = class()

--here, we define the init method of Animal
function Animal:init(age)
  --the self keyword can be used to refer to the object
  self.age = age
end

local pedro = Animal(7) --create a new animal, pass '7' as the age
print(pedro.age) --> prints out '7'
```
Now we know the basics of the library.  However, this wouldn't be a class system without inheritance!
To extend a class to another class, do the following:
```lua
local class = require(path_to_file)
local ClassOne = class()
local ClassTwo = class()
ClassTwo.extends = ClassOne --extend ClassTwo to ClassOne, now ClassTwo has all method that ClassOne has
```
Finally, you define a method the same way you define the <b>init</b> method.
```lua
local class = require(path_to_file)
local Dog = class()

function Dog:init(name)
  self.name = name
end

--here, we define the method 'bark'
function Dog:bark()
  print(self.name .. " barked!")
end

local pedro = Dog "Pedro" --create a new class, pass "Pedro" as the name argument
pedro:bark() --> 'Pedro barked!'
```
<h1>Some Examples</h1>
```lua
local class = require(path_to_file)
local Vector = class() --define a Vector class

function Vector:init(x, y)
  self.x = x
  self.y = y
end

function Vector:magnitude()
  return math.sqrt(self.x ^ 2 + self.y ^ 2)
end

--this method will go into Vector's metatable!
function Vector.__add(self, other_vector) --'self' must be the first argument in a metatable method
  return Vector(self.x + other_vector.x, self.y + other_vector.y)
end

--this method will also go into Vector's metatable!
function Vector.__tostring(self)
  return "[" .. self.x .. ", " .. self.y .. "]"
end
```
