#include<iostream>
#include<string>
using namespace std;
void wordcout(string word)
{
    int i;
    int wordcount = 0;

    for (i=0; i<word.size(); i++)
    {
        if (word[i]==' ' || word[i] == '.')
        {
            wordcount++;
        }
    }
     cout<<"Total Word : "<<wordcount<<endl;
}
void sentencecout(string word)
{
    int i;
    int sentencecount = 0;
    for (i=0; i<word.size(); i++)
    {
        if ( word[i] == '.')
        {
            sentencecount++;
        }
    }
    cout<<"Total Sentence : "<<sentencecount<<endl;
}
int main()
{
    string input;
    getline(cin,input);
    wordcout(input);
    sentencecout(input);
}
