#include<iostream>
using namespace std;
class queue
{
public:
	int size;
	int front;
	int rear;
	int *a;

};
void create(queue* q,int size)
{
	q->size=size;
	q->front=q->rear=-1;
    q->a=(int* )malloc(q->size*sizeof(int));
}
void enqueue(queue *q, int x)
{
	if(q->rear==q->size-1)
	{
		cout<<"Queue is full"<<endl;
	}
	else
	{
		q->rear++;
		a[q->rear]=x;
	}
}
void dequeue(queue *q)
{
	int x=-1;
	if(q->front==q->rear)
	{
		cout<<"Queue is empty"<<endl;
	}
	else
	{
		q->front++;
		x=q->a[q->front];
	}
	return x;
}
void display(queue q)
{
	for(int i=q->front+1;i<=q->rear;i++)
	{
		cout<<q->a[i];
	}
	cout<<endl;
}
int main ()
{
	queue q;
	create(&q,5);
	enqueue(&q,1);
	enqueue(&q,2);
	enqueue(&q,3);
	display(q);


}