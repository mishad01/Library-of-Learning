class Solution {
public:
    double average(vector<int>& salary) {
        int min = 100000;
        int max = 0;
        double avg = 0;
        int sum = 0;
        for(auto x : salary){
            if(x<min){
                min = x;
            }
            if(x>max){
                max = x;
            }
            sum +=x;
        }
        sum = sum - min-max;
        avg = sum/(salary.size()-2);
        return avg;
    }
};