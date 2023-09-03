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