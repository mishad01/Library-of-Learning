#include<bits/stdc++.h>
using namespace std;
#define ll long long
#define nl '\n'

// Function to swap two variables
void swap(int *a, int *b)
{
    int temp = *a;
    *a = *b;
    *b = temp;
}

int main()
{
    int n;
    cout << "Enter Number of Processes: ";
    cin >> n;

    // b is array for burst time, p for priority and index for process id
    int b[n], p[n], index[n];

    for (int i = 0; i < n; i++)
    {
        cout << "Enter Burst Time and Priority Value for Process " << i + 1 << ": ";
        cin >> b[i] >> p[i];
        index[i] = i + 1;
    }

    for (int i = 0; i < n; i++)
    {
        int a = p[i], m = i;

        // Finding out highest priority element and placing it at its desired position
        for (int j = i; j < n; j++)
        {
            if (p[j] > a)
            {
                a = p[j];
                m = j;
            }
        }

        // Swapping processes
        swap(&p[i], &p[m]);
        swap(&b[i], &b[m]);
        swap(&index[i], &index[m]);
    }

    // T stores the starting time of process
    int t = 0;

    // Printing scheduled process
    cout << "Order of process Execution is\n";
    for (int i = 0; i < n; i++)
    {
        cout << "P" << index[i] << " is executed from " << t << " to " << t + b[i] << "\n";
        t += b[i];
    }

    cout << "\n";
    cout << "Process Id     Burst Time   Wait Time    Turnaround Time\n";
    int wait_time = 0;
    for (int i = 0; i < n; i++)
    {
        cout << "P" << index[i] << "          " << b[i] << "          " << wait_time << "          " << wait_time + b[i] << "\n";
        wait_time += b[i];
    }

    return 0;
}
