# comment out to overwrite all files
# set -o noclobber

echo "Do you want to reference the generated files? (y/n)"
read refGen

if [ $refGen == "n" ]
then
    echo "Do you want to reference the builder option files? (y/n)"
    read refOpt
fi

function uncommentPart() {
    part=$1
    if [ -z "$part" ]; then
        echo "No part specified"
        return
    fi

    path=$2
    if [ -z "$path" ]; then
        echo "No path specified"
        return
    fi

    oldPart="// part '$part.dart'"
    newPart="part '$part.dart'"
    sed -r -i '' "s-$oldPart-$newPart-" $path

}

for f in ../fixture/*.dart
do

    if [[ $f == *".g.dart" ]]
        then continue
    fi

    if [[ $f == *".freezed.dart" ]]
        then continue
    fi

    path=${f:3}
    path=../$path

    IFS='/' read -ra LOC <<< "$path"
    fileName=${LOC[${#LOC[@]} - 1]}

    name=${fileName%.dart}

    echo $name

    oldPart="^((//) )*part"
    newPart="// part"
    sed -r -i '' "s-$oldPart-$newPart-" $path

    uncommentPart "$name.g" $path

    if [ $refGen == "y" ]
    then
        uncommentPart "$name.ice" $path
    else
        if [ $refOpt == "y" ]
        then
            uncommentPart "fixtures/${name}_bld_opt" $path
        else
            uncommentPart "fixtures/$name" $path
        fi
    fi

done