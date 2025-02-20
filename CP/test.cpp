class Solution {
public:
    int countOdds(int low, int high) {
        int count=0;
        int test ;
        for(int i = low;i<=high;i++){
            if(i%3!=0){
                count++;
            }
        }
        return count;
    }
};