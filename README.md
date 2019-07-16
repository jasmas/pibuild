# pibuild

My pi build environment based on docker-compose.

Example to build default kernel:
```
./pibuild
git clone --depth=1 $PISOURCE
cd linux/
make $DEFCONFIG
make $ALL
```
