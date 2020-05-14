program main
! генератор двух случайных матриц nxm
    integer :: n, m
    real(mp), allocatable :: x(:,:)
    
    write(*, '(a40)', advance = 'no') 'Enter the N - number of rows: '
    read(*, *) n
    
    write(*, '(a40)', advance = 'no') 'Enter the M - number of columns: '
    read(*, *) m
    
    open(1, file = 'data.dat') !файлы, куда они выводятся 

    write(1, '(a, 1x, i6)') "#", n
    
    allocate(x(n,m))
    
    call random_number(x)
    
    write(1, *) ( (5-10*x(i,:)), new_line('c'), i = 1,n)


end program
