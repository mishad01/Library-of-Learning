#include<iostream>
#include<string>
using namespace std;
int main()
{
    string word;
    getline(cin,word);
    int wordcount = 0;
    int sentencecount = 0;

    for (int i=0; i<word.size(); i++)
    {
        if (word[i]==' ' || word[i] == '.')
        {
            wordcount++;
        }
    }
    for (int i=0; i<word.size(); i++)
    {
        if ( word[i] == '.')
        {
            sentencecount++;
        }
    }
    cout<<"Total Word : "<<wordcount<<endl;
    cout<<"Total Sentence : "<<sentencecount<<endl;
}
