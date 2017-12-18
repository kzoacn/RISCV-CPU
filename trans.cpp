#include<bits/stdc++.h>
using namespace std;

string str(int x,int len){
	string s;
	for(int i=len-1;i>=0;i--)
		s=s+char('0'+(x>>i&1));
	return s;
}

int reg[33];

//#define OP_IMM 0010011
//#define OP_RRR 0110011


map<string,char>CMD_TYPE;
map<string,string>OP_FUN3;

int main(){
	freopen("instr.txt","r",stdin);
	freopen("instr.bin","w",stdout);

	CMD_TYPE["addi"]='I';
	CMD_TYPE["andi"]='I';
	CMD_TYPE["ori"]='I';
	CMD_TYPE["xori"]='I';

	CMD_TYPE["add"]='R';
	CMD_TYPE["sub"]='R';
	CMD_TYPE["and"]='R';
	CMD_TYPE["or"]='R';
	CMD_TYPE["xor"]='R';



	string instr;
	string rd;
	while(cin>>instr){
		int rd,rs1,rs2,imm;
		if(CMD_TYPE[instr]=='I'){
			cin>>rd>>rs1>>imm;
			string FUN3;
			if(instr=="addi")reg[rd]=reg[rs1]+imm,FUN3="000";
			if(instr=="xori")reg[rd]=reg[rs1]^imm,FUN3="100";
			if(instr=="ori")reg[rd]=reg[rs1]|imm,FUN3="110";
			if(instr=="andi")reg[rd]=reg[rs1]&imm,FUN3="111";

			cout<<str(imm,12)+str(rs1,5)+FUN3+str(rd,5)+string("0010011")<<endl;
		}
		if(CMD_TYPE[instr]=='R'){
			cin>>rd>>rs1>>rs2;
			string FUN3;
			string fun7=str(0,7);
			if(instr=="add")reg[rd]=reg[rs1]+reg[rs2],FUN3="000";
			if(instr=="sub")reg[rd]=reg[rs1]-reg[rs2],FUN3="000",fun7="0100000";
			if(instr=="xor")reg[rd]=reg[rs1]^reg[rs2],FUN3="100";
			if(instr=="or")reg[rd]=reg[rs1]|reg[rs2],FUN3="110";
			if(instr=="and")reg[rd]=reg[rs1]&reg[rs2],FUN3="111";
			cout<<fun7+str(rs2,5)+str(rs1,5)+FUN3+str(rd,5)+string("0110011")<<endl;
		}
	}

	for(int i=0;i<32;i++)
		fprintf(stderr,"reg[%d]=%x\n",i,reg[i]);


	return 0;
}
