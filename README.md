# sonic-sairedis-synd-dev

# Build sonic-swss-common first

- Get source code
> `git clone --recursive https://github.com/charleschou56/sonic-swss-common.git sonic-swss-common
cd sonic-swss-common`

- Install dependency
> `sudo apt-get update`<br>
`sudo apt-get install python`<br>
`sudo apt-get install libpython2.7-dev`<br>
`sudo apt-get install libnl-genl-3-dev`<br>
`sudo apt-get install libnl-route-3-dev`<br> 
`sudo apt-get install swig3.0`<br>
`sudo apt-get install cmake pkg-config`<br>

- Install tool

> `sudo apt-get install make libtool m4 autoconf dh-exec debhelper cmake pkg-config libhiredis-dev libnl-3-dev libnl-genl-3-dev libnl-route-3-dev swig3.0 libpython2.7-dev libgtest-dev`

- Build gtest
>$ sudo apt-get install cmake libgtest-dev<br>
$ cd /usr/src/gtest && sudo cmake . && sudo make

- Compile sonic-swss-common
> ./autogen.sh<br>
./configure<br>
make && sudo make install

# Build sonic-sairedis
- Prepare swss-common include files and library
> sh copy-swss-header-file-and-library.sh

- Get source code
> `git clone --recursive https://github.com/charleschou56/sonic-sairedis.git sonic-sairedis
cd sonic-sairedis`

- Intall dependency
> `apt-get update`<br>
> `apt-get install vim`<br>
> `apt-get install libtool autoconf automake dh-exec`<br>
> `apt-get install doxygen`<br>
> `apt-get install graphviz`<br>
> `apt-get install libxml-simple-perl`<br>
> `apt-get install aspell`<br>
> `apt-get install libhiredis0.13`<br>
> `apt-get install libhiredis-dev`<br>

- Patch sonic-sairedis/configure.ac
> Refer to configure.ac.diff

- Build sonic-sairedis
> export PERL5LIB=${path_of_sonic-sairedis}/SAI/meta<br>
> ./autogen.sh<br>
./configure --with-sai=vs CPPFLAGS="-I<path\of\swss-common>/include" LDFLAGS="-L<path\of\swss-common>/lib"
