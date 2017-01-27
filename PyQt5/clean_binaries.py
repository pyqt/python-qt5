import os

# To prevent accidents
assert os.getcwd().endswith("PyQt5"), "Run this within your PyQt5 directory"

for root, dirnames, fnames in os.walk("."):
    for fname in fnames:
        if fname.endswith((".pdb", "d.dll")):
            fpath = os.path.join(root, fname)
            print "Removing %s" % fpath
            os.remove(fpath)

print "Finished"
