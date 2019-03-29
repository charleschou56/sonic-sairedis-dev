# sonic-sairedis-synd-dev

## Get source code
```
git clone --recursive https://github.com/charleschou56/sonic-sairedis-syncd-dev.git  
cd sonic-sairedis-syncd-dev
```

# Install tools
```
sh shell/install_tools.sh
```

# Install dependencies
```
sh shell/install_dependencies.sh
```

# Build the test environment
```
sh shell/build.sh
```

## Create build environment and build
```
mkdir -p <build dir> && cd <build_dir>  
cmake <source_dir> 
make
```
