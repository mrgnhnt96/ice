# comment out to overwrite all files
# set -o noclobber

echo "Do the generated files use the builder options? (y/n)"
read answer
if [ "$answer" == "y" ]; then
    suffix="_bld_opt"
else
    suffix=""
fi

for f in ../fixture/*.ice.dart
do
    path=${f:3}
    path=../$path
    originalPath=$path
    path=${path%.ice.dart}.dart

    IFS='/' read -ra LOC <<< "$path"
    fileName=${LOC[${#LOC[@]} - 1]}
    path=${path%$fileName}fixtures/

    name=${fileName%.dart}
    echo $name

    fileName=$name$suffix

    directory=$path
    path=$path$fileName.dart

    mkdir -p $directory
    > $path

    cat $originalPath >> $path

        # update the part of path
    oldPart="part of '"
    newPart="part of '../"
    sed -i '' "s+$oldPart+$newPart+" $path

done