#include<bits/stdc++.h>
using namespace std;
#define ll long long
#define nl '\n'

int main()
{
    // Input the number of processes
    int n;
    cout << "Enter Total Number of Processes:";
    cin >> n;
    int wait_time = 0, ta_time = 0, arr_time[n], burst_time[n], temp_burst_time[n];
    int x = n;

    // Input details of processes
    for(int i = 0; i < n; i++)
    {
        cout << "Enter Details of Process " << i + 1 << endl;
        cout << "Arrival Time:  ";
        cin >> arr_time[i];
        cout << "Burst Time:   ";
        cin >> burst_time[i];
        temp_burst_time[i] = burst_time[i];
    }

    // Input time slot
    int time_slot;
    cout << "Enter Time Slot:";
    cin >> time_slot;

    // Total indicates total time
    // counter indicates which process is executed
    int total = 0,  counter = 0, i;
    cout << "Process ID       Burst Time       Turnaround Time      Waiting Time\n";

    for(total = 0, i = 0; x != 0; )
    {
        // Define the conditions
        if(temp_burst_time[i] <= time_slot && temp_burst_time[i] > 0)
        {
            total = total + temp_burst_time[i];
            temp_burst_time[i] = 0;
            counter = 1;
        }
        else if(temp_burst_time[i] > 0)
        {
            temp_burst_time[i] = temp_burst_time[i] - time_slot;
            total  += time_slot;
        }

        if(temp_burst_time[i] == 0 && counter == 1)
        {
            x--; // decrement the process no.
            cout << "\nProcess No " << i+1 << "\t\t " << burst_time[i] << "\t\t\t\t "
                 << total - arr_time[i] << "\t\t\t " << total - arr_time[i] - burst_time[i];
            wait_time = wait_time + total - arr_time[i] - burst_time[i];
            ta_time += total - arr_time[i];
            counter = 0;
        }

        if(i == n - 1)
        {
            i = 0;
        }
        else if(arr_time[i+1] <= total)
        {
            i++;
        }
        else
        {
            i = 0;
        }
    }

    float average_wait_time = wait_time * 1.0 / n;
    float average_turnaround_time = ta_time * 1.0 / n;

    cout << "\nAverage Waiting Time:" << average_wait_time;
    cout << "\nAvg Turnaround Time:" << average_turnaround_time;

    return 0;
}
