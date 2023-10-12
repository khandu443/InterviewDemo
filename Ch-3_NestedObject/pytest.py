object = {'a':{'b':{'c':'d'}}}

try:
    Keys = object['a']['b']['c']
    print(Keys)  
    print('Test -1 : Pass')
except KeyError:
    print('Test 1 : Failed The specified key does NOT existt')


try:
    result = object['a']['b']['c']
    print('Test 2 : Pass')
except KeyError:
    print('Test 2 : Failed - The specified key does NOT exist')
