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


struct cmder{
	string instr;
	int rd,rs1,rs2,imm;
};
vector<cmder>cmds;

int main(){
	freopen("instr.txt","r",stdin);
	//freopen("instr.bin","w",stdout);

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
		cmder cmd;

		if(instr=="auipc"){
			cin>>rd>>imm;
		}
		if(instr=="jal"){
			cin>>rd>>imm;
		}
		if(instr=="jalr"){
			cin>>rd>>rs1>>imm;
		}
		if(instr=="lui"){
			cin>>rd>>imm;
		}
		if(instr=="lw"){
			cin>>rd>>rs1>>imm;
		}
		if(instr=="sw"){
			cin>>rs2>>rs1>>imm;
		}
	
		if(CMD_TYPE[instr]=='I'){
			cin>>rd>>rs1>>imm;
		}
		if(CMD_TYPE[instr]=='R'){
			cin>>rd>>rs1>>rs2;
		}
		if(CMD_TYPE[instr]=='B'){
			cin>>rs1>>rs2>>imm;
		}
		cmd.instr=instr;
		cmd.rd=rd;
		cmd.rs1=rs1;
		cmd.rs2=rs2;
		cmd.imm=imm;
		cmds.push_back(cmd);
	}

	int cur=0;
	while(cur<cmds.size()){
		cerr<<cur<<endl;
		string instr=cmds[cur].instr;
		int rd,rs1,rs2,imm;
		rd=cmds[cur].rd;
		rs1=cmds[cur].rs1;
		rs2=cmds[cur].rs2;
		imm=cmds[cur].imm;
		if(instr=="lui"){
			reg[rd]=imm;
		}
		if(instr=="lw"){
			reg[rd]=mem[(reg[rs1]+imm)/4];
		}
		if(instr=="sw"){
			cin>>rs2>>rs1>>imm;
			mem[(reg[rs1]+imm)/4]=reg[rs2];
		}
		if(CMD_TYPE[instr]=='I'){
			if(instr=="addi")reg[rd]=reg[rs1]+imm;
			if(instr=="xori")reg[rd]=reg[rs1]^imm;
			if(instr=="ori")reg[rd]=reg[rs1]|imm;
			if(instr=="andi")reg[rd]=reg[rs1]&imm;

		}
		if(CMD_TYPE[instr]=='R'){
			if(instr=="add")reg[rd]=reg[rs1]+reg[rs2];
			if(instr=="sub")reg[rd]=reg[rs1]-reg[rs2];
			if(instr=="xor")reg[rd]=reg[rs1]^reg[rs2];
			if(instr=="or")reg[rd]=reg[rs1]|reg[rs2];
			if(instr=="and")reg[rd]=reg[rs1]&reg[rs2];
		}
		if(CMD_TYPE[instr]=='B' || instr=="auipc" || instr=="jal" || instr=="jalr"){
			if(instr=="jal"){cur=imm/4;reg[rd]=cur*4;}
			if(instr=="jalr"){cur=imm/4+reg[rs1];reg[rd]=cur*4;}
			if(instr=="auipc"){cur=cur+imm/4;reg[rd]=cur*4;}
			if(instr=="beq")cur= reg[rs1]==reg[rs2] ? cur+imm/4 : cur+1;
			if(instr=="bne")cur= reg[rs1]!=reg[rs2] ? cur+imm/4 : cur+1;
			if(instr=="blt")cur= reg[rs1]<reg[rs2] ? cur+imm/4 : cur+1;
			if(instr=="bge")cur= reg[rs1]>reg[rs2] ? cur+imm/4 : cur+1;
		}else cur=cur+1;

	for(int i=0;i<8;i++)
		fprintf(stderr,"reg[%d]=%x\n",i,reg[i]);
	for(int i=0;i<8;i++)
		fprintf(stderr,"mem[%d]=%x\n",i,mem[i]);
	cerr<<endl;	

	}

	for(int i=0;i<8;i++)
		fprintf(stderr,"reg[%d]=%x\n",i,reg[i]);
	for(int i=0;i<8;i++)
		fprintf(stderr,"mem[%d]=%x\n",i,mem[i]);
	

	cerr<<"./trans plz"<<endl;
	return 0;
}
