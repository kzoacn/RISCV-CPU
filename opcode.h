`define OP_IMM		7'b0010011
`define OP_LUI		7'b0110111
`define OP_AUIPC	7'b0010111
`define OP_OP		7'b0110011
`define OP_JAL		7'b1101111
`define OP_JALR		7'b1100111
`define OP_BRANCH	7'b1100011
`define OP_LOAD		7'b0000011
`define OP_STORE	7'b0100011
`define OP_MEM		7'b0001111
`define OP_SYS		7'b1110011
`define OP_NOP 32'b00000000000000000000000000010011
`define ALU_ADDSUB	3'b000
`define	ALU_SLL		3'b001
`define	ALU_SLT		3'b010
`define	ALU_SLTU	3'b011
`define	ALU_XOR		3'b100
`define	ALU_SRLA	3'b101
`define	ALU_OR		3'b110
`define	ALU_AND		3'b111
`define OP_LEFT		7'b0000000


`define MEM_BYTE	3'b000
`define MEM_HALF	3'b001
`define MEM_WORD	3'b010
`define MEM_BU		3'b100
`define MEM_HU		3'b101


`define OP_BEQ		3'b000
`define OP_BNE		3'b001
`define OP_BLT		3'b100
`define OP_BGE		3'b101
`define OP_BLTU		3'b110
`define OP_BGEU		3'b111


