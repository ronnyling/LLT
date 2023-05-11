#!/usr/bin/env python
from os.path import join, dirname
try:
    from robot.libdoc import libdoc
except Exception as e:
    print(e.__class__, "occured")
    def main():
        print ("Robot Framework 2.7 or later required for generating documentation")
else:
    def main():
        libdoc(join(dirname(__file__),'JSONLibrary'),
        join(dirname(__file__),'docs','JSONLibrary.html'))

if __name__ == '__main__':
    main()
