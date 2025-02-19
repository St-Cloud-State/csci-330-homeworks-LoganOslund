#include <iostream> 
#include <iomanip>
using namespace std; 

// last element is a pivot
// all smaller go to the left, all larger go to the right
int partition(int arr[], int l, int h) 
{ 
    int x = arr[h]; 
    int i = (l - 1); 

    for (int j = l; j <= h - 1; j++) 
    { 
        if (arr[j] <= x) 
        { 
            i++; 
            swap(arr[i], arr[j]); 
        } 
    } 
    swap(arr[i + 1], arr[h]); 
    return (i + 1); 
} 

// l = Starting index
// h = Ending index
void quickSort(int arr[], int l, int h) 
{ 
    int stack[h - l + 1]; 

    // top of stack 
    int top = -1; 

    // place initial values in stack 
    stack[++top] = l; 
    stack[++top] = h; 

    // Pop from stack while not empty 
    while (top >= 0) 
    { 
        h = stack[top--]; 
        l = stack[top--]; 

        // Set pivot at correct position in array
        int p = partition(arr, l, h); 

        // If there are elements on left side of pivot, 
        // push left side to stack
        if (p - 1 > l) 
        { 
            stack[++top] = l; 
            stack[++top] = p - 1; 
        } 

        // If there are elements on right side of pivot, 
        // push right side to stack 
        if (p + 1 < h) 
        { 
            stack[++top] = p + 1; 
            stack[++top] = h; 
        } 
    } 
} 

// Print contents of array
void printArray(int arr[], int n) 
{ 
    int i; 
    for (i = 0; i < n; ++i)
    {
        cout << arr[i] << " "; 
    }
    cout << endl;
} 

int main() 
{ 
    int arr[] = { 24, 9, 5, 0, 1, 15, 20, 1 }; 
    int n = sizeof(arr) / sizeof(*arr);
    cout << "Original:" << endl;
    printArray(arr, n);
    quickSort(arr, 0, n - 1); 
    cout << "Final:" << endl;
    printArray(arr, n);
    return 0; 
} 
