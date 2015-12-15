from mapreduce import MapReduce
import re
#-----------------------------------

class CharCount(MapReduce):

    def mapper(self, _, line):
        for char in line:
            yield (char,1)

    def combiner(self, key, values):
            yield key, sum(values)

    def reducer(self, key, values):
        yield key, sum(values)

#-----------------------------------
string = open('alice.txt').read()
CapitalString = string.upper()
FinalString = re.sub('[^A-Z]', '', CapitalString)

char = FinalString.replace(' ', '')
char = FinalString.strip().split('\n')

output = CharCount.run(char)
for item in output:
    print item
