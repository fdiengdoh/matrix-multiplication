c     program to multiply two matrix A and B
      implicit real*8(a-h,o-z)
      parameter(n=3,m=3)
      dimension A(n,m),B(n,m),pdt(n,m)

      open(unit=3,file='matin.dat')

      do i=1,m
          read(3,*)(A(i,j),j=1,n)
      enddo

      do i=1,m
          read(3,*)(B(i,j),j=1,n)
      enddo
      close(3)

      do i=1,m
          do j=1,n
          pdt(i,j) = 0.0
              do k=1,n
                   pdt(i,j) = pdt(i,j) + A(i,k)*B(k,j)
              enddo
          enddo
      enddo

      open(unit=4,file='matout.dat',status='replace',form='formatted')

      do i=1,n
          write(4,90)(pdt(i,j),j=1,m)
      enddo
   90 format(F8.2,F8.2,F8.2)

      close(4)
      
      stop
      END
