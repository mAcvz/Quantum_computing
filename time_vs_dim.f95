program matrix_mul
    implicit none
    !
    real(kind = 8) :: start_time, end_time, elapsed_time
    !
    real( kind = 4) , allocatable :: aa(:,:),bb(:,:),cc(:,:)
    integer ( kind = 2 ) :: dim_max = 3000, dim_i 
    !
    ! file information 
    character( 17 ) :: filename_1 = "time_vs_dim_1.txt"
    character( 17 ) :: filename_2 = "time_vs_dim_2.txt"
    integer( kind = 2) :: unit_1 = 10
    integer( kind = 2) :: unit_2 = 11
    !
 
    ! Open the file
    open(unit_1, file = filename_1, status = 'replace')
    open(unit_2, file = filename_2, status = 'replace')
    !
    do dim_i = 100 , dim_max,50
      ! allocate the matrixes 
      allocate(aa(dim_i,dim_i))
      allocate(bb(dim_i,dim_i))
      allocate(cc(dim_i,dim_i))
      ! Initialize the matrix (cc) with zeros
      cc = 0.0
      ! Initialize the matrixes aa and bb with random values
      call random_seed()  ! Initialize the random number generator
      call random_number(aa)
      call random_number(bb)
      !
      call cpu_time(start_time)
      call matrix_molt(aa,bb,cc)
      call cpu_time(end_time)
      elapsed_time = end_time - start_time
      print*,"s", elapsed_time
      !
      ! Write data to the file 1 
      write(unit_1, *) dim_i, " , " , elapsed_time
      !
      !Perform matrix multiplication using MATMUL
      call cpu_time(start_time)
      cc = matmul(aa, bb)
      call cpu_time(end_time)
      elapsed_time = end_time - start_time
      print*,"m", elapsed_time

      !
      ! Write data to the file 2
      write(unit_2, *) dim_i, " , " , elapsed_time
      !
      ! Deallocate the matrixes when they are no longer needed
      deallocate(aa)
      deallocate(bb)
      deallocate(cc)
      !
    end do 
    !
    ! Close the files
    close(unit_1)
    close(unit_2)
    !
    contains 
    !
    ! subroutine to compute a simple matrix multiplication
    subroutine matrix_molt(a1,b1,result)
        !
        real( kind = 4 ), allocatable :: a1(:,:),b1(:,:)
        real( kind = 4 ), allocatable :: result(:,:)
        integer( kind = 4) :: ii,jj,kk,dim1
        dim1 = size(a1,2)  ! get the numbers of rows
        !
        do ii = 1, dim1
            do jj = 1, dim1
              result(ii, jj) = 0.0
              do kk = 1, dim1
                result(ii, jj) = result(ii, jj) + a1(ii, kk) * b1(kk, jj)
              end do
            end do
        end do 
        !
    end subroutine matrix_molt

      
end program matrix_mul