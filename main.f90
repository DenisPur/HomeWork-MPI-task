program main
use const
use task

    implicit none
    real(mp), allocatable :: A(:,:)
    integer :: x1, y1, x2, y2
    integer :: n, m

    open(1, file = './data.dat')
    read(1, *) m, n
    allocate( A(m,n) )

    read(1, *) A

    call GetMaxCoordinates(A, x1, y1, x2, y2)

    write(*,'(a, i5)') '# y1', y1
    write(*,'(a, i5)') '# y2', y2
    write(*,'(a, i5)') '# x1', x1
    write(*,'(a, i5)') '# x2', x2

    write(*,*) 'control sum:', sum(A(x1:x2, y1:y2))

    deallocate(A)
end program
