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
    
    double *pr, **dist, *matriz_grau, *ind;
    int **lista_nos, *mask;
    int cont, no_row, no_col, radius, N_vicinities, N_nos;
    int lin, col, li, grau, tam_mask, i , j;
    
    /* check number of parameters */
    if (nrhs != 2) {
        mexErrMsgTxt("requires three input argument.");
    } else if (nlhs != 1) {
         mexErrMsgTxt("requires one output arguments.");
    }
    
    no_row = mxGetM(prhs[0]);    /* nro linhas da imagem */
    no_col = mxGetN(prhs[0]);    /* nro colunas da imagem */
    pr = mxGetPr(prhs[0]);
    
    radius = (int) mxGetScalar(prhs[1]); //radius used...
    N_nos = no_row * no_col;
    N_vicinities = No_Vicinities(radius);  //number of neighbours in r radius
    tam_mask = (int) N_vicinities / 2;
    mask = MaskCircumference(radius, tam_mask, no_row);
    
    
    // allocate space for the array
    lista_nos = (int **) malloc (N_nos * sizeof(int *));
    for (cont = 0; cont < N_nos; cont++){
        lista_nos[cont] = (int *) malloc (3 * sizeof(int));
    }
    
    // copy the information from the image to the list of nodes...
    cont = -1;
    for (col = 0; col < no_col; col++){
        for (lin = 0; lin < no_row; lin++){
            cont++;
            lista_nos[cont][0] = col;
            lista_nos[cont][1] = lin;
            lista_nos[cont][2] = (int) pr[cont];
        }
    }
    
    
    dist = CalculateDistanceGridRadiusTexture(lista_nos, N_nos, radius, N_vicinities, mask, tam_mask);
    
    
    plhs[0] = mxCreateDoubleMatrix(N_nos,N_vicinities,mxREAL);
    ind = (double *) mxGetPr(plhs[0]);
    cont = -1;
    for (i = 0; i < N_vicinities; i++){
        for (j = 0; j < N_nos; j++){
            cont++;
            ind[cont] = dist[j][i];
        }
    }
    
    
    
    // clear the variables...
    for (lin = 0; lin < N_nos; lin++){
        free(dist[lin]);
        free(lista_nos[lin]);
    }
    free(dist);
    free(lista_nos);
    dist = NULL;
    lista_nos = NULL;
    
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
    
    //cria lista dos vizinhos...
    current_neighbor = (int*) malloc(N_nos * sizeof(int));
    
    //cria a matrix de distancias e inicia com (-1)...
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
                    //a distancias entre os dois vertices respeita o raio...
                    //p = (r^2 + (r^2 *x/255))./(r^2 + r^2);
                    
                    //d = lista_nos[y][2] - lista_nos[p][2];
                    //dist = dist + (d * d);
                    d = list_nos[y][2] - list_nos[p][2];
                    if (d<0)
                            d = d*-1;
                    d = (float) (radius2 * d / 255.0);
                    dist = dist + d;
                    
                    current_neighbor[y]++;
                    current_neighbor[p]++;
                    
                    distances[p][current_neighbor[p]] = dist / max_dist;
                    distances[y][current_neighbor[y]] = dist / max_dist;
                    
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

