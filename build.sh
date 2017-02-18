#!/bin/bash

for project in $(ls -d *)
do
    echo '--- '$project' ---'
    cd $project
    (./autogen.sh && \
        ./configure; \
    if [ "$project" == "pulseview" ];then cmake . ;fi; \
    make \
    sudo make install ) | sed "s/^/$project: /"
    cd -
done

udev_install() {
    sudo cp ./libsigrok/contrib/z60_libsigrok.rules /etc/udev/rules.d/
}
