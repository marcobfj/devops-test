#! /bin/bash 
IMAGE=/user/local/app/src/assets/congrats.jpg
if test -f "$IMAGE"; then
    echo "$IMAGE exists."
    sed -i 's/Cumpliste_Reto.svg/congrats.jpg/g' /user/local/app/src/app/app.component.scss
else
    echo "$IMAGE do not exists"
fi

sed -i 's/white/black/g' /user/local/app/src/app/app.component.scss