# comment out to overwrite all files
# set -o noclobber

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


    echo $path

    # un comment comment ice part path
    oldPart="// part"
    newPart="part"
    sed -i '' "s+$oldPart+$newPart+" $path

    # comment the fixture part path
    oldPart="part 'fixtures"
    newPart="// part 'fixtures"
    sed -i '' "s+$oldPart+$newPart+" $path

done