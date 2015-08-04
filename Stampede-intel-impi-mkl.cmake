# The serial Intel compilers
set(COMPILER_DIR /opt/apps/intel/15/composer_xe_2015.2.164/bin/intel64)
set(CMAKE_C_COMPILER       ${COMPILER_DIR}/icc)
set(CMAKE_CXX_COMPILER     ${COMPILER_DIR}/icpc)
set(CMAKE_Fortran_COMPILER ${COMPILER_DIR}/ifort)

# The MPI wrappers for the C and C++ compilers
set(MPI_COMPILER_DIR /opt/apps/intel15/impi/5.0.2.044/intel64/bin)
set(MPI_C_COMPILER       ${MPI_COMPILER_DIR}/mpicc)
set(MPI_CXX_COMPILER     ${MPI_COMPILER_DIR}/mpicxx)
set(MPI_Fortran_COMPILER ${MPI_COMPILER_DIR}/mpif90)

set(MPI_C_COMPILE_FLAGS "")
set(MPI_CXX_COMPILE_FLAGS "")
set(MPI_Fortran_COMPILE_FLAGS "")
set(MPI_C_INCLUDE_PATH      	"/opt/apps/intel15/impi/5.0.2.044/include64")
set(MPI_CXX_INCLUDE_PATH     ${MPI_C_INCLUDE_PATH})
set(MPI_Fortran_INCLUDE_PATH ${MPI_C_INCLUDE_PATH})
set(MPI_LINK_FLAGS "-Wl,-rpath,/opt/apps/limic2/0.5.5/lib -L/opt/apps/limic2/0.5.5/lib -L/opt/apps/intel15/impi/5.0.2.044/lib64 -L/opt/ofed/lib64/")
set(MPI_BASE_LIBS 
    "-lmpi -lpthread -libverbs -libumad -ldl -lrt")
set(MPI_C_LIBRARIES "-limf -lmpi ${MPI_BASE_LIBS}")
set(MPI_CXX_LIBRARIES "-limf -lmpi ${MPI_BASE_LIBS}")
set(MPI_Fortran_LIBRARIES "-limf -lmpiif ${MPI_BASE_LIBS}")

if(CMAKE_BUILD_TYPE MATCHES PureDebug OR
   CMAKE_BUILD_TYPE MATCHES HybridDebug)
  set(CXX_FLAGS "-g")
else()
  set(CXX_FLAGS "-O3")
endif()

set(OpenMP_CXX_FLAGS "-openmp")

set(MATH_LIBS "-L/opt/apps/intel/15/composer_xe_2015.2.164/mkl/lib/intel64/ -L/opt/apps/intel/15/composer_xe_2015.2.164/compiler/lib/intel64 -lmkl_scalapack_lp64 -lmkl_blacs_intelmpi_lp64 -lmkl_rt")
