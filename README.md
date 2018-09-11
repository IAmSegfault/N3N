# N3N
An injective mapping of integer vectors to integers in lua.

>Maximum values are (-17,-17,-17) to (18,18,18) for 3 dimensional mappings and 
>(-27, -27) to (28, 28) for 2 dimensional mappings.
>The maximum absolute value of the magic number is 68719476735.

### How to use:
1. Git clone into your project directory.
2. Set magic to a magic number of your choosing.
3. injection = require("N3N.Injection")
4. n = injection.map(x,y,z)
