#include<bits/stdc++.h>
using namespace std;

string str(int x,int len){
	string s;
	for(int i=len-1;i>=0;i--)
		s=s+char('0'+(x>>i&1));
	return s;
}

int main(){
	freopen("instr.txt","r",stdin);
	freopen("instr.bin","w",stdout);

	string instr;
	string rd;
	while(cin>>instr){
		int rd,rs1,rs2,imm;
		if(instr=="addi"){
			cin>>rd>>rs1>>imm;
			cout<<str(imm,12)+str(rs1,5)+string("000")+str(rd,5)+string("0010011")<<endl;
		}
	}


	return 0;
}
