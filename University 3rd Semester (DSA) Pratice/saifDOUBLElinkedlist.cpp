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
