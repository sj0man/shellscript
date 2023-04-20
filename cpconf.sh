for src in `ls default-crater-*` ; do
    dest=`echo ${src} | sed -e 's/-crater-/-crater-nt98633-/g'`
    cp -av ${src} ${dest}
done
