# comment out to overwrite all files
# set -o noclobber

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


    directory=$path
    path=$path$fileName

    mkdir -p $directory
    > $path

    cat $originalPath >> $path

    # echo "${originalPath} >> ${path}"
    content=$(cat $originalPath)

    echo "/*\n $content*/" > $originalPath

    # update the part of path
    oldPart="part of '"
    newPart="part of '../"
    sed -i '' "s+$oldPart+$newPart+" $path

    baseFile=${originalPath%.ice.dart}.dart

    # reference the fixture part path
    oldPart="// part"
    newPart="part"
    sed -i '' "s+$oldPart+$newPart+" $baseFile

    # comment ice part path
    oldPart="part '$name.ice.dart"
    newPart="// part '$name.ice.dart"
    sed -i '' "s+$oldPart+$newPart+" $baseFile

done