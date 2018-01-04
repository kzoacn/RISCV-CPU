#include<bits/stdc++.h>
using namespace std;
int n=10;


vector<string>op_ir{"addi","xori","ori","andi"};
vector<string>op_rr{"add","xor","sub","or","and"};

int regn=6;
int memn=5;
int main(int argc,char *argv[]){
	sscanf(argv[1],"%d",&n);
	srand(time(0));
	freopen("instr.txt","w",stdout);
	while(n--){
		int t=rand()%100;
		if(t<30){
			cout<<op_ir[rand()%op_ir.size()]<<" ";
			cout<<rand()%regn+1<<" ";
			cout<<rand()%regn+1<<" ";
			cout<<rand()%10<<endl;
		}else if(t<40){
			cout<<op_rr[rand()%op_rr.size()]<<" ";
			cout<<rand()%regn+1<<" ";
			cout<<rand()%regn+1<<" ";
			cout<<rand()%regn+1<<endl;
		}else if(t<60){
			if(rand()%2){
				cout<<"lw "<<rand()%regn+1<<" "<<0<<" "<<(rand()%memn)*4<<endl;
			}else{
				cout<<"sw "<<rand()%regn+1<<" "<<0<<" "<<(rand()%memn)*4<<endl;
			}
		}else{
			cout<<"lui "<<rand()%regn+1<<" "<<rand()%10+1<<endl;
		}
	}	
	return 0;
}
