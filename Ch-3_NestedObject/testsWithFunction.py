def dict_keys(dictionary, keys):
    tempt_dict = dictionary

    for key in keys:
        try:
            tempt_dict = tempt_dict[key]
        except KeyError:
            return False
    return True

object = {'a':{'b':{'c':'d'}}}

# Print true if Key Exists
print(
    dict_keys(object, ['a', 'b', 'c'])
)


# Print False if Key Doesn't Exists
print(
    dict_keys(object, ['a', 'b', 'c'])
)
