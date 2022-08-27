function [ Q ] = BuildQTable( )
    nrows = 20 + 1;
    ncols = 15 + 1;
    nholes = 50 + 1;
    nstackmax = 20 + 1;
    nstackmin = 20 + 1;
    nstackmean = 20 + 1;
    nstackdev = 20 + 1;

    Q = zeros(nholes, nstackmax, nstackmin, nstackmean, nstackdev, nrows, ncols);
end
 
 