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