module task
use const
implicit none
contains

subroutine GetMaxCoordinates(A, x1, y1, x2, y2)
    real(mp), intent(in), dimension(:,:) :: A
    integer(4), intent(out) :: x1, y1, x2, y2
    integer(4) :: n, L, R, Up, Down, m, tmp
    real(mp), allocatable :: current_column(:)
    real(mp) :: current_sum, max_sum

    m = size(A, dim = 1) 
    n = size(A, dim = 2) 

    allocate(current_column(m))

    x1 = 1
    y1 = 1
    x2 = 1
    y2 = 1
    max_sum = A(1, 1)

    do L = 1, n
        current_column = A(:, L)

        do R = L, n
            if (R > L) then
                current_column = current_column + A(:, R)
            endif 
            
            call FindMaxInArray(current_column, current_sum, Up, Down)

            ! write(*,*) '    max_sum =', max_sum 
            ! write(*,*) 'current_sum =', current_sum

            if (current_sum > max_sum) then
                ! write(*,*) 'get!', x1, y1, x2, y2
                
                max_sum = current_sum
                x1 = Up
                x2 = Down
                y1 = L
                y2 = R
            endif
        end do
    end do
    deallocate(current_column)
end subroutine

subroutine FindMaxInArray(A, Summ, Up, Down)
    real(mp), intent(in), dimension(:) :: A
    integer(4), intent(out) :: Up, Down
    real(mp), intent(out) :: Summ
    real(mp) :: cur_sum
    integer(4) :: minus_pos, i

    Summ = A(1)
    Up = 1
    Down = 1
    cur_sum = 0
    minus_pos = 0

    do i = 1, size(A)
        ! write(*,*) '#I -------', i
        ! write(*,*) '   A(i) =', A(i)
        ! write(*,*) 'cur_sum =', cur_sum

        cur_sum = cur_sum + A(i)
        if (cur_sum > Summ) then
            Summ = cur_sum
            Up = minus_pos + 1
            Down = i
        endif
        
        if (cur_sum < 0) then
            cur_sum = 0
            minus_pos = i
        endif
    enddo
end subroutine

end module