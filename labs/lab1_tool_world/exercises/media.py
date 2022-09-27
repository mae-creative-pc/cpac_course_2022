#import json
#file_json = open("tatum.json")
#tatum = json.load(file_json)

tatum =  {'mat1': [30 10], 'mat2': [28, 10]}

def media(tatum):
    tot = 0
    cred = 0
    for value in tatum.items():
        tot += value[0]*value[1]
        cred += value[1]

    return tot/cred

media(tatum)