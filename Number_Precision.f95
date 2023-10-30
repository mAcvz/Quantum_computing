program num_precision
    implicit none
    !
    ! Test of number precision in Fortran
    !
    real (kind = 8) :: pi = dacos(-1.d0)
    integer (kind = 2) :: aa, bb, sum1
    integer (kind = 4) :: cc, dd, sum2
    real (kind = 4) :: ee, ff, sum3
    real (kind = 8) :: hh,ll, sum4
    !
    aa = 2000000000 ! too large, use ' -fno-range-check ' to compile and see the error
    bb = 1
    sum1 = aa + bb
    print *, 'aa + bb = ', sum1
    print *, ' '
    !
    cc = 2000000000
    dd = 1  
    sum2 = cc + dd
    print * ,'cc + dd = ', sum2
    print *, ' '
    print * ,'pi = ', pi
    !
    ! single precision
    ee = pi * (10.0 ** 32)
    ff = sqrt(2.0)*(10.0**21)
    sum3 = ee + ff
    print *, 'ee = ', ee
    print *, 'ff = ', ff
    print *, 'sum3 = ', sum3
    print *, ' '
    !
    ! double precision 
    hh = pi * (10.d0 ** 32)
    ll = sqrt(2.d0)*(10.d0**21)
    sum4 = hh + ff
    print *, 'hh = ', hh
    print *, 'll = ', ll
    print *, 'sum4 = ', sum4
    print *, ' '
    !
    print *, 'sum4 - sum3', (sum4 - sum3)
end program num_precision