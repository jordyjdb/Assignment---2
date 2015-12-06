# Assignment---2
Using batch script to show files/folders information inside a directory, such as size and name

So the assignemnt wants the me to create a batch script that will show the size of each file inside the directory, followed by the the percentage of the file with recursive directorys. It wants me to do it in the form of hashes, I have determined that the amount of hashes next to each folder depends on this formula:

individual hash size in MB (i) = (total size of directory(T))/(total amount of hashes used(t))

amount of hashes for a folder in MB(h) = (folder size(s)) \ (individiual hash size in MB(i))

therfore: i = T/t

h = s\i

h = s\(T/t)

an example would be:

Folder (games) - 975MB
- (fallout) - 500MB 
- (mario64) - 300MB
- (Minecraft) - 100MB
- (sims 4) - 75MB

for finding out the number of hashes mario64 has:

975/20(number of hashes used) = 48.75

300\48.75 = 6 (no remainder as cant show half a hash)


