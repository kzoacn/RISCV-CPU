#include<bits/stdc++.h>
using namespace std;

string str(int x,int len){
	string s;
	for(int i=len-1;i>=0;i--)
		s=s+char('0'+(x>>i&1));
	return s;
}

int reg[33];

int mem[2333];

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


	CMD_TYPE["beq"]='B';
	CMD_TYPE["bne"]='B';
	CMD_TYPE["blt"]='B';
	CMD_TYPE["bge"]='B';



	string instr;
	string rd;
	while(cin>>instr){
		int rd,rs1,rs2,imm;

		if(instr=="lui"){
			cin>>rd>>imm;
			cout<<str(imm,20)+str(rd,5)+string("0110111")<<endl;
		}
		if(instr=="lw"){
			cin>>rd>>rs1>>imm;
			string FUN3="010";
			reg[rd]=mem[(reg[rs1]+imm)/4];
			cout<<str(imm,12)+str(rs1,5)+FUN3+str(rd,5)+string("0000011")<<endl;
		}
		if(instr=="sw"){
			cin>>rs2>>rs1>>imm;
			mem[(reg[rs1]+imm)/4]=reg[rs2];
			string IM=str(imm,12);/*
			cerr<<IM.substr(0,7)<<endl;
			cerr<<str(rs2,5)<<endl;
			cerr<<str(rs1,5)<<endl;
			cerr<<"010"<<endl;
			cerr<<IM.substr(7,5)<<endl;
			cerr<<"0100011"<<endl;*/
			cout<<IM.substr(0,7)+str(rs2,5)+str(rs1,5)+"010"+IM.substr(7,5)+string("0100011")<<endl;
		}
	
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
		
		if(CMD_TYPE[instr]=='B'){
			cin>>rs1>>rs2>>imm;
			string FUN3;
			string fun7=str(0,7);
			if(instr=="beq")FUN3="000";
			if(instr=="bne")FUN3="001";
			if(instr=="blt")FUN3="100";
			if(instr=="bge")FUN3="101";
			string IM=str(imm,12);
			cout<<IM.substr(0,7)+str(rs2,5)+str(rs1,5)+FUN3+IM.substr(7,5)+string("1100011")<<endl;
		}
	}

	cerr<<"trans done"<<endl;

//	for(int i=0;i<8;i++)
//		fprintf(stderr,"reg[%d]=%x\n",i,reg[i]);
//	for(int i=0;i<8;i++)
//		fprintf(stderr,"mem[%d]=%x\n",i,mem[i]);
	

	return 0;
}
