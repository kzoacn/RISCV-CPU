#include<bits/stdc++.h>
using namespace std;
int n=10;


vector<string>op_ir{"addi","xori","ori","andi"};
vector<string>op_rr{"add","xor","sub","or","and"};

int regn=6;
int main(int argc,char *argv[]){
	sscanf(argv[1],"%d",&n);
	srand(time(0));
	freopen("instr.txt","w",stdout);
	while(n--){
		if(rand()%2){
			cout<<op_ir[rand()%op_ir.size()]<<" ";
			cout<<rand()%regn<<" ";
			cout<<rand()%regn<<" ";
			cout<<rand()%10<<endl;
		}else{
			cout<<op_rr[rand()%op_rr.size()]<<" ";
			cout<<rand()%regn<<" ";
			cout<<rand()%regn<<" ";
			cout<<rand()%regn<<endl;
		
		}
	}	
	return 0;
}
