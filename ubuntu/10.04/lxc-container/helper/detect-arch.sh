#1/bin/sh

arch=$(uname -m)
case ${arch} in
    i?86) arch=i386 ;;
    x86_64) arch=amd64 ;;
esac

echo ${arch}
exit 0
