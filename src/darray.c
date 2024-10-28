#ifndef H_DARRAY
#define H_DARRAY

#include <stdlib.h>

typedef struct darray {

    int* data;
    size_t size;
   


}darray;

darray *da_create(){
    darray *array = (darray*)malloc(sizeof(darray));

    if(array==NULL){
        return NULL;

    }
    array->data = NULL;
    array->size=0;
   

    return array;
    

}

int *da_get(darray *array, size_t idx){

    
   

    if (idx>array->size||array==NULL){
        return NULL;
    }

      


    return &array->data[idx];

}

int da_append(darray *array, int value){

    if (array == NULL){
        return 0;
    }

    

    int *temp = (int*)realloc(array->data,(array->size+1)*sizeof(int));

    if (temp == NULL){
        return 0;
    }

    array->data = temp;
   
    array->data[array->size]=value;
    array->size +=1;
   

    return 1;

    



}
int da_size(darray *array){
    if(array==NULL){
        return 0;
    }
    return array->size;
}

void da_delete(darray *array){
    if (array==NULL){
        return;
    }
    free(array->data);
    free(array);
}


#endif