@ECHO ON

set "CC=gcc.exe"
set "FC=gfortran.exe"

cmake %CMAKE_ARGS% ^
      -G "MinGW Makefiles" ^
      -S %SRC_DIR% ^
      -B build ^
      -D CMAKE_INSTALL_PREFIX="%LIBRARY_PREFIX%" ^
      -D CMAKE_BUILD_TYPE=Release ^
      -D CMAKE_C_FLAGS="%CFLAGS%" ^
      -D CMAKE_Fortran_FLAGS="%FFLAGS%" ^
      -D CMAKE_INSTALL_LIBDIR="lib" ^
      -D CMAKE_INSTALL_INCLUDEDIR="include" ^
      -D CMAKE_INSTALL_BINDIR="bin" ^
      -D CMAKE_INSTALL_DATADIR="share" ^
      -D BUILD_SHARED_LIBS=ON ^
      -D CMAKE_WINDOWS_EXPORT_ALL_SYMBOLS=ON ^
      -D CMAKE_GNUtoMS=ON ^
      -D ENABLE_OPENMP=OFF ^
      -D ENABLE_XHOST=OFF
if errorlevel 1 exit 1

cmake --build build ^
      --config Release ^
      --target install ^
      -- -j %CPU_COUNT%
if errorlevel 1 exit 1

:: no independent tests
