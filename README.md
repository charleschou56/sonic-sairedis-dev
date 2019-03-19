# sonic-sairedis-synd-dev

# Build sonic-swss-common first

- Get source code
> git clone https://github.com/Azure/sonic-swss-common.git  
cd sonic-swss-common

- Install dependency
> sudo apt-get update  
sudo apt-get install cmake  
sudo apt-get install make  
sudo apt-get install libtool  
sudo apt-get install m4  
sudo apt-get install autoconf  
sudo apt-get install dh-exec  
sudo apt-get install debhelper  
sudo apt-get install pkg-config  
sudo apt-get install python  
sudo apt-get install swig3.0  
sudo apt-get install libpython2.7-dev  
sudo apt-get install libnl-genl-3-dev  
sudo apt-get install libnl-route-3-dev  
sudo apt-get install libhiredis-dev  
sudo apt-get install libnl-3-dev  
sudo apt-get install libgtest-dev  

- Build gtest
>cd /usr/src/gtest && sudo cmake . && sudo make

- Compile sonic-swss-common
> ./autogen.sh  
./configure  
make && sudo make install  

# Build sonic-sairedis
- Prepare swss-common include files and library
> sh copy-swss-header-file-and-library.sh

- Get source code
> git clone --recursive https://github.com/Azure/sonic-sairedis.git  
cd sonic-sairedis  

- Intall dependency
> sudo apt-get install automake  
sudo apt-get install doxygen  
sudo apt-get install graphviz  
sudo apt-get install libxml-simple-perl  
sudo apt-get install aspell  
sudo apt-get install libhiredis0.13  

- Patch sonic-sairedis/configure.ac
> Apply to configure.ac.diff

- Build sonic-sairedis
> export PERL5LIB=$PERL5LIB:${path_of_sonic-sairedis}/SAI/meta  
> ./autogen.sh  
./configure --with-sai=vs CPPFLAGS="-I<prefix\of\swss-common>/include" LDFLAGS="-L<prefix\of\swss-common>/lib"  
