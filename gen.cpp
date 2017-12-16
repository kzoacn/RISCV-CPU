#include<bits/stdc++.h>
using namespace std;
int n=10;


vector<string>op{"addi","xori"};

int main(){
srand(time(0));
	freopen("instr.txt","w",stdout);
	while(n--){
		cout<<op[rand()%op.size()]<<" ";
		cout<<rand()%3<<" ";
		cout<<rand()%3<<" ";
		cout<<rand()%10<<endl;
	}	
	return 0;
}
