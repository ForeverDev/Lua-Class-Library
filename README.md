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

