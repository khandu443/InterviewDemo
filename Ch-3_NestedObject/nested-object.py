

# object = {'a':{'b':{'c':'d'}}}
# print(object["a"] ["b"])


# object1 = {'x':{'y':{'z':'a'}}}

# print(object1["x"] ["y"] ["z"])


object = {'a':{'b':{'c':'d'}}}
keys = object.get('a', {}).get('b', {}).get('c')
print(keys)

object2 = {'x':{'y':{'z':'a'}}}
object2_keys = object2.get('x', {}).get('y', {}).get('z')
print(object2_keys) 
