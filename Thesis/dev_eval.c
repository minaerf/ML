#include "mex.h"
#include<stdio.h>
double** CalculateDistanceGridRadiusTexture(int **lista_nos, int N_nos, int raio, int N_vizinhos, int *mask, int tam_mask);
int* MaskCircumference(int raio, int tam_mask, int nro_lin);

int CalculateDistances(int y1, int x1, int c1, int y2, int x2, int c2);
int No_Vicinities(int raio);
int RadiusDistance(int y1, int x1, int y2, int x2);

void mexFunction(
        int nlhs,              // Number of left hand side (output) arguments
        mxArray *plhs[],       // Array of left hand side arguments
        int nrhs,              // Number of right hand side (input) arguments
        const mxArray *prhs[]  // Array of right hand side arguments
        )
{
    
    double *pr, *limiar, **dist, *matriz_grau, *matriz_strength, *ind;
    int **list_nos, *mask;
    int cont, no_row, no_col, nro_limiar, radius, N_vicinities, N_nos, set_size;
    int lin, col, li, grau, tam_mask, i , j;
    double dev2, mean;
    
    /* check number of parameters */
    if (nrhs != 4) {
        mexErrMsgTxt("requires three input argument.");
    } else if (nlhs != 1) {
        // mexErrMsgTxt("requires one output arguments.");
    }
    
    no_row = mxGetM(prhs[0]);    /* number of rows of image*/
    no_col = mxGetN(prhs[0]);    /* number of columns of image */
    pr = mxGetPr(prhs[0]);
    
    
    mean = (double) mxGetScalar(prhs[1]); //set the mean value
    radius = (int) mxGetScalar(prhs[2]); //radius used...
    set_size = (int) mxGetScalar(prhs[3]);
    
    N_nos = no_row * no_col;
    N_vicinities = No_Vicinities(radius);  //number of neighbours in r radius
    tam_mask = (int) N_vicinities / 2;
    mask = MaskCircumference(radius, tam_mask, no_row);
    
    
    //allocate space for the matrix...
    list_nos = (int **) malloc (N_nos * sizeof(int *));
    for (cont = 0; cont < N_nos; cont++){
        list_nos[cont] = (int *) malloc (3 * sizeof(int));
    }
    
    //copy information from the image to the list...
    cont = -1;
    for (col = 0; col < no_col; col++){
        for (lin = 0; lin < no_row; lin++){
            cont++;
            list_nos[cont][0] = col;
            list_nos[cont][1] = lin;
            list_nos[cont][2] = (int) pr[cont];
        }
    }
    
    
    dist = CalculateDistanceGridRadiusTexture(list_nos, N_nos, radius, N_vicinities, mask, tam_mask);
    
    cont = 0;
    for (lin = 0; lin < N_nos; lin++){ // traverses the dist nodes
        for (col = 0; col < N_vicinities; col++){ //travels the distance of neighbors
            if (dist[lin][col] != -1){
                dev2 = (dist[lin][col] - mean)*(dist[lin][col] - mean) + dev2;
                cont++;
            }
        }      
    }
    
    // allocate space for the output variable
    dev2 = dev2 / ((cont*set_size));
    plhs[0] = mxCreateDoubleScalar(dev2);
    
    // clear the variables
    for (lin = 0; lin < N_nos; lin++){
        free(dist[lin]);
        free(list_nos[lin]);
    }
    free(dist);
    free(list_nos);
    dist = NULL;
    list_nos = NULL;
    
}

int RadiusDistance(int y1, int x1, int y2, int x2){
    double y, x;
    y = y1 - y2;
    x = x1 - x2;
    
    return (int) (y*y + x*x);
}

int No_Vicinities(int radius)
{
    int y, x, total, c;
    int radius2 = radius * radius;
    
    c = radius;
    total = 0;
    
    for (y = 0; y < (2 * radius + 1); y++){
        for (x = 0; x < (2 * radius + 1); x++){
            if (RadiusDistance(y,x,c,c) <= radius2){
                total++;
            }
        }
    }
    
    total--;
    return total;
}

int CalculateDistances(int y1, int x1, int c1, int y2, int x2, int c2){
    int y, x, c;
    y = y1 - y2;
    x = x1 - x2;
    c = c1 - c2;
    
    return (int) (y*y + x*x +c*c);
}

double** CalculateDistanceGridRadiusTexture(int **list_nos, int N_nos, int radius, int N_vicinities, int *mask, int tam_mask){
    
    int y, x, p;
    int lin, col, radius2;
    double d, dist;
    double **distances;
    int *current_neighbor;
    //int max_dist = (int) 255 * 255 + raio * raio;
    int max_dist = (int) 2 * radius * radius;
    if (radius == 0)
            max_dist = (int)1;
    //create list of neighbors
    current_neighbor = (int*) malloc(N_nos * sizeof(int));
    
    //creates the distance matrix and starts with (-1)...
    distances = (double**) malloc(N_nos * sizeof(double *));
    for (lin = 0; lin < N_nos; lin++){
        distances[lin] = (double*) malloc(N_vicinities * sizeof(double));
        
        for (col = 0; col < N_vicinities; col++){
            distances[lin][col] = -1;
        }
        
        current_neighbor[lin] = -1;//starts next columns with -1...
    }
    
    
    radius2 = (int) radius * radius;
    
    for (y = 0; y < N_nos; y++){
        
        for (x = 0; x < tam_mask; x++){
            p = (int) y + mask[x];
            
            if ((p >= 0) && (p < N_nos)){
                dist = RadiusDistance(list_nos[y][0],list_nos[y][1],list_nos[p][0],list_nos[p][1]);
                
                if(dist <= radius2){
                    //the distances between the two vertices with respect the radius
                    //p = (r^2 + (r^2 *x/255))./(r^2 + r^2);
                    
                    //d = list_nos[y][2] - list_nos[p][2];
                    //dist = dist + (d * d);
                    d = list_nos[y][2] - list_nos[p][2];
                    if (d<0)
                        d = d * -1;
                    
                    if (radius == 0){
                        d = (float)(list_nos[y][2]/255.0);
                    }
                    else{
                        d = (float) (radius2 * d / 255.0);
                    }
                    dist = dist + d;
                    
                    current_neighbor[y]++;
                    current_neighbor[p]++;
                    
                    distances[p][current_neighbor[p]] = dist / max_dist;
                    distances[y][current_neighbor[y]] = dist / max_dist;
                   // edge_sum = edge_sum + ((dist / max_dist) * 2);
                }
            }
        }
    }
    
    return distances;
}

int* MaskCircumference(int radius, int tam_mask, int no_row){
    int* mask;
    int y,x, radius2, cont, dist;
    
    radius2 = (int) radius * radius;
    cont = -1;
    
    mask = (int*) malloc(tam_mask * sizeof(int));
    for (y = 0; y < radius + 1; y++){
        for (x = 0; x < 2 * radius + 1; x++){
            dist = RadiusDistance(y,x,0,radius);
            if ((dist > 0) && (dist <= radius2)){
                if ((y == 0) && (x - radius < 0)){
                    continue;
                }
                cont++;
                mask[cont] = (x - radius) * no_row + y;
            }
            
        }
    }
    
    return mask;
}

