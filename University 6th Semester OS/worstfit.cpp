#include<bits/stdc++.h>
using namespace std;
#define ll long long
#define nl '\n'

void implementWorstFit(int blockSize[], int blocks, int processSize[], int processes)
{
    // This will store the block id of the allocated block to a process
    int allocation[processes];

    // Initially assigning -1 to all allocation indexes
    // means nothing is allocated currently
    for (int i = 0; i < processes; i++)
    {
        allocation[i] = -1;
    }

    // Pick each process and find suitable blocks
    // according to its size and assign to it
    for (int i = 0; i < processes; i++)
    {

        int indexPlaced = -1;
        for (int j = 0; j < blocks; j++)
        {
            if (blockSize[j] >= processSize[i])
            {
                // place it at the first block fit to accommodate process
                if (indexPlaced == -1)
                    indexPlaced = j;

                // if any future block is larger than the current block where
                // process is placed, change the block and thus indexPlaced
                else if (blockSize[indexPlaced] < blockSize[j])
                    indexPlaced = j;
            }
        }

        // If we were successfully able to find a block for the process
        if (indexPlaced != -1)
        {
            // Allocate this block j to process p[i]
            allocation[i] = indexPlaced;

            // Reduce available memory for the block
            blockSize[indexPlaced] -= processSize[i];
        }
    }

    std::cout << "\nProcess No.\tProcess Size\tBlock no.\n";
    for (int i = 0; i < processes; i++)
    {
        std::cout << i + 1 << "\t\t\t" << processSize[i] << "\t\t\t";
        if (allocation[i] != -1)
            std::cout << allocation[i] + 1 << "\n";
        else
            std::cout << "Not Allocated\n";
    }
}

// Driver code
int main()
{
    int blockSize[] = {5, 4, 3, 6, 7};
    int processSize[] = {1, 3, 5, 3};
    int blocks = sizeof(blockSize) / sizeof(blockSize[0]);
    int processes = sizeof(processSize) / sizeof(processSize[0]);

    implementWorstFit(blockSize, blocks, processSize, processes);

    return 0;
}
