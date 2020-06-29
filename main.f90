program main
use const
use task
implicit none

    real(mp), allocatable :: A(:,:)
    integer :: x1, y1, x2, y2
    integer :: n, m
    integer(4) :: mpiErr, mpiSize, mpiRank

    open(1, file = './data.dat')
    read(1, *) m, n
    allocate( A(m,n) )

    read(1, *) A

    call mpi_init(mpiErr)

    call mpi_comm_size(MPI_COMM_WORLD, mpiSize, mpiErr)
    call mpi_comm_rank(MPI_COMM_WORLD, mpiRank, mpiErr)

    call GetMaxCoordinates(A, x1, y1, x2, y2, mpiErr)

    if(mpiRank == 0) then
        write(*,'(a, i5)') '# y1', y1
        write(*,'(a, i5)') '# y2', y2
        write(*,'(a, i5)') '# x1', x1
        write(*,'(a, i5)') '# x2', x2

        write(*,*) 'control sum:', sum(A(x1:x2, y1:y2))
    end if

    call mpi_finalize(mpiErr)

    deallocate(A)
end program
