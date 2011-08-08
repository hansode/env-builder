#1/bin/sh

arch=$(uname -m)
case ${arch} in
    i?86) arch=i386 ;;
esac

echo ${arch}
exit 0
