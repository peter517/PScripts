import sys
import os
sys.path.insert(0,os.path.join("gyp","pylib"))
try:
    import gyp 
except ImportError,e:
    print "import gyp error"
 
if __name__ == '__main__':
    print sys.argv
    args = sys.argv[1:]
    sys.exit(gyp.main(args)) 
