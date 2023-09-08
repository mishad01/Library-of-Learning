#include<iostream>
#include<string>
#include<math.h>
#include<cstring>
#include<vector>
#include<algorithm>
#define cout std::cout
#define cin std::cin
#define string std::string
#define vec std::vector
#define endg "\n"
#define ll long long int 
#define newline() cout<<"\n";
#define debug(x) cout<< #x << " "<< x<<"\n";
void main_extension();
/*
c:
	malloc
	calloc
	realloc
	free
c++:
	new 
	delete
	to memory allocate in heap for c++:
		p = new int;
		-for array;
		p = new int[20];
		-to clear unused heap memory:
		delete[] p;
*/	

//=====================================================CODE-STARTS-HERE=====================================================//

string substring(string word,int pos,int len){
	string sub = "";
	for(int i=pos;i<pos+len;i++){
		sub = sub + word[i];}
	return sub; }

string inserting(string word,int pos,string sub){
	string first = substring(word,0,pos);
	first = first+sub;
	first = first + substring(word,pos,word.size()-pos);
return first;}

string deleting(string word,int pos,int len){
	string first = substring(word,0,pos);
	string full = substring(word,pos+len,word.size()-(pos+len));
return first + full;}

int indexing(string word,string pattern){
	int index = -1;
	int j;
	for(int i=0;i<word.size();i++){
		for(j=0;j<pattern.size();j++){
			if(word[i+j]!=pattern[j]){
				break; }
		}
		if(j==pattern.size()){
			index = i;} }
return index;}

string replacing(string word,string first,string second){
	if(indexing(word,first)!=-1){
		string before = deleting(word,indexing(word,first),first.size());
		string after = inserting(before,indexing(word,first),second);
		return after; }
	return "not found"; }

string del_all(string word,string pattern){ 
	while(indexing(word,pattern)!=-1){
		word = deleting(word,indexing(word,pattern),pattern.size());
	}
return word;}

string replace_all(string word,string pattern,string rep){ 
	while(indexing(word,pattern)!=-1){
		word = replacing(word,pattern,rep);
	}
return word;}

int par(string line){
	int count = 1;
	int n = line.size();
	string blank = "     ";
	int j;
	for(int i=0;i<n;i++){
		for(j=0;j<blank.size();j++){
			if(line[i+j]!=blank[j]){
				break;
			}
		}
		if(j==blank.size()){
			count++;
		}
	}
return count;}

string rotating(string word,int r){
	string first = "";
	for(int i=0;i<r;i++){
		first = first + word[i];
	}
	string new_word = deleting(word,0,r);
	new_word = inserting(new_word,word.size()-r,first);
	return new_word;
}
int pattern_matching(string t,string p){
	int s = t.size();
	int r = p.size();
	int max = s-r +1;
	int k =0;
	int l=0;
	int index = 0;
	while(k<max){
		while(l<r){
			if(p[l]!=t[k+l]){
				break;
			}
			l++;
		}
		if(l==r){
			index = k;
		}
		k++;
	}  
return index;}

int word_count(string word){
	int count=0;
	for(int i=0;i<word.size();i++){
		if(word[i]==' ' || word[i]=='.'){
		count++;
		}
	}
return count;}

int sen_count(string word){
	int count=0;
	for(int i=0;i<word.size();i++){
		if(word[i]=='.'){
			count++;
		}
	}
return count;}

int arr_insert(int a[],int n,int pos,int num){
	for(int i=n-1;i>=pos;i--){
		a[i+1]=a[i];
	}
	a[pos]=num;
return n+1;}

int arr_deleting(int a[],int n,int pos){
	for(int i=pos;i<=n;i++){
		a[i]=a[i+1];
	}
return n-1;}
int linear_search(int a[],int n,int num){
	for(int i=0;i<n;i++)
		if(a[i]==num)
			return i;
return -1;}

int bin_search_recursive(int a[],int lb,int ub,int num){
	int mid;
	if(lb>ub){
		return -1;
	}
	else{
		mid = (lb+ub)/2;
		if(a[mid]==num){
			return mid;
		}
		else if(num>a[mid]){
			return bin_search_recursive(a,mid+1,ub,num);
		}
		else{
			return bin_search_recursive(a,lb,mid-1,num);
		}
	}
}
int bin_search_while(int a[],int lb,int ub,int num){
	int mid;
	while(lb<ub){
		mid = (lb+ub)/2;
		if(a[mid]==num){
			return mid;
		}
		else if(num>a[mid]){
			lb = mid - 1;
		}
		else{
			ub = mid+1;
		}
	}
return -1;}

int bubble_sort(int a[],int n){
	int temp;
	for(int i=0;i<n;i++){
		for(int j=0;j<n-1;j++){
			if(a[j]>a[j+1]){
				temp = a[j];
				a[j] = a[j+1];
				a[j+1] = temp;
			}
		}
	}
return 0;}
int second_pattern(string text,string pat){
	int n = text.size();
	int m = pat.size();

	int i=0,j=0;
	while((n-i)>=(m-j)){
		if(text[i]==pat[j]){
			i++;
			j++;
		}
		else{
			i++;
		}
		if(j==m){
			return i-j;
			j = 0;
		}
	}
return -1;}

struct Node{
	int data;
	Node* next;
};

int search_linked(Node *head,int num){
	Node *temp = head;
	int i=0;
	Node *loc = NULL;
	while(temp!=NULL){
		if(temp->data==num){
		 	return i;
		}
		temp= temp->next;
		i++;
	}
	return -1; }

Node *create_single_tail(Node *head,int n){
	Node *temp = NULL;
	Node *ptr = NULL;
	while(n--){
		temp=new Node();
		cin>>temp->data;
		if(head==NULL){
			head = temp;
		}
		else{
		ptr = head;
		while(ptr->next!=NULL){
			ptr=ptr->next;
		}
		ptr->next = temp;
		}
	}
	return head;
}
Node* create_single_head(Node *head,int n){
	Node *temp;
	while(n--){
		temp = new Node();
		cin>>temp->data;
		temp ->next =head;
		head = temp;
	}	
return head;}

Node* insert_single_nth(Node *head,int n,int num){
	Node *temp = new Node();
	temp->data = num;
	Node *ptr;
	if(n==0){
		temp->next = head;
		temp = head;
		return head;
	}
	ptr = head;
	for(int i=0;i<n-1;i++){
		ptr=ptr->next;
	}
	temp->next = ptr->next;
	ptr->next = temp;
    return head;
}

void print_linked(Node *head){
	Node *temp = head;
	while(temp!=NULL){
		cout<<temp->data<<" ";
		temp = temp->next;
	}
}
Node* add_tail(Node *head,int value){
	Node *temp = new Node();
	Node *ptr;
	temp->data = value;
	if(head==NULL){
		head = temp;
	}
	else{
		ptr = head;
		while(ptr->next!=NULL){
			ptr = ptr->next;
		}
		ptr->next = temp;
	}
return head;}
Node *add_head(Node *head,int value){
	Node *temp = new Node();
	temp->data = value;
	temp->next = head;
	head = temp;
return head;} 

Node *insert_single_sorted(Node *head,int num){
	Node *temp = new Node();
	temp->data = num;
	Node *ptr;
	ptr = head;
	if(num<head->data){
		temp->next = head;
		head = temp;
	}
	else{
	while(ptr->next!= NULL && ptr->next->data < num){
			ptr = ptr->next;
		}
	temp->next = ptr->next;
	ptr->next = temp;
}
return head;}

Node *bubblesort_single_linked(Node *head){
	Node *i;
	Node *j;
	int small;
	int large;
	for(i=head;i->next!=NULL;i=i->next){
		for(j=head;j->next->next!=NULL;j=j->next){
			if(j->data > j->next->data){
				large = j->data;
				small = j->next->data;
				j->next->data = large;
				j->data = small;
			}
		}
	}
return head;}

Node* delete_single_head(Node *head){
	Node *temp = head;
	head = temp->next;
	free(temp);
return head;
}
Node *delete_single_tail(Node *head){
	Node *ptr = head;
	while(ptr->next->next!=NULL){
		ptr= ptr->next;
	}
	free(ptr->next);
	ptr->next = NULL;
return head;}

Node *delete_single_nth(Node *head,int n){
	Node *ptr = head;
	Node *temp;
	if(n==0) {
		head = ptr->next;
		free(ptr); 
	}
	else{
		for(int i=0;i<n-1;i++){
			ptr= ptr->next;
		}
		temp = ptr->next;
		ptr->next = temp->next;
		free(temp);
	}
return head;}

Node *delete_single_value(Node *head,int value){
	Node *ptr = head;
	Node *temp;
	int count = 0;
	if(head->data==value){
		temp = head;
		head = head ->next;
		free(temp);
	}
	else{
		while(ptr->next!=NULL){
			ptr=ptr->next;
			if(ptr->next->data==value){
				count++;
				break;
			} 
		}
		if(count>0){
			temp=ptr->next;
			ptr->next = temp->next;
			free(temp);
		}
	}
return head;}

int search_single_sorted(Node *head,int value){
	Node *ptr = head;
	int i =0;
	while(ptr!=NULL && ptr->data<=value){
		ptr = ptr->next;
		if(ptr->data==value){
			return i;
		}
		i++;
	}
return -1;}

int push(int a[],int top,int x){
	top++;
	a[top] = x;
return top;}
int pop(int a[],int top){
	a[top]='\0';
	top--;
return top;}
void print_stack(int a[],int top){
	for(int i=top;i>=0;i--)
		cout<<a[i]<<endg;
}

class Node2{
//node for double linked list.
public:
	Node2 *next;
	int data;
	Node2 *prev;
};

Node2 *add_double_head(Node2 *head,int num){
	Node2 *temp = new Node2();
	temp->data = num;
	Node2 *ptr = NULL;
	if(head==NULL){
		head = temp;
		head->prev = NULL;
	}
	head->prev=temp;
	temp->next = head;
	head = temp;	
return head;}

Node2 *add_double_tail(Node2 *head,int num){
	Node2 *temp = new Node2();
	temp->data = num;
	Node2 *ptr = NULL;
	Node2 *lastptr;
	if(head==NULL){
		head = temp;
		head->prev = NULL;
	}
	else{
		ptr= head;
		while(ptr->next!=NULL){
			ptr = ptr->next;
		}
		ptr->next = temp;
		temp->prev = ptr;
	}
return head;
}

void print_double_link(Node2 *head){
	Node2 *temp = head;
	while(temp!=NULL){
		cout<<temp->data<<" ";
		temp = temp->next;
	}
}

Node2 * create_node(){
	Node2 *newnode = new Node2();
	newnode->prev = NULL;
	newnode->next = NULL;
	newnode = NULL;
return newnode;}

Node2 *add_double_nth(Node2 *head,int n,int num){
	Node2 *temp = new Node2();
	Node2 *lastptr;
	temp->data = num;
	Node2 *ptr;
	if(n==0){
		head->prev = temp;
		temp->next = head;
		head=temp;
		head->prev = NULL;
	}
	else{
		ptr=head;
		for(int i=0;i<n-1;i++){
			ptr= ptr->next;
		}
		if(ptr->next==NULL){
			ptr->next = temp;
			temp->next = NULL;
			temp->prev = ptr;
		}
		else{
			lastptr = ptr->next;
			ptr->next = temp;
			lastptr->prev = temp;
			temp->next = lastptr;
			temp->prev = ptr;
		} 
	}
return head;}

void reverse_print(Node2 *head){
	Node2 *front;
	Node2 *ptr = head;
	while(ptr->next!=NULL){
		ptr=ptr->next;
	}
	front = ptr;
	while(front!=NULL){
		cout<<front->data<<" ";
		front = front->prev;
	}
}
Node2* create_double_linked(Node2 *head,int n){
	Node2 *temp;
	Node2 *ptr;
	Node2 *lastptr;
	while(n--){
		temp = new Node2();
		cin>>temp->data;
		if(head==NULL){
			head = temp;
			head->prev = NULL;
			head->next = NULL;
		}
		else{
			ptr=head;
			while(ptr->next!=NULL){
				ptr=ptr->next;
			}
			ptr->next = temp;
			temp->prev = ptr;
			temp->next = NULL;
		}
	}
return head;}

Node2 *insert_double_sorted(Node2 *head,int num){
	Node2 *temp;
	temp = new Node2;
	temp->data = num;
	Node2 *lastptr;
	Node2 *ptr = head;
	if(head->data>=num){
		temp->next = head;
		head->prev = temp;
		head = temp;
		head->prev =NULL;
		return head;
	}
	while(ptr->next!=NULL && ptr->next->data<=num){
		ptr=ptr->next;
	}
	if(ptr->next==NULL){
		ptr->next = temp;
		temp->prev = ptr;
		temp->next = NULL; 
	}
	else{
		lastptr = ptr->next;
		temp->next = lastptr;
		lastptr->prev = temp;
		temp->prev = ptr;
		ptr->next = temp;
	} 
return head;}

Node2 *delete_double_head(Node2 *head){
	Node2 *temp = head;
	head = head->next;
	head->prev= NULL;
	free(temp);
return head;}

Node2 *delete_double_tail(Node2* head){
	Node2 *temp;
	Node2 *ptr = head;
	while(ptr->next->next!=NULL){
		ptr=ptr->next;
	}
	temp = ptr->next;
	ptr->next = NULL;
	free(temp);
return head;}

Node2 *delete_double_nth(Node2* head,int n){
	Node2 *temp;
	Node2 *ptr;
	Node2 *lastptr;
	if(n==0){
		temp = head;
		lastptr= head->next;
		head = head->next;
		lastptr->prev= NULL;
		free(temp);
	}
	else{
		ptr = head;
		for(int i=0;i<n-1;i++){
			ptr=ptr->next;
		}
		if(ptr->next->next==NULL){
			temp = ptr->next;
			ptr->next = NULL;
			free(temp);
		}
		else{
			temp = ptr->next;
			ptr->next =temp->next;
			free(temp);
			lastptr = ptr->next;
			lastptr->prev = ptr;
		}
	}
return head;}

Node2 *delete_double_value(Node2 *head,int value){
	Node2 *temp;
	Node2 *ptr;
	Node2 *lastptr;
	if(head->data==value){
		temp = head;
		head = head->next;
		free(temp);
		head->prev = NULL;
	}
	else{
		int count = 0;
		ptr=head;
		while(ptr->next!=NULL){
			ptr=ptr->next;
			if(ptr->next->data==value){
				count++;
				break;
			}
		}
		if(count>0){
			temp = ptr->next;
			ptr->next = temp->next;
			free(temp);
			lastptr = ptr->next;
			lastptr->prev = ptr;
		}
	}
return head;}

int search_double_sorted(Node2 *head,int value){
	int count=0;
	for(Node2 *ptr=head;ptr!=NULL && ptr->data<=value;ptr=ptr->next){
		if(ptr->data==value){
			return count;
		}
		count++;
	}
	return -1;
}

class Node3{
public:
	char data;
	Node3 *next;
};

Node3 *add_circular_head(Node3 *head,char value){
	Node3 *temp = new Node3();
	temp->data=value;
	Node3 *ptr;
	for(ptr=head;ptr->next!=head;ptr=ptr->next);
	temp->next = head;
	head = temp;
	ptr->next=head;
return head;}

Node3 *add_circular_tail(Node3 *head,char value){
	Node3 *temp = new Node3();
	temp->data= value;
	Node3 *ptr;
	for(ptr=head;ptr->next!=head;ptr=ptr->next);
	ptr->next = temp;
	temp->next =head;
return head;}

Node3 *create_circular_tail(Node3 *head,int n){
	Node3 *temp;
	Node3 *ptr;
	while(n--){
		temp = new Node3();
		cin>>temp->data;
		if(head==NULL){
			head = temp;
			head->next = head;
		}
		else{
			ptr = head;
			while(ptr->next!=head){
				ptr = ptr->next; 
			}
			ptr->next = temp;
			temp->next = head;
		}
	}
return head;}

Node3 *create_circular_head(Node3 *head,int n){
	Node3 *temp;
	while(n--){
		temp = new Node3();
		cin>>temp->data;
		temp->next = head;
		head = temp;
	}
	Node3 *ptr = head;
	while(ptr->next!=NULL){
		ptr=ptr->next;
	}
	ptr->next = head;
return head;}

Node3 *insert_circular_nth(Node3 *head,int n,char value){
	Node3 *temp = new Node3();
	temp->data = value;
	Node3 *ptr;
	if(n==0){
		ptr = head;
		while(ptr->next!=head){
			ptr= ptr->next;
		}
		temp->next = head;
		head = temp;
		ptr->next = head;
	}
	else{
		ptr= head;
		for(int i=0;i<n-1;i++){
			ptr = ptr->next;
		}
		temp->next = ptr->next;
		ptr->next = temp;
	}
return head;}

Node3 *insert_circular_sorted(Node3 *head,char value){
	Node3 *temp = new Node3();
	//making a special case here for the capital letters;
	bool cap =false;
	if(value>=65 && value<=90){
		cap = true;
		value = value+32;
	}
	temp->data = value;
	Node3 *ptr = head;
	if(head->data>=value){
		while(ptr->next!=head){
			ptr = ptr->next;
		}
		if(cap==true){
			value = value-32;
		}
		temp->data=value;
		temp->next = head;
		head = temp;
		ptr->next= head;
	}
	else{
		while(ptr->next!=head && ptr->next->data<=value){
			ptr= ptr->next;
		}
		if(ptr->next==head && ptr->data<=value){
			if(cap==true){
				value = value-32;
			}
			temp->data=value;
			ptr->next =temp;
			temp->next = head;
		}
		else{
			if(cap==true){
				value = value-32;
			}
			temp->data=value;
			temp->next = ptr->next;
			ptr->next = temp;
		}
	}
return head;}

Node3 *delete_circular_tail(Node3 *head){
	Node3 *temp;
	Node3 *ptr= head;
	while(ptr->next->next!=head){
		ptr = ptr->next;
	}
	temp = ptr->next;
	free(temp);
	ptr->next = head;
return head;}

Node3 *delete_circular_head(Node3 *head){
	Node3 *temp;
	Node3 *ptr=head;
	while(ptr->next!=head){
		ptr = ptr->next;
	}
	temp = head;
	head = head->next;
	free(temp);
	ptr->next = head;
return head;}

Node3 *delete_circular_nth(Node3 *head,int n){
	Node3 *ptr;
	Node3 *temp;
	ptr =head;
	if(n==0){
		while(ptr->next!=head){
			ptr = ptr->next;
		}
		temp = head;
		head = head->next;
		free(temp);
		ptr->next = head;
	}
	else{
		ptr = head;
		for(int i =0;i<n-1;i++){
			ptr = ptr->next;
		}
		if(ptr->next->next==head){
			temp = ptr->next;
			free(temp);
			ptr->next = head;
		}
		else{
			temp = ptr->next;
			ptr->next = temp->next;
			free(temp);
		}
	}
return head;}
Node3 *delete_circular_value(Node3 *head,char value){
	Node3 *ptr=head;
	Node3 *temp;
	if(value==head->data){
		while(ptr->next!=head){
			ptr=ptr->next;
		}
		temp = head;
		head = head->next;
		free(temp);
		ptr->next = head;
	}
	else{
		bool found = false;
		for(ptr=head;ptr->next!=head;ptr=ptr->next){
			if(ptr->next->data==value){
				found = true;
				break;
			}
		}
		if(found==true){
			temp = ptr->next;
			ptr->next = temp->next;
			free(temp);
		}
		else if(ptr->next->next==head && ptr->next->data==value){
			temp = ptr->next;
			free(temp);
			ptr->next = head;
		}
	}
return head;}

void print_circle(Node3 *head){
	Node3 *ptr = head;
	while(ptr->next!=head){
		cout<<ptr->data;
		ptr = ptr->next;
	}
	//if you ask me why this cout at the end?
	//because the loop goes till n-2.
	//we wanna print the n-1th value aswell.
	cout<<ptr->data;
}

class Node4{
public:
	Node4 *prev;
	int data;
	Node4 *next;
};
void print_double_circular(Node4 *head){
	Node4 *ptr = head;
	while(ptr->next!=head){
		cout<<ptr->data<<" ";
		ptr=ptr->next;
	}
	cout<<ptr->data;
}
void reverse_print_double_circular(Node4 *head){
	Node4 *ptr = head;
	Node4 *lastptr;
	while(ptr->next!=head){
		ptr=ptr->next;
	}
	lastptr = ptr;
	while(lastptr!=head){
		cout<<lastptr->data<<" ";
		lastptr=lastptr->prev;
	}
	cout<<head->data;
}
Node4 *create_double_circular_node(){
	Node4 *head;
	head = NULL; 
return head;}

Node4 *create_double_circular_tail(Node4 *head,int n){
	Node4 *temp;
	Node4 *ptr;
	while(n--){
		temp = new Node4();
		cin>>temp->data;
		if(head==NULL){
			head = temp;
			head->next = head;
			head->prev = head;
		}
		else{
			ptr = head;
			while(ptr->next!=head){
				ptr= ptr->next;
			}
			ptr->next = temp;
			temp->prev = ptr;
			temp->next = head;
		}
	}
return head;}

Node4 *create_double_circular_head(Node4 *head,int n){
	Node4 *temp;
	Node4 *ptr;
	while(n--){
		temp = new Node4();
		cin>>temp->data;
		if(head==NULL){
			temp->next = head;
			head = temp;
		}
		else{
			temp->next =head;
			head->prev = temp;
			head = temp;
		}
	}
	ptr=head;
	while(ptr->next!=NULL){
		ptr=ptr->next;
	}
	ptr->next = head;
	head->prev= ptr;
return head;}

Node4 *insert_circular_double_nth(Node4 *head,int n,int value){
	Node4 *temp = new Node4();
	temp->data=value;
	Node4 *ptr;
	Node4 *lastptr;
	if(n==0){
		ptr = head;
		while(ptr->next!=head){
			ptr=ptr->next;
		}
		temp->next = head;
		head->prev = temp;
		head = temp;
		head->prev = ptr;
		ptr->next = head;
	}
	else{
		ptr = head;
		for(int i=0;i<n-1;i++){
			ptr = ptr->next;
		}
		if(ptr->next==head){
			ptr->next = temp;
			temp->prev = ptr;
			temp->next = head;
			head->prev = temp;
		}
		else{
			lastptr = ptr->next;
			temp->next = ptr->next;
			ptr->next = temp;
			lastptr->prev = temp;
			temp->prev=ptr;
		}
	}
return head;}

Node4 *insert_circular_double_sorted(Node4 *head,int value){
	Node4 *temp = new Node4();
	temp->data = value;
	Node4 *i,*ptr;
	if(head->data>=value){
		for(ptr=head;ptr->next!=head;ptr=ptr->next);
		temp->next=head;
		head->prev = temp;
		head = temp;
		head->prev = ptr;
		ptr->next = head;
		return head;
	}
	for(i=head;i->next!=head && i->next->data<=value;i=i->next);
	if(i->next==head){
		i->next = temp;
		temp->prev= i;
		temp->next=head;
	}
	else{
		Node4 *lastptr = i->next;
		temp->next = lastptr;
		lastptr->prev = temp;
		i->next = temp;
		temp->prev =i;
	}
return head;}

Node4 *delete_double_circular_tail(Node4* head){
	Node4 *temp;
	Node4 *ptr;
	while(ptr->next->next!=head){
		ptr=ptr->next;
	}
	temp=ptr->next;
	free(temp);
	ptr->next = head;
	head->prev = ptr;
return head;}

Node4 *delete_double_circular_head(Node4* head){
	Node4 *temp;
	Node4 *ptr;
	while(ptr->next!=head){
		ptr=ptr->next;
	}
	temp = head;
	head = head->next;
	free(temp);
	head->prev = ptr;
	ptr->next = head;
return head;}

Node4 *delete_double_circular_nth(Node4 *head,int n){
	Node4 *temp;
	Node4 *ptr;
	Node4 *lastptr;
	if(n==0){
		for(ptr=head;ptr->next!=head;ptr = ptr->next);
		temp = head;
		head = head->next;
		free(temp);
		head->prev =ptr;
		ptr->next = head;
	}
	else{
		ptr=head;
		for(int i=0;i<n-1;i++){
			ptr=ptr->next;
		}
		if(ptr->next->next==head){
			temp = ptr->next;
			free(temp);
			ptr->next = head;
			head->prev = ptr;
		}
		else{
			temp = ptr->next;
			ptr->next = temp->next;
			free(temp);
			lastptr = ptr->next;
			lastptr->prev = ptr;
		}
	}
return head;}

Node4 *delete_double_circular_value(Node4 *head,int value){
	Node4 *temp,*ptr,*lastptr;
	if(head->data==value){
		for(ptr=head;ptr->next!=head;ptr=ptr->next);
		temp=head;
		head=head->next;
		free(temp);
		head->prev=ptr;
		ptr->next=head;		
	}
	else{
		bool found = false;
		for(ptr=head;ptr->next!=head;ptr=ptr->next){
			if(ptr->next->data==value){
				found = true;
				break;
			}
		}
		if(found==true){
			temp=ptr->next;
			ptr->next = temp->next;
			free(temp);
			lastptr=ptr->next;
			lastptr->prev=ptr;
		}
		else if(ptr->next==head && ptr->data==value){
			lastptr = ptr->prev;
			temp = ptr;
			free(temp);
			lastptr->next = head;
		}
	}
return head;}

//............................MAIN................................................. 

main(){
	
main_extension();
}

void main_extension(){
	
}