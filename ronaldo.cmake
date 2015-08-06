# The serial Intel compilers
set(COMPILER_DIR /share/apps/intel/Compiler/12.1/composer_xe_2011_sp1.7.256/bin/intel64)
set(CMAKE_C_COMPILER       ${COMPILER_DIR}/icc)
set(CMAKE_CXX_COMPILER     ${COMPILER_DIR}/icpc)
set(CMAKE_Fortran_COMPILER ${COMPILER_DIR}/ifort)

# The MPI wrappers for the C and C++ compilers
set(MPI_COMPILER_DIR /share/apps/intel_12.1/openmpi/bin)
set(MPI_C_COMPILER       ${MPI_COMPILER_DIR}/mpicc)
set(MPI_CXX_COMPILER     ${MPI_COMPILER_DIR}/mpicxx)
set(MPI_Fortran_COMPILER ${MPI_COMPILER_DIR}/mpif90)

set(MKLROOT "/share/apps/intel/Compiler/12.1/mkl")
set(MPI_C_INCLUDE_PATH      	"/share/apps/intel_12.1/openmpi/include")
set(MPI_CXX_INCLUDE_PATH     ${MPI_C_INCLUDE_PATH})
set(MPI_Fortran_INCLUDE_PATH ${MPI_C_INCLUDE_PATH})
set(MPI_LINK_FLAGS "-L/share/apps/intel_12.1/openmpi/lib -L/usr/lib64")
set(MPI_BASE_LIBS 
    "-lmpi -lpthread -libverbs -libumad -ldl -lrt")
set(MPI_C_LIBRARIES "-limf -lmpi ${MPI_BASE_LIBS}")
set(MPI_CXX_LIBRARIES "-limf -lmpi ${MPI_BASE_LIBS}")
set(MPI_Fortran_LIBRARIES "-limf -lmpi_f90 -lmpi_f77 ${MPI_BASE_LIBS}")
set(MPI_C_COMPILE_FLAGS "")
set(MPI_CXX_COMPILE_FLAGS " -DMKL_ILP64 -openmp -I${MKLROOT}/include")
set(MPI_Fortran_COMPILE_FLAGS " -DMKL_ILP64 -openmp -I${MKLROOT}/include ${MPI_LINK_FLAGS} ${MPI_Fortran_LIBRARIES}")

if(CMAKE_BUILD_TYPE MATCHES PureDebug OR
   CMAKE_BUILD_TYPE MATCHES HybridDebug)
  set(CXX_FLAGS "-g")
else()
  set(CXX_FLAGS "-O3")
endif()

set(OpenMP_CXX_FLAGS "-openmp")

set(MATH_LIBS "-L/share/apps/intel/Compiler/12.1/composer_xe_2011_sp1.7.256/mkl/lib/intel64 -L${MKLROOT}/lib/intel64 -mkl=parallel -lm -lmkl_rt -lmkl_intel_thread -lmkl_gf_lp64 -lmkl_scalapack_lp64 -lmkl_intel_lp64 -lmkl_core -lmkl_blacs_openmpi_lp64 -lpthread -lmkl_intel_sp2dp")
