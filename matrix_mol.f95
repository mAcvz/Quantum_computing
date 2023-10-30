program matrix_mul
    implicit none

    !
    real(kind = 8) :: start_time, end_time, elapsed_time
    !
    real( kind = 4) , allocatable :: aa(:,:),bb(:,:),cc(:,:)
    integer ( kind = 2 ) :: dim = 5
    ! allocate the matrixes 
    allocate(aa(dim,dim))
    allocate(bb(dim,dim))
    allocate(cc(dim,dim))
    ! Initialize the matrix (cc) with zeros
    cc = 0.0
    ! Initialize the matrixes aa and bb with random values
    call random_seed()  ! Initialize the random number generator
    call random_number(aa)
    call random_number(bb)

    call cpu_time(start_time)
    call matrix_molt(aa,bb,cc)
    call cpu_time(end_time)
    elapsed_time = end_time - start_time
    print*, elapsed_time

    
    contains 

    ! subroutine to compute simple matrix multiplication
    subroutine matrix_molt(a1,b1,result)

        real( kind = 4 ), allocatable :: a1(:,:),b1(:,:)
        real( kind = 4 ), allocatable :: result(:,:)
        integer( kind = 4) :: ii,jj,kk,dim1
        dim1 = size(a1,2)  ! get the numbers of rows

        do ii = 1, dim1
            do jj = 1, dim1
              result(ii, jj) = 0.0
              do kk = 1, dim1
                result(ii, jj) = result(ii, jj) + a1(ii, kk) * b1(kk, jj)
              end do
            end do
        end do 
    end subroutine matrix_molt

      
end program matrix_mul