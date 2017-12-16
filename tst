#! /usr/bin/vvp
:ivl_version "10.0 (stable)";
:ivl_delay_selection "TYPICAL";
:vpi_time_precision - 12;
:vpi_module "system";
:vpi_module "vhdl_sys";
:vpi_module "v2005_math";
:vpi_module "va_math";
S_0x55b777fcff10 .scope module, "cpu_tb" "cpu_tb" 2 4;
 .timescale -9 -12;
v0x55b778014810_0 .var "clk", 0 0;
v0x55b7780148b0_0 .var/i "i", 31 0;
S_0x55b777fd4790 .scope module, "cpu" "cpu" 2 7, 3 5 0, S_0x55b777fcff10;
 .timescale -9 -12;
    .port_info 0 /INPUT 1 "clk"
v0x55b778013d80_0 .net "_fun3", 2 0, v0x55b777fc2320_0;  1 drivers
v0x55b778013e60_0 .net "_fun7", 6 0, v0x55b77800a980_0;  1 drivers
v0x55b778013f20_0 .net "_imm", 31 0, v0x55b77800aa40_0;  1 drivers
v0x55b778013ff0_0 .net "_opcode", 6 0, v0x55b77800ac50_0;  1 drivers
v0x55b7780140b0_0 .net "clk", 0 0, v0x55b778014810_0;  1 drivers
L_0x7f13a5a6c0a8 .functor BUFT 1, C4<0>, C4<0>, C4<0>, C4<0>;
v0x55b7780141a0_0 .net "get_npc", 0 0, L_0x7f13a5a6c0a8;  1 drivers
v0x55b778014240_0 .net "is_busy", 0 0, v0x55b7780122b0_0;  1 drivers
o0x7f13a5ab5648 .functor BUFZ 32, C4<zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz>; HiZ drive
v0x55b778014330_0 .net "npc", 31 0, o0x7f13a5ab5648;  0 drivers
o0x7f13a5ab5678 .functor BUFZ 32, C4<zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz>; HiZ drive
v0x55b778014440_0 .net "opc", 31 0, o0x7f13a5ab5678;  0 drivers
v0x55b778014590_0 .net "rd", 4 0, v0x55b77800ad30_0;  1 drivers
v0x55b778014650_0 .net "rs1", 4 0, v0x55b77800ae10_0;  1 drivers
v0x55b778014710_0 .net "rs2", 4 0, v0x55b77800aef0_0;  1 drivers
S_0x55b777fd4090 .scope module, "ic" "instr_ctrl" 3 16, 4 5 0, S_0x55b777fd4790;
 .timescale -9 -12;
    .port_info 0 /INPUT 1 "clk"
    .port_info 1 /INPUT 32 "npc"
    .port_info 2 /INPUT 1 "get_npc"
    .port_info 3 /INPUT 1 "is_busy"
    .port_info 4 /OUTPUT 7 "opcode"
    .port_info 5 /OUTPUT 5 "rd"
    .port_info 6 /OUTPUT 3 "fun3"
    .port_info 7 /OUTPUT 5 "rs1"
    .port_info 8 /OUTPUT 5 "rs2"
    .port_info 9 /OUTPUT 7 "fun7"
    .port_info 10 /OUTPUT 32 "imm"
    .port_info 11 /OUTPUT 32 "opc"
v0x55b77800bbd0_0 .net "clk", 0 0, v0x55b778014810_0;  alias, 1 drivers
v0x55b77800bce0_0 .net "done", 0 0, v0x55b77800b640_0;  1 drivers
v0x55b77800bda0_0 .net "fun3", 2 0, v0x55b777fc2320_0;  alias, 1 drivers
v0x55b77800be40_0 .net "fun7", 6 0, v0x55b77800a980_0;  alias, 1 drivers
v0x55b77800bee0_0 .net "get_npc", 0 0, L_0x7f13a5a6c0a8;  alias, 1 drivers
v0x55b77800bfd0_0 .net "imm", 31 0, v0x55b77800aa40_0;  alias, 1 drivers
v0x55b77800c070_0 .var "instr", 31 0;
v0x55b77800c110_0 .net "is_busy", 0 0, v0x55b7780122b0_0;  alias, 1 drivers
v0x55b77800c1b0_0 .var "is_fetch", 0 0;
v0x55b77800c250_0 .net "npc", 31 0, o0x7f13a5ab5648;  alias, 0 drivers
v0x55b77800c330_0 .net "opc", 31 0, o0x7f13a5ab5678;  alias, 0 drivers
v0x55b77800c410_0 .net "opcode", 6 0, v0x55b77800ac50_0;  alias, 1 drivers
v0x55b77800c4d0_0 .var "pc", 31 0;
v0x55b77800c5a0_0 .net "rd", 4 0, v0x55b77800ad30_0;  alias, 1 drivers
v0x55b77800c670_0 .net "rs1", 4 0, v0x55b77800ae10_0;  alias, 1 drivers
v0x55b77800c740_0 .net "rs2", 4 0, v0x55b77800aef0_0;  alias, 1 drivers
v0x55b77800c810_0 .net "tmp_instr", 31 0, v0x55b77800ba30_0;  1 drivers
S_0x55b777fd3990 .scope module, "decode" "decoder" 4 33, 5 3 0, S_0x55b777fd4090;
 .timescale -9 -12;
    .port_info 0 /INPUT 1 "clk"
    .port_info 1 /INPUT 32 "instr"
    .port_info 2 /OUTPUT 5 "rd"
    .port_info 3 /OUTPUT 5 "rs1"
    .port_info 4 /OUTPUT 5 "rs2"
    .port_info 5 /OUTPUT 7 "opCode"
    .port_info 6 /OUTPUT 32 "imm"
    .port_info 7 /OUTPUT 3 "fun3"
    .port_info 8 /OUTPUT 7 "fun7"
v0x55b777fed910_0 .net "clk", 0 0, v0x55b778014810_0;  alias, 1 drivers
v0x55b777fc2320_0 .var "fun3", 2 0;
v0x55b77800a980_0 .var "fun7", 6 0;
v0x55b77800aa40_0 .var "imm", 31 0;
v0x55b77800ab20_0 .net "instr", 31 0, v0x55b77800c070_0;  1 drivers
v0x55b77800ac50_0 .var "opCode", 6 0;
v0x55b77800ad30_0 .var "rd", 4 0;
v0x55b77800ae10_0 .var "rs1", 4 0;
v0x55b77800aef0_0 .var "rs2", 4 0;
E_0x55b777f67b00 .event edge, v0x55b77800ab20_0;
S_0x55b77800b0f0 .scope module, "instr_mem" "instr_mem" 4 25, 6 4 0, S_0x55b777fd4090;
 .timescale -9 -12;
    .port_info 0 /INPUT 1 "clk"
    .port_info 1 /INPUT 32 "adr"
    .port_info 2 /INPUT 1 "load"
    .port_info 3 /INPUT 32 "in"
    .port_info 4 /OUTPUT 32 "out"
    .port_info 5 /OUTPUT 1 "done"
P_0x55b77800b290 .param/l "MEM_SIZE" 0 6 13, +C4<00000000000000000000010000000000>;
v0x55b77800b480_0 .net "adr", 31 0, v0x55b77800c4d0_0;  1 drivers
v0x55b77800b580_0 .net "clk", 0 0, v0x55b778014810_0;  alias, 1 drivers
v0x55b77800b640_0 .var "done", 0 0;
v0x55b77800b6e0_0 .var/i "i", 31 0;
L_0x7f13a5a6c060 .functor BUFT 1, C4<00000000000000000000000000000000>, C4<0>, C4<0>, C4<0>;
v0x55b77800b780_0 .net "in", 31 0, L_0x7f13a5a6c060;  1 drivers
L_0x7f13a5a6c018 .functor BUFT 1, C4<0>, C4<0>, C4<0>, C4<0>;
v0x55b77800b8b0_0 .net "load", 0 0, L_0x7f13a5a6c018;  1 drivers
v0x55b77800b970 .array "mem", 1023 0, 31 0;
v0x55b77800ba30_0 .var "out", 31 0;
E_0x55b777f66e30 .event posedge, v0x55b777fed910_0;
S_0x55b77800ca40 .scope module, "rg" "rsreg" 3 31, 7 25 0, S_0x55b777fd4790;
 .timescale -9 -12;
    .port_info 0 /INPUT 1 "clk"
    .port_info 1 /INPUT 7 "_opcode"
    .port_info 2 /INPUT 5 "rd"
    .port_info 3 /INPUT 3 "_fun3"
    .port_info 4 /INPUT 5 "rs1"
    .port_info 5 /INPUT 5 "rs2"
    .port_info 6 /INPUT 7 "_fun7"
    .port_info 7 /INPUT 32 "_imm"
    .port_info 8 /INPUT 32 "opc"
    .port_info 9 /OUTPUT 32 "npc"
    .port_info 10 /OUTPUT 1 "get_npc"
    .port_info 11 /OUTPUT 1 "is_busy"
v0x55b7780136f0_1 .array/port v0x55b7780136f0, 1;
L_0x55b777f6fc50 .functor BUFZ 1, v0x55b7780136f0_1, C4<0>, C4<0>, C4<0>;
v0x55b778011f50_1 .array/port v0x55b778011f50, 1;
L_0x55b777f5b810 .functor BUFZ 7, v0x55b778011f50_1, C4<0000000>, C4<0000000>, C4<0000000>;
v0x55b778011e10_1 .array/port v0x55b778011e10, 1;
L_0x55b777fba720 .functor BUFZ 3, v0x55b778011e10_1, C4<000>, C4<000>, C4<000>;
v0x55b778013950_1 .array/port v0x55b778013950, 1;
L_0x55b778024a90 .functor BUFZ 32, v0x55b778013950_1, C4<00000000000000000000000000000000>, C4<00000000000000000000000000000000>, C4<00000000000000000000000000000000>;
v0x55b778013a90_1 .array/port v0x55b778013a90, 1;
L_0x55b778024b90 .functor BUFZ 32, v0x55b778013a90_1, C4<00000000000000000000000000000000>, C4<00000000000000000000000000000000>, C4<00000000000000000000000000000000>;
L_0x55b778024c60 .functor BUFZ 1, v0x55b77800dd00_0, C4<0>, C4<0>, C4<0>;
L_0x55b778024d70 .functor BUFZ 32, v0x55b77800e150_0, C4<00000000000000000000000000000000>, C4<00000000000000000000000000000000>, C4<00000000000000000000000000000000>;
L_0x55b778024e10 .functor BUFZ 1, v0x55b77800dde0_0, C4<0>, C4<0>, C4<0>;
v0x55b7780136f0_2 .array/port v0x55b7780136f0, 2;
L_0x55b778024f30 .functor BUFZ 1, v0x55b7780136f0_2, C4<0>, C4<0>, C4<0>;
v0x55b778011f50_2 .array/port v0x55b778011f50, 2;
L_0x55b778025000 .functor BUFZ 7, v0x55b778011f50_2, C4<0000000>, C4<0000000>, C4<0000000>;
v0x55b778011e10_2 .array/port v0x55b778011e10, 2;
L_0x55b778025130 .functor BUFZ 3, v0x55b778011e10_2, C4<000>, C4<000>, C4<000>;
v0x55b778013950_2 .array/port v0x55b778013950, 2;
L_0x55b778025200 .functor BUFZ 32, v0x55b778013950_2, C4<00000000000000000000000000000000>, C4<00000000000000000000000000000000>, C4<00000000000000000000000000000000>;
v0x55b778013a90_2 .array/port v0x55b778013a90, 2;
L_0x55b778025340 .functor BUFZ 32, v0x55b778013a90_2, C4<00000000000000000000000000000000>, C4<00000000000000000000000000000000>, C4<00000000000000000000000000000000>;
L_0x55b778025410 .functor BUFZ 1, v0x55b77800ea00_0, C4<0>, C4<0>, C4<0>;
L_0x55b7780252d0 .functor BUFZ 32, v0x55b77800ee80_0, C4<00000000000000000000000000000000>, C4<00000000000000000000000000000000>, C4<00000000000000000000000000000000>;
L_0x55b7780255c0 .functor BUFZ 1, v0x55b77800eae0_0, C4<0>, C4<0>, C4<0>;
v0x55b778011540 .array "A", 3 0, 31 0;
v0x55b778011620_0 .net "_fun3", 2 0, v0x55b777fc2320_0;  alias, 1 drivers
v0x55b778011730_0 .net "_fun7", 6 0, v0x55b77800a980_0;  alias, 1 drivers
v0x55b778011820_0 .net "_imm", 31 0, v0x55b77800aa40_0;  alias, 1 drivers
v0x55b778011930_0 .net "_opcode", 6 0, v0x55b77800ac50_0;  alias, 1 drivers
o0x7f13a5ab6ae8 .functor BUFZ 1, C4<z>; HiZ drive
v0x55b778011a90 .array "alu_busy", 3 0;
v0x55b778011a90_0 .net v0x55b778011a90 0, 0 0, o0x7f13a5ab6ae8; 0 drivers
v0x55b778011a90_1 .net v0x55b778011a90 1, 0 0, L_0x55b778024c60; 1 drivers
v0x55b778011a90_2 .net v0x55b778011a90 2, 0 0, L_0x55b778025410; 1 drivers
o0x7f13a5ab6b78 .functor BUFZ 1, C4<z>; HiZ drive
v0x55b778011a90_3 .net v0x55b778011a90 3, 0 0, o0x7f13a5ab6b78; 0 drivers
o0x7f13a5ab6ba8 .functor BUFZ 1, C4<z>; HiZ drive
v0x55b778011bb0 .array "alu_done", 3 0;
v0x55b778011bb0_0 .net v0x55b778011bb0 0, 0 0, o0x7f13a5ab6ba8; 0 drivers
v0x55b778011bb0_1 .net v0x55b778011bb0 1, 0 0, L_0x55b778024e10; 1 drivers
v0x55b778011bb0_2 .net v0x55b778011bb0 2, 0 0, L_0x55b7780255c0; 1 drivers
o0x7f13a5ab6c38 .functor BUFZ 1, C4<z>; HiZ drive
v0x55b778011bb0_3 .net v0x55b778011bb0 3, 0 0, o0x7f13a5ab6c38; 0 drivers
v0x55b778011cd0 .array "busy", 3 0, 0 0;
v0x55b778011d70_0 .net "clk", 0 0, v0x55b778014810_0;  alias, 1 drivers
v0x55b778011e10 .array "fun3", 3 0, 2 0;
v0x55b778011f50 .array "fun7", 3 0, 6 0;
v0x55b778012090_0 .net "get_npc", 0 0, L_0x7f13a5a6c0a8;  alias, 1 drivers
v0x55b778012130_0 .var/i "i", 31 0;
v0x55b7780121f0 .array "imm", 32 0, 31 0;
v0x55b7780122b0_0 .var "is_busy", 0 0;
v0x55b778012380_0 .var "mem_adr", 31 0;
v0x55b778012450_0 .net "mem_busy", 0 0, v0x55b778010ac0_0;  1 drivers
v0x55b778012520_0 .var "mem_in", 31 0;
v0x55b7780125f0_0 .var "mem_load", 0 0;
v0x55b7780126c0_0 .net "mem_out", 31 0, v0x55b778010ef0_0;  1 drivers
v0x55b778012790_0 .var "mem_start", 0 0;
v0x55b778012860_0 .net "npc", 31 0, o0x7f13a5ab5648;  alias, 0 drivers
v0x55b778012930_0 .net "opc", 31 0, o0x7f13a5ab5678;  alias, 0 drivers
v0x55b778012a00 .array "opcode", 3 0, 6 0;
v0x55b778012aa0_0 .var/i "qhead", 31 0;
v0x55b778012b40 .array "qi", 32 0, 4 0;
v0x55b778012be0 .array "qj", 3 0, 4 0;
v0x55b778012ca0 .array "qk", 3 0, 4 0;
v0x55b778012d60 .array "qreg", 32 0, 31 0;
v0x55b778012e20_0 .var/i "qsz", 31 0;
v0x55b778012f00_0 .var/i "qtail", 31 0;
v0x55b778012fe0 .array "que", 3 0, 31 0;
v0x55b7780130a0_0 .net "rd", 4 0, v0x55b77800ad30_0;  alias, 1 drivers
v0x55b778013370 .array "res", 3 0, 31 0;
v0x55b778013430 .array "res_get", 3 0, 0 0;
v0x55b7780134d0_0 .net "rs1", 4 0, v0x55b77800ae10_0;  alias, 1 drivers
v0x55b7780135e0_0 .net "rs2", 4 0, v0x55b77800aef0_0;  alias, 1 drivers
v0x55b7780136f0 .array "start", 3 0, 0 0;
o0x7f13a5ab6f68 .functor BUFZ 32, C4<zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz>; HiZ drive
v0x55b778013810 .array "tres", 3 0;
v0x55b778013810_0 .net v0x55b778013810 0, 31 0, o0x7f13a5ab6f68; 0 drivers
v0x55b778013810_1 .net v0x55b778013810 1, 31 0, L_0x55b778024d70; 1 drivers
v0x55b778013810_2 .net v0x55b778013810 2, 31 0, L_0x55b7780252d0; 1 drivers
o0x7f13a5ab6ff8 .functor BUFZ 32, C4<zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz>; HiZ drive
v0x55b778013810_3 .net v0x55b778013810 3, 31 0, o0x7f13a5ab6ff8; 0 drivers
v0x55b778013950 .array "vj", 3 0, 31 0;
v0x55b778013a90 .array "vk", 3 0, 31 0;
S_0x55b77800cd10 .scope module, "alu[0]" "alu" 7 57, 8 3 0, S_0x55b77800ca40;
 .timescale -9 -12;
    .port_info 0 /INPUT 1 "start"
    .port_info 1 /INPUT 7 "fun7"
    .port_info 2 /INPUT 3 "fun3"
    .port_info 3 /INPUT 32 "rs1"
    .port_info 4 /INPUT 32 "rs2"
    .port_info 5 /OUTPUT 32 "res"
    .port_info 6 /OUTPUT 1 "zero"
    .port_info 7 /OUTPUT 1 "neg"
    .port_info 8 /OUTPUT 1 "busy"
    .port_info 9 /OUTPUT 1 "done"
v0x55b77800d040_0 .var "busy", 0 0;
v0x55b77800d120_0 .var "done", 0 0;
o0x7f13a5ab5948 .functor BUFZ 3, C4<zzz>; HiZ drive
v0x55b77800d1e0_0 .net "fun3", 2 0, o0x7f13a5ab5948;  0 drivers
o0x7f13a5ab5978 .functor BUFZ 7, C4<zzzzzzz>; HiZ drive
v0x55b77800d2d0_0 .net "fun7", 6 0, o0x7f13a5ab5978;  0 drivers
v0x55b77800d3b0_0 .var "neg", 0 0;
v0x55b77800d4c0_0 .var "res", 31 0;
o0x7f13a5ab5a08 .functor BUFZ 32, C4<zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz>; HiZ drive
v0x55b77800d5a0_0 .net "rs1", 31 0, o0x7f13a5ab5a08;  0 drivers
o0x7f13a5ab5a38 .functor BUFZ 32, C4<zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz>; HiZ drive
v0x55b77800d680_0 .net "rs2", 31 0, o0x7f13a5ab5a38;  0 drivers
o0x7f13a5ab5a68 .functor BUFZ 1, C4<z>; HiZ drive
v0x55b77800d760_0 .net "start", 0 0, o0x7f13a5ab5a68;  0 drivers
v0x55b77800d820_0 .var "zero", 0 0;
E_0x55b777f67640 .event posedge, v0x55b77800d760_0;
S_0x55b77800da20 .scope module, "alu[1]" "alu" 7 57, 8 3 0, S_0x55b77800ca40;
 .timescale -9 -12;
    .port_info 0 /INPUT 1 "start"
    .port_info 1 /INPUT 7 "fun7"
    .port_info 2 /INPUT 3 "fun3"
    .port_info 3 /INPUT 32 "rs1"
    .port_info 4 /INPUT 32 "rs2"
    .port_info 5 /OUTPUT 32 "res"
    .port_info 6 /OUTPUT 1 "zero"
    .port_info 7 /OUTPUT 1 "neg"
    .port_info 8 /OUTPUT 1 "busy"
    .port_info 9 /OUTPUT 1 "done"
v0x55b77800dd00_0 .var "busy", 0 0;
v0x55b77800dde0_0 .var "done", 0 0;
v0x55b77800dea0_0 .net "fun3", 2 0, L_0x55b777fba720;  1 drivers
v0x55b77800df60_0 .net "fun7", 6 0, L_0x55b777f5b810;  1 drivers
v0x55b77800e040_0 .var "neg", 0 0;
v0x55b77800e150_0 .var "res", 31 0;
v0x55b77800e230_0 .net "rs1", 31 0, L_0x55b778024a90;  1 drivers
v0x55b77800e310_0 .net "rs2", 31 0, L_0x55b778024b90;  1 drivers
v0x55b77800e3f0_0 .net "start", 0 0, L_0x55b777f6fc50;  1 drivers
v0x55b77800e540_0 .var "zero", 0 0;
E_0x55b777f662a0 .event posedge, v0x55b77800e3f0_0;
S_0x55b77800e740 .scope module, "alu[2]" "alu" 7 57, 8 3 0, S_0x55b77800ca40;
 .timescale -9 -12;
    .port_info 0 /INPUT 1 "start"
    .port_info 1 /INPUT 7 "fun7"
    .port_info 2 /INPUT 3 "fun3"
    .port_info 3 /INPUT 32 "rs1"
    .port_info 4 /INPUT 32 "rs2"
    .port_info 5 /OUTPUT 32 "res"
    .port_info 6 /OUTPUT 1 "zero"
    .port_info 7 /OUTPUT 1 "neg"
    .port_info 8 /OUTPUT 1 "busy"
    .port_info 9 /OUTPUT 1 "done"
v0x55b77800ea00_0 .var "busy", 0 0;
v0x55b77800eae0_0 .var "done", 0 0;
v0x55b77800eba0_0 .net "fun3", 2 0, L_0x55b778025130;  1 drivers
v0x55b77800ec90_0 .net "fun7", 6 0, L_0x55b778025000;  1 drivers
v0x55b77800ed70_0 .var "neg", 0 0;
v0x55b77800ee80_0 .var "res", 31 0;
v0x55b77800ef60_0 .net "rs1", 31 0, L_0x55b778025200;  1 drivers
v0x55b77800f040_0 .net "rs2", 31 0, L_0x55b778025340;  1 drivers
v0x55b77800f120_0 .net "start", 0 0, L_0x55b778024f30;  1 drivers
v0x55b77800f270_0 .var "zero", 0 0;
E_0x55b777f678a0 .event posedge, v0x55b77800f120_0;
S_0x55b77800f4d0 .scope module, "alu[3]" "alu" 7 57, 8 3 0, S_0x55b77800ca40;
 .timescale -9 -12;
    .port_info 0 /INPUT 1 "start"
    .port_info 1 /INPUT 7 "fun7"
    .port_info 2 /INPUT 3 "fun3"
    .port_info 3 /INPUT 32 "rs1"
    .port_info 4 /INPUT 32 "rs2"
    .port_info 5 /OUTPUT 32 "res"
    .port_info 6 /OUTPUT 1 "zero"
    .port_info 7 /OUTPUT 1 "neg"
    .port_info 8 /OUTPUT 1 "busy"
    .port_info 9 /OUTPUT 1 "done"
v0x55b77800f7f0_0 .var "busy", 0 0;
v0x55b77800f8d0_0 .var "done", 0 0;
o0x7f13a5ab6488 .functor BUFZ 3, C4<zzz>; HiZ drive
v0x55b77800f990_0 .net "fun3", 2 0, o0x7f13a5ab6488;  0 drivers
o0x7f13a5ab64b8 .functor BUFZ 7, C4<zzzzzzz>; HiZ drive
v0x55b77800fa50_0 .net "fun7", 6 0, o0x7f13a5ab64b8;  0 drivers
v0x55b77800fb30_0 .var "neg", 0 0;
v0x55b77800fc40_0 .var "res", 31 0;
o0x7f13a5ab6548 .functor BUFZ 32, C4<zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz>; HiZ drive
v0x55b77800fd20_0 .net "rs1", 31 0, o0x7f13a5ab6548;  0 drivers
o0x7f13a5ab6578 .functor BUFZ 32, C4<zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz>; HiZ drive
v0x55b77800fe00_0 .net "rs2", 31 0, o0x7f13a5ab6578;  0 drivers
o0x7f13a5ab65a8 .functor BUFZ 1, C4<z>; HiZ drive
v0x55b77800fee0_0 .net "start", 0 0, o0x7f13a5ab65a8;  0 drivers
v0x55b778010030_0 .var "zero", 0 0;
E_0x55b77800f770 .event posedge, v0x55b77800fee0_0;
S_0x55b778010290 .scope begin, "init" "init" 7 73, 7 73 0, S_0x55b77800ca40;
 .timescale -9 -12;
v0x55b778010460_0 .var/i "i", 31 0;
S_0x55b778010560 .scope module, "mem" "ram" 7 69, 9 6 0, S_0x55b77800ca40;
 .timescale -9 -12;
    .port_info 0 /INPUT 1 "start"
    .port_info 1 /INPUT 32 "adr"
    .port_info 2 /INPUT 1 "load"
    .port_info 3 /INPUT 32 "in"
    .port_info 4 /OUTPUT 32 "out"
    .port_info 5 /OUTPUT 1 "busy"
P_0x55b778010730 .param/l "MEM_SIZE" 0 9 15, +C4<00000000000000000000010000000000>;
v0x55b7780109c0_0 .net "adr", 31 0, v0x55b778012380_0;  1 drivers
v0x55b778010ac0_0 .var "busy", 0 0;
v0x55b778010b80_0 .var/i "i", 31 0;
v0x55b778010c40_0 .net "in", 31 0, v0x55b778012520_0;  1 drivers
v0x55b778010d20_0 .net "load", 0 0, v0x55b7780125f0_0;  1 drivers
v0x55b778010e30 .array "mem", 1023 0, 31 0;
v0x55b778010ef0_0 .var "out", 31 0;
v0x55b778010fd0_0 .net "start", 0 0, v0x55b778012790_0;  1 drivers
E_0x55b778010940 .event posedge, v0x55b778010fd0_0;
S_0x55b778011190 .scope begin, "newcmd" "newcmd" 7 112, 7 112 0, S_0x55b77800ca40;
 .timescale -9 -12;
v0x55b778011360_0 .var/i "i", 31 0;
v0x55b778011460_0 .var/i "r", 31 0;
    .scope S_0x55b77800b0f0;
T_0 ;
    %pushi/vec4 1, 0, 1;
    %store/vec4 v0x55b77800b640_0, 0, 1;
    %pushi/vec4 0, 0, 32;
    %store/vec4 v0x55b77800b6e0_0, 0, 32;
T_0.0 ;
    %load/vec4 v0x55b77800b6e0_0;
    %cmpi/s 1024, 0, 32;
    %jmp/0xz T_0.1, 5;
    %pushi/vec4 0, 0, 32;
    %ix/getv/s 4, v0x55b77800b6e0_0;
    %store/vec4a v0x55b77800b970, 4, 0;
    %load/vec4 v0x55b77800b6e0_0;
    %addi 1, 0, 32;
    %store/vec4 v0x55b77800b6e0_0, 0, 32;
    %jmp T_0.0;
T_0.1 ;
    %vpi_call 6 22 "$readmemb", "instr.bin", v0x55b77800b970, 32'sb00000000000000000000000000000000, 32'sb00000000000000000000000000000010 {0 0 0};
    %pushi/vec4 0, 0, 32;
    %store/vec4 v0x55b77800ba30_0, 0, 32;
    %end;
    .thread T_0;
    .scope S_0x55b77800b0f0;
T_1 ;
    %wait E_0x55b777f66e30;
    %load/vec4 v0x55b77800b640_0;
    %flag_set/vec4 8;
    %jmp/0xz  T_1.0, 8;
    %pushi/vec4 0, 0, 1;
    %store/vec4 v0x55b77800b640_0, 0, 1;
    %load/vec4 v0x55b77800b8b0_0;
    %flag_set/vec4 8;
    %jmp/0xz  T_1.2, 8;
    %load/vec4 v0x55b77800b780_0;
    %load/vec4 v0x55b77800b480_0;
    %pushi/vec4 4, 0, 32;
    %div;
    %ix/vec4 4;
    %store/vec4a v0x55b77800b970, 4, 0;
    %pushi/vec4 0, 0, 32;
    %assign/vec4 v0x55b77800ba30_0, 0;
    %jmp T_1.3;
T_1.2 ;
    %load/vec4 v0x55b77800b480_0;
    %pushi/vec4 4, 0, 32;
    %div;
    %ix/vec4 4;
    %load/vec4a v0x55b77800b970, 4;
    %assign/vec4 v0x55b77800ba30_0, 0;
T_1.3 ;
    %pushi/vec4 1, 0, 1;
    %store/vec4 v0x55b77800b640_0, 0, 1;
T_1.0 ;
    %jmp T_1;
    .thread T_1;
    .scope S_0x55b777fd3990;
T_2 ;
    %wait E_0x55b777f67b00;
    %load/vec4 v0x55b77800ab20_0;
    %parti/s 5, 7, 4;
    %assign/vec4 v0x55b77800ad30_0, 0;
    %load/vec4 v0x55b77800ab20_0;
    %parti/s 5, 15, 5;
    %assign/vec4 v0x55b77800ae10_0, 0;
    %load/vec4 v0x55b77800ab20_0;
    %parti/s 5, 20, 6;
    %assign/vec4 v0x55b77800aef0_0, 0;
    %load/vec4 v0x55b77800ab20_0;
    %parti/s 7, 0, 2;
    %assign/vec4 v0x55b77800ac50_0, 0;
    %load/vec4 v0x55b77800ab20_0;
    %parti/s 3, 12, 5;
    %assign/vec4 v0x55b777fc2320_0, 0;
    %load/vec4 v0x55b77800ab20_0;
    %parti/s 7, 25, 6;
    %assign/vec4 v0x55b77800a980_0, 0;
    %load/vec4 v0x55b77800ab20_0;
    %parti/s 7, 0, 2;
    %dup/vec4;
    %pushi/vec4 19, 0, 7;
    %cmp/u;
    %jmp/1 T_2.0, 6;
    %dup/vec4;
    %pushi/vec4 51, 0, 7;
    %cmp/u;
    %jmp/1 T_2.1, 6;
    %dup/vec4;
    %pushi/vec4 55, 0, 7;
    %cmp/u;
    %jmp/1 T_2.2, 6;
    %dup/vec4;
    %pushi/vec4 23, 0, 7;
    %cmp/u;
    %jmp/1 T_2.3, 6;
    %dup/vec4;
    %pushi/vec4 111, 0, 7;
    %cmp/u;
    %jmp/1 T_2.4, 6;
    %dup/vec4;
    %pushi/vec4 103, 0, 7;
    %cmp/u;
    %jmp/1 T_2.5, 6;
    %dup/vec4;
    %pushi/vec4 99, 0, 7;
    %cmp/u;
    %jmp/1 T_2.6, 6;
    %dup/vec4;
    %pushi/vec4 3, 0, 7;
    %cmp/u;
    %jmp/1 T_2.7, 6;
    %dup/vec4;
    %pushi/vec4 35, 0, 7;
    %cmp/u;
    %jmp/1 T_2.8, 6;
    %dup/vec4;
    %pushi/vec4 15, 0, 7;
    %cmp/u;
    %jmp/1 T_2.9, 6;
    %dup/vec4;
    %pushi/vec4 115, 0, 7;
    %cmp/u;
    %jmp/1 T_2.10, 6;
    %jmp T_2.11;
T_2.0 ;
    %load/vec4 v0x55b77800ab20_0;
    %parti/s 12, 20, 6;
    %pad/u 32;
    %assign/vec4 v0x55b77800aa40_0, 0;
    %jmp T_2.11;
T_2.1 ;
    %load/vec4 v0x55b77800ab20_0;
    %parti/s 12, 20, 6;
    %pad/u 32;
    %assign/vec4 v0x55b77800aa40_0, 0;
    %jmp T_2.11;
T_2.2 ;
    %load/vec4 v0x55b77800ab20_0;
    %parti/s 20, 12, 5;
    %pad/u 32;
    %assign/vec4 v0x55b77800aa40_0, 0;
    %jmp T_2.11;
T_2.3 ;
    %load/vec4 v0x55b77800ab20_0;
    %parti/s 20, 12, 5;
    %pad/u 32;
    %assign/vec4 v0x55b77800aa40_0, 0;
    %jmp T_2.11;
T_2.4 ;
    %load/vec4 v0x55b77800ab20_0;
    %parti/s 20, 12, 5;
    %pad/u 32;
    %assign/vec4 v0x55b77800aa40_0, 0;
    %jmp T_2.11;
T_2.5 ;
    %load/vec4 v0x55b77800ab20_0;
    %parti/s 12, 20, 6;
    %pad/u 32;
    %assign/vec4 v0x55b77800aa40_0, 0;
    %jmp T_2.11;
T_2.6 ;
    %load/vec4 v0x55b77800ab20_0;
    %parti/s 7, 25, 6;
    %load/vec4 v0x55b77800ab20_0;
    %parti/s 5, 7, 4;
    %concat/vec4; draw_concat_vec4
    %pad/u 32;
    %assign/vec4 v0x55b77800aa40_0, 0;
    %jmp T_2.11;
T_2.7 ;
    %load/vec4 v0x55b77800ab20_0;
    %parti/s 12, 20, 6;
    %pad/u 32;
    %assign/vec4 v0x55b77800aa40_0, 0;
    %jmp T_2.11;
T_2.8 ;
    %load/vec4 v0x55b77800ab20_0;
    %parti/s 7, 25, 6;
    %load/vec4 v0x55b77800ab20_0;
    %parti/s 5, 7, 4;
    %concat/vec4; draw_concat_vec4
    %pad/u 32;
    %assign/vec4 v0x55b77800aa40_0, 0;
    %jmp T_2.11;
T_2.9 ;
    %vpi_call 5 68 "$display", "MEM mei xie" {0 0 0};
    %jmp T_2.11;
T_2.10 ;
    %vpi_call 5 70 "$display", "SYS mei xie" {0 0 0};
    %jmp T_2.11;
T_2.11 ;
    %pop/vec4 1;
    %jmp T_2;
    .thread T_2, $push;
    .scope S_0x55b777fd4090;
T_3 ;
    %pushi/vec4 0, 0, 32;
    %store/vec4 v0x55b77800c4d0_0, 0, 32;
    %pushi/vec4 1, 0, 1;
    %store/vec4 v0x55b77800c1b0_0, 0, 1;
    %pushi/vec4 0, 0, 32;
    %store/vec4 v0x55b77800c070_0, 0, 32;
    %end;
    .thread T_3;
    .scope S_0x55b777fd4090;
T_4 ;
    %wait E_0x55b777f66e30;
    %vpi_call 4 56 "$display", "is_fetch: %d", v0x55b77800c1b0_0 {0 0 0};
    %vpi_call 4 57 "$display", "instr : %b", v0x55b77800c070_0 {0 0 0};
    %vpi_call 4 58 "$display", "pc : %b", v0x55b77800c4d0_0 {0 0 0};
    %pushi/vec4 0, 0, 32;
    %store/vec4 v0x55b77800c070_0, 0, 32;
    %load/vec4 v0x55b77800c1b0_0;
    %flag_set/vec4 8;
    %jmp/0xz  T_4.0, 8;
    %load/vec4 v0x55b77800c110_0;
    %nor/r;
    %load/vec4 v0x55b77800bce0_0;
    %and;
    %flag_set/vec4 8;
    %jmp/0xz  T_4.2, 8;
    %load/vec4 v0x55b77800c810_0;
    %assign/vec4 v0x55b77800c070_0, 0;
    %load/vec4 v0x55b77800c4d0_0;
    %addi 4, 0, 32;
    %assign/vec4 v0x55b77800c4d0_0, 0;
    %load/vec4 v0x55b77800c410_0;
    %cmpi/e 99, 0, 7;
    %jmp/0xz  T_4.4, 4;
    %pushi/vec4 0, 0, 1;
    %assign/vec4 v0x55b77800c1b0_0, 0;
T_4.4 ;
    %jmp T_4.3;
T_4.2 ;
    %pushi/vec4 19, 0, 32;
    %assign/vec4 v0x55b77800c070_0, 0;
    %load/vec4 v0x55b77800c4d0_0;
    %assign/vec4 v0x55b77800c4d0_0, 0;
T_4.3 ;
    %jmp T_4.1;
T_4.0 ;
    %pushi/vec4 19, 0, 32;
    %assign/vec4 v0x55b77800c070_0, 0;
    %load/vec4 v0x55b77800bee0_0;
    %flag_set/vec4 8;
    %jmp/0xz  T_4.6, 8;
    %pushi/vec4 1, 0, 1;
    %assign/vec4 v0x55b77800c1b0_0, 0;
    %load/vec4 v0x55b77800c250_0;
    %assign/vec4 v0x55b77800c4d0_0, 0;
T_4.6 ;
T_4.1 ;
    %jmp T_4;
    .thread T_4;
    .scope S_0x55b77800f4d0;
T_5 ;
    %pushi/vec4 0, 0, 1;
    %store/vec4 v0x55b77800f7f0_0, 0, 1;
    %end;
    .thread T_5;
    .scope S_0x55b77800f4d0;
T_6 ;
    %wait E_0x55b77800f770;
    %load/vec4 v0x55b77800f7f0_0;
    %nor/r;
    %flag_set/vec4 8;
    %jmp/0xz  T_6.0, 8;
    %pushi/vec4 1, 0, 1;
    %store/vec4 v0x55b77800f7f0_0, 0, 1;
    %pushi/vec4 0, 0, 1;
    %store/vec4 v0x55b77800f8d0_0, 0, 1;
    %load/vec4 v0x55b77800f990_0;
    %dup/vec4;
    %pushi/vec4 0, 0, 3;
    %cmp/u;
    %jmp/1 T_6.2, 6;
    %dup/vec4;
    %pushi/vec4 7, 0, 3;
    %cmp/u;
    %jmp/1 T_6.3, 6;
    %dup/vec4;
    %pushi/vec4 6, 0, 3;
    %cmp/u;
    %jmp/1 T_6.4, 6;
    %dup/vec4;
    %pushi/vec4 4, 0, 3;
    %cmp/u;
    %jmp/1 T_6.5, 6;
    %dup/vec4;
    %pushi/vec4 1, 0, 3;
    %cmp/u;
    %jmp/1 T_6.6, 6;
    %dup/vec4;
    %pushi/vec4 5, 0, 3;
    %cmp/u;
    %jmp/1 T_6.7, 6;
    %dup/vec4;
    %pushi/vec4 2, 0, 3;
    %cmp/u;
    %jmp/1 T_6.8, 6;
    %dup/vec4;
    %pushi/vec4 3, 0, 3;
    %cmp/u;
    %jmp/1 T_6.9, 6;
    %jmp T_6.10;
T_6.2 ;
    %load/vec4 v0x55b77800fa50_0;
    %parti/s 1, 5, 4;
    %cmpi/e 0, 0, 1;
    %flag_mov 8, 4;
    %jmp/0 T_6.11, 8;
    %load/vec4 v0x55b77800fd20_0;
    %load/vec4 v0x55b77800fe00_0;
    %add;
    %jmp/1 T_6.12, 8;
T_6.11 ; End of true expr.
    %load/vec4 v0x55b77800fd20_0;
    %load/vec4 v0x55b77800fe00_0;
    %sub;
    %jmp/0 T_6.12, 8;
 ; End of false expr.
    %blend;
T_6.12;
    %store/vec4 v0x55b77800fc40_0, 0, 32;
    %jmp T_6.10;
T_6.3 ;
    %load/vec4 v0x55b77800fd20_0;
    %load/vec4 v0x55b77800fe00_0;
    %and;
    %store/vec4 v0x55b77800fc40_0, 0, 32;
    %jmp T_6.10;
T_6.4 ;
    %load/vec4 v0x55b77800fd20_0;
    %load/vec4 v0x55b77800fe00_0;
    %or;
    %store/vec4 v0x55b77800fc40_0, 0, 32;
    %jmp T_6.10;
T_6.5 ;
    %load/vec4 v0x55b77800fd20_0;
    %load/vec4 v0x55b77800fe00_0;
    %xor;
    %store/vec4 v0x55b77800fc40_0, 0, 32;
    %jmp T_6.10;
T_6.6 ;
    %load/vec4 v0x55b77800fd20_0;
    %ix/getv 4, v0x55b77800fe00_0;
    %shiftl 4;
    %store/vec4 v0x55b77800fc40_0, 0, 32;
    %jmp T_6.10;
T_6.7 ;
    %load/vec4 v0x55b77800fa50_0;
    %parti/s 1, 5, 4;
    %cmpi/e 0, 0, 1;
    %flag_mov 8, 4;
    %jmp/0 T_6.13, 8;
    %load/vec4 v0x55b77800fd20_0;
    %ix/getv 4, v0x55b77800fe00_0;
    %shiftr 4;
    %jmp/1 T_6.14, 8;
T_6.13 ; End of true expr.
    %load/vec4 v0x55b77800fe00_0;
    %ix/getv 4, v0x55b77800fd20_0;
    %shiftr 4;
    %jmp/0 T_6.14, 8;
 ; End of false expr.
    %blend;
T_6.14;
    %store/vec4 v0x55b77800fc40_0, 0, 32;
    %jmp T_6.10;
T_6.8 ;
    %load/vec4 v0x55b77800fd20_0;
    %load/vec4 v0x55b77800fe00_0;
    %cmp/s;
    %flag_mov 8, 5;
    %jmp/0 T_6.15, 8;
    %pushi/vec4 1, 0, 32;
    %jmp/1 T_6.16, 8;
T_6.15 ; End of true expr.
    %pushi/vec4 0, 0, 32;
    %jmp/0 T_6.16, 8;
 ; End of false expr.
    %blend;
T_6.16;
    %store/vec4 v0x55b77800fc40_0, 0, 32;
    %jmp T_6.10;
T_6.9 ;
    %load/vec4 v0x55b77800fd20_0;
    %load/vec4 v0x55b77800fe00_0;
    %cmp/u;
    %flag_mov 8, 5;
    %jmp/0 T_6.17, 8;
    %pushi/vec4 1, 0, 32;
    %jmp/1 T_6.18, 8;
T_6.17 ; End of true expr.
    %pushi/vec4 0, 0, 32;
    %jmp/0 T_6.18, 8;
 ; End of false expr.
    %blend;
T_6.18;
    %store/vec4 v0x55b77800fc40_0, 0, 32;
    %jmp T_6.10;
T_6.10 ;
    %pop/vec4 1;
    %vpi_call 8 37 "$display", "alu res=%x busy=%d", v0x55b77800fc40_0, v0x55b77800f7f0_0 {0 0 0};
    %load/vec4 v0x55b77800fc40_0;
    %cmpi/e 0, 0, 32;
    %flag_mov 8, 4;
    %jmp/0 T_6.19, 8;
    %pushi/vec4 1, 0, 1;
    %jmp/1 T_6.20, 8;
T_6.19 ; End of true expr.
    %pushi/vec4 0, 0, 1;
    %jmp/0 T_6.20, 8;
 ; End of false expr.
    %blend;
T_6.20;
    %assign/vec4 v0x55b778010030_0, 0;
    %load/vec4 v0x55b77800fc40_0;
    %cmpi/u 0, 0, 32;
    %flag_mov 8, 5;
    %jmp/0 T_6.21, 8;
    %pushi/vec4 1, 0, 1;
    %jmp/1 T_6.22, 8;
T_6.21 ; End of true expr.
    %pushi/vec4 0, 0, 1;
    %jmp/0 T_6.22, 8;
 ; End of false expr.
    %blend;
T_6.22;
    %assign/vec4 v0x55b77800fb30_0, 0;
    %pushi/vec4 0, 0, 1;
    %store/vec4 v0x55b77800f7f0_0, 0, 1;
    %pushi/vec4 1, 0, 1;
    %store/vec4 v0x55b77800f8d0_0, 0, 1;
T_6.0 ;
    %jmp T_6;
    .thread T_6;
    .scope S_0x55b77800e740;
T_7 ;
    %pushi/vec4 0, 0, 1;
    %store/vec4 v0x55b77800ea00_0, 0, 1;
    %end;
    .thread T_7;
    .scope S_0x55b77800e740;
T_8 ;
    %wait E_0x55b777f678a0;
    %load/vec4 v0x55b77800ea00_0;
    %nor/r;
    %flag_set/vec4 8;
    %jmp/0xz  T_8.0, 8;
    %pushi/vec4 1, 0, 1;
    %store/vec4 v0x55b77800ea00_0, 0, 1;
    %pushi/vec4 0, 0, 1;
    %store/vec4 v0x55b77800eae0_0, 0, 1;
    %load/vec4 v0x55b77800eba0_0;
    %dup/vec4;
    %pushi/vec4 0, 0, 3;
    %cmp/u;
    %jmp/1 T_8.2, 6;
    %dup/vec4;
    %pushi/vec4 7, 0, 3;
    %cmp/u;
    %jmp/1 T_8.3, 6;
    %dup/vec4;
    %pushi/vec4 6, 0, 3;
    %cmp/u;
    %jmp/1 T_8.4, 6;
    %dup/vec4;
    %pushi/vec4 4, 0, 3;
    %cmp/u;
    %jmp/1 T_8.5, 6;
    %dup/vec4;
    %pushi/vec4 1, 0, 3;
    %cmp/u;
    %jmp/1 T_8.6, 6;
    %dup/vec4;
    %pushi/vec4 5, 0, 3;
    %cmp/u;
    %jmp/1 T_8.7, 6;
    %dup/vec4;
    %pushi/vec4 2, 0, 3;
    %cmp/u;
    %jmp/1 T_8.8, 6;
    %dup/vec4;
    %pushi/vec4 3, 0, 3;
    %cmp/u;
    %jmp/1 T_8.9, 6;
    %jmp T_8.10;
T_8.2 ;
    %load/vec4 v0x55b77800ec90_0;
    %parti/s 1, 5, 4;
    %cmpi/e 0, 0, 1;
    %flag_mov 8, 4;
    %jmp/0 T_8.11, 8;
    %load/vec4 v0x55b77800ef60_0;
    %load/vec4 v0x55b77800f040_0;
    %add;
    %jmp/1 T_8.12, 8;
T_8.11 ; End of true expr.
    %load/vec4 v0x55b77800ef60_0;
    %load/vec4 v0x55b77800f040_0;
    %sub;
    %jmp/0 T_8.12, 8;
 ; End of false expr.
    %blend;
T_8.12;
    %store/vec4 v0x55b77800ee80_0, 0, 32;
    %jmp T_8.10;
T_8.3 ;
    %load/vec4 v0x55b77800ef60_0;
    %load/vec4 v0x55b77800f040_0;
    %and;
    %store/vec4 v0x55b77800ee80_0, 0, 32;
    %jmp T_8.10;
T_8.4 ;
    %load/vec4 v0x55b77800ef60_0;
    %load/vec4 v0x55b77800f040_0;
    %or;
    %store/vec4 v0x55b77800ee80_0, 0, 32;
    %jmp T_8.10;
T_8.5 ;
    %load/vec4 v0x55b77800ef60_0;
    %load/vec4 v0x55b77800f040_0;
    %xor;
    %store/vec4 v0x55b77800ee80_0, 0, 32;
    %jmp T_8.10;
T_8.6 ;
    %load/vec4 v0x55b77800ef60_0;
    %ix/getv 4, v0x55b77800f040_0;
    %shiftl 4;
    %store/vec4 v0x55b77800ee80_0, 0, 32;
    %jmp T_8.10;
T_8.7 ;
    %load/vec4 v0x55b77800ec90_0;
    %parti/s 1, 5, 4;
    %cmpi/e 0, 0, 1;
    %flag_mov 8, 4;
    %jmp/0 T_8.13, 8;
    %load/vec4 v0x55b77800ef60_0;
    %ix/getv 4, v0x55b77800f040_0;
    %shiftr 4;
    %jmp/1 T_8.14, 8;
T_8.13 ; End of true expr.
    %load/vec4 v0x55b77800f040_0;
    %ix/getv 4, v0x55b77800ef60_0;
    %shiftr 4;
    %jmp/0 T_8.14, 8;
 ; End of false expr.
    %blend;
T_8.14;
    %store/vec4 v0x55b77800ee80_0, 0, 32;
    %jmp T_8.10;
T_8.8 ;
    %load/vec4 v0x55b77800ef60_0;
    %load/vec4 v0x55b77800f040_0;
    %cmp/s;
    %flag_mov 8, 5;
    %jmp/0 T_8.15, 8;
    %pushi/vec4 1, 0, 32;
    %jmp/1 T_8.16, 8;
T_8.15 ; End of true expr.
    %pushi/vec4 0, 0, 32;
    %jmp/0 T_8.16, 8;
 ; End of false expr.
    %blend;
T_8.16;
    %store/vec4 v0x55b77800ee80_0, 0, 32;
    %jmp T_8.10;
T_8.9 ;
    %load/vec4 v0x55b77800ef60_0;
    %load/vec4 v0x55b77800f040_0;
    %cmp/u;
    %flag_mov 8, 5;
    %jmp/0 T_8.17, 8;
    %pushi/vec4 1, 0, 32;
    %jmp/1 T_8.18, 8;
T_8.17 ; End of true expr.
    %pushi/vec4 0, 0, 32;
    %jmp/0 T_8.18, 8;
 ; End of false expr.
    %blend;
T_8.18;
    %store/vec4 v0x55b77800ee80_0, 0, 32;
    %jmp T_8.10;
T_8.10 ;
    %pop/vec4 1;
    %vpi_call 8 37 "$display", "alu res=%x busy=%d", v0x55b77800ee80_0, v0x55b77800ea00_0 {0 0 0};
    %load/vec4 v0x55b77800ee80_0;
    %cmpi/e 0, 0, 32;
    %flag_mov 8, 4;
    %jmp/0 T_8.19, 8;
    %pushi/vec4 1, 0, 1;
    %jmp/1 T_8.20, 8;
T_8.19 ; End of true expr.
    %pushi/vec4 0, 0, 1;
    %jmp/0 T_8.20, 8;
 ; End of false expr.
    %blend;
T_8.20;
    %assign/vec4 v0x55b77800f270_0, 0;
    %load/vec4 v0x55b77800ee80_0;
    %cmpi/u 0, 0, 32;
    %flag_mov 8, 5;
    %jmp/0 T_8.21, 8;
    %pushi/vec4 1, 0, 1;
    %jmp/1 T_8.22, 8;
T_8.21 ; End of true expr.
    %pushi/vec4 0, 0, 1;
    %jmp/0 T_8.22, 8;
 ; End of false expr.
    %blend;
T_8.22;
    %assign/vec4 v0x55b77800ed70_0, 0;
    %pushi/vec4 0, 0, 1;
    %store/vec4 v0x55b77800ea00_0, 0, 1;
    %pushi/vec4 1, 0, 1;
    %store/vec4 v0x55b77800eae0_0, 0, 1;
T_8.0 ;
    %jmp T_8;
    .thread T_8;
    .scope S_0x55b77800da20;
T_9 ;
    %pushi/vec4 0, 0, 1;
    %store/vec4 v0x55b77800dd00_0, 0, 1;
    %end;
    .thread T_9;
    .scope S_0x55b77800da20;
T_10 ;
    %wait E_0x55b777f662a0;
    %load/vec4 v0x55b77800dd00_0;
    %nor/r;
    %flag_set/vec4 8;
    %jmp/0xz  T_10.0, 8;
    %pushi/vec4 1, 0, 1;
    %store/vec4 v0x55b77800dd00_0, 0, 1;
    %pushi/vec4 0, 0, 1;
    %store/vec4 v0x55b77800dde0_0, 0, 1;
    %load/vec4 v0x55b77800dea0_0;
    %dup/vec4;
    %pushi/vec4 0, 0, 3;
    %cmp/u;
    %jmp/1 T_10.2, 6;
    %dup/vec4;
    %pushi/vec4 7, 0, 3;
    %cmp/u;
    %jmp/1 T_10.3, 6;
    %dup/vec4;
    %pushi/vec4 6, 0, 3;
    %cmp/u;
    %jmp/1 T_10.4, 6;
    %dup/vec4;
    %pushi/vec4 4, 0, 3;
    %cmp/u;
    %jmp/1 T_10.5, 6;
    %dup/vec4;
    %pushi/vec4 1, 0, 3;
    %cmp/u;
    %jmp/1 T_10.6, 6;
    %dup/vec4;
    %pushi/vec4 5, 0, 3;
    %cmp/u;
    %jmp/1 T_10.7, 6;
    %dup/vec4;
    %pushi/vec4 2, 0, 3;
    %cmp/u;
    %jmp/1 T_10.8, 6;
    %dup/vec4;
    %pushi/vec4 3, 0, 3;
    %cmp/u;
    %jmp/1 T_10.9, 6;
    %jmp T_10.10;
T_10.2 ;
    %load/vec4 v0x55b77800df60_0;
    %parti/s 1, 5, 4;
    %cmpi/e 0, 0, 1;
    %flag_mov 8, 4;
    %jmp/0 T_10.11, 8;
    %load/vec4 v0x55b77800e230_0;
    %load/vec4 v0x55b77800e310_0;
    %add;
    %jmp/1 T_10.12, 8;
T_10.11 ; End of true expr.
    %load/vec4 v0x55b77800e230_0;
    %load/vec4 v0x55b77800e310_0;
    %sub;
    %jmp/0 T_10.12, 8;
 ; End of false expr.
    %blend;
T_10.12;
    %store/vec4 v0x55b77800e150_0, 0, 32;
    %jmp T_10.10;
T_10.3 ;
    %load/vec4 v0x55b77800e230_0;
    %load/vec4 v0x55b77800e310_0;
    %and;
    %store/vec4 v0x55b77800e150_0, 0, 32;
    %jmp T_10.10;
T_10.4 ;
    %load/vec4 v0x55b77800e230_0;
    %load/vec4 v0x55b77800e310_0;
    %or;
    %store/vec4 v0x55b77800e150_0, 0, 32;
    %jmp T_10.10;
T_10.5 ;
    %load/vec4 v0x55b77800e230_0;
    %load/vec4 v0x55b77800e310_0;
    %xor;
    %store/vec4 v0x55b77800e150_0, 0, 32;
    %jmp T_10.10;
T_10.6 ;
    %load/vec4 v0x55b77800e230_0;
    %ix/getv 4, v0x55b77800e310_0;
    %shiftl 4;
    %store/vec4 v0x55b77800e150_0, 0, 32;
    %jmp T_10.10;
T_10.7 ;
    %load/vec4 v0x55b77800df60_0;
    %parti/s 1, 5, 4;
    %cmpi/e 0, 0, 1;
    %flag_mov 8, 4;
    %jmp/0 T_10.13, 8;
    %load/vec4 v0x55b77800e230_0;
    %ix/getv 4, v0x55b77800e310_0;
    %shiftr 4;
    %jmp/1 T_10.14, 8;
T_10.13 ; End of true expr.
    %load/vec4 v0x55b77800e310_0;
    %ix/getv 4, v0x55b77800e230_0;
    %shiftr 4;
    %jmp/0 T_10.14, 8;
 ; End of false expr.
    %blend;
T_10.14;
    %store/vec4 v0x55b77800e150_0, 0, 32;
    %jmp T_10.10;
T_10.8 ;
    %load/vec4 v0x55b77800e230_0;
    %load/vec4 v0x55b77800e310_0;
    %cmp/s;
    %flag_mov 8, 5;
    %jmp/0 T_10.15, 8;
    %pushi/vec4 1, 0, 32;
    %jmp/1 T_10.16, 8;
T_10.15 ; End of true expr.
    %pushi/vec4 0, 0, 32;
    %jmp/0 T_10.16, 8;
 ; End of false expr.
    %blend;
T_10.16;
    %store/vec4 v0x55b77800e150_0, 0, 32;
    %jmp T_10.10;
T_10.9 ;
    %load/vec4 v0x55b77800e230_0;
    %load/vec4 v0x55b77800e310_0;
    %cmp/u;
    %flag_mov 8, 5;
    %jmp/0 T_10.17, 8;
    %pushi/vec4 1, 0, 32;
    %jmp/1 T_10.18, 8;
T_10.17 ; End of true expr.
    %pushi/vec4 0, 0, 32;
    %jmp/0 T_10.18, 8;
 ; End of false expr.
    %blend;
T_10.18;
    %store/vec4 v0x55b77800e150_0, 0, 32;
    %jmp T_10.10;
T_10.10 ;
    %pop/vec4 1;
    %vpi_call 8 37 "$display", "alu res=%x busy=%d", v0x55b77800e150_0, v0x55b77800dd00_0 {0 0 0};
    %load/vec4 v0x55b77800e150_0;
    %cmpi/e 0, 0, 32;
    %flag_mov 8, 4;
    %jmp/0 T_10.19, 8;
    %pushi/vec4 1, 0, 1;
    %jmp/1 T_10.20, 8;
T_10.19 ; End of true expr.
    %pushi/vec4 0, 0, 1;
    %jmp/0 T_10.20, 8;
 ; End of false expr.
    %blend;
T_10.20;
    %assign/vec4 v0x55b77800e540_0, 0;
    %load/vec4 v0x55b77800e150_0;
    %cmpi/u 0, 0, 32;
    %flag_mov 8, 5;
    %jmp/0 T_10.21, 8;
    %pushi/vec4 1, 0, 1;
    %jmp/1 T_10.22, 8;
T_10.21 ; End of true expr.
    %pushi/vec4 0, 0, 1;
    %jmp/0 T_10.22, 8;
 ; End of false expr.
    %blend;
T_10.22;
    %assign/vec4 v0x55b77800e040_0, 0;
    %pushi/vec4 0, 0, 1;
    %store/vec4 v0x55b77800dd00_0, 0, 1;
    %pushi/vec4 1, 0, 1;
    %store/vec4 v0x55b77800dde0_0, 0, 1;
T_10.0 ;
    %jmp T_10;
    .thread T_10;
    .scope S_0x55b77800cd10;
T_11 ;
    %pushi/vec4 0, 0, 1;
    %store/vec4 v0x55b77800d040_0, 0, 1;
    %end;
    .thread T_11;
    .scope S_0x55b77800cd10;
T_12 ;
    %wait E_0x55b777f67640;
    %load/vec4 v0x55b77800d040_0;
    %nor/r;
    %flag_set/vec4 8;
    %jmp/0xz  T_12.0, 8;
    %pushi/vec4 1, 0, 1;
    %store/vec4 v0x55b77800d040_0, 0, 1;
    %pushi/vec4 0, 0, 1;
    %store/vec4 v0x55b77800d120_0, 0, 1;
    %load/vec4 v0x55b77800d1e0_0;
    %dup/vec4;
    %pushi/vec4 0, 0, 3;
    %cmp/u;
    %jmp/1 T_12.2, 6;
    %dup/vec4;
    %pushi/vec4 7, 0, 3;
    %cmp/u;
    %jmp/1 T_12.3, 6;
    %dup/vec4;
    %pushi/vec4 6, 0, 3;
    %cmp/u;
    %jmp/1 T_12.4, 6;
    %dup/vec4;
    %pushi/vec4 4, 0, 3;
    %cmp/u;
    %jmp/1 T_12.5, 6;
    %dup/vec4;
    %pushi/vec4 1, 0, 3;
    %cmp/u;
    %jmp/1 T_12.6, 6;
    %dup/vec4;
    %pushi/vec4 5, 0, 3;
    %cmp/u;
    %jmp/1 T_12.7, 6;
    %dup/vec4;
    %pushi/vec4 2, 0, 3;
    %cmp/u;
    %jmp/1 T_12.8, 6;
    %dup/vec4;
    %pushi/vec4 3, 0, 3;
    %cmp/u;
    %jmp/1 T_12.9, 6;
    %jmp T_12.10;
T_12.2 ;
    %load/vec4 v0x55b77800d2d0_0;
    %parti/s 1, 5, 4;
    %cmpi/e 0, 0, 1;
    %flag_mov 8, 4;
    %jmp/0 T_12.11, 8;
    %load/vec4 v0x55b77800d5a0_0;
    %load/vec4 v0x55b77800d680_0;
    %add;
    %jmp/1 T_12.12, 8;
T_12.11 ; End of true expr.
    %load/vec4 v0x55b77800d5a0_0;
    %load/vec4 v0x55b77800d680_0;
    %sub;
    %jmp/0 T_12.12, 8;
 ; End of false expr.
    %blend;
T_12.12;
    %store/vec4 v0x55b77800d4c0_0, 0, 32;
    %jmp T_12.10;
T_12.3 ;
    %load/vec4 v0x55b77800d5a0_0;
    %load/vec4 v0x55b77800d680_0;
    %and;
    %store/vec4 v0x55b77800d4c0_0, 0, 32;
    %jmp T_12.10;
T_12.4 ;
    %load/vec4 v0x55b77800d5a0_0;
    %load/vec4 v0x55b77800d680_0;
    %or;
    %store/vec4 v0x55b77800d4c0_0, 0, 32;
    %jmp T_12.10;
T_12.5 ;
    %load/vec4 v0x55b77800d5a0_0;
    %load/vec4 v0x55b77800d680_0;
    %xor;
    %store/vec4 v0x55b77800d4c0_0, 0, 32;
    %jmp T_12.10;
T_12.6 ;
    %load/vec4 v0x55b77800d5a0_0;
    %ix/getv 4, v0x55b77800d680_0;
    %shiftl 4;
    %store/vec4 v0x55b77800d4c0_0, 0, 32;
    %jmp T_12.10;
T_12.7 ;
    %load/vec4 v0x55b77800d2d0_0;
    %parti/s 1, 5, 4;
    %cmpi/e 0, 0, 1;
    %flag_mov 8, 4;
    %jmp/0 T_12.13, 8;
    %load/vec4 v0x55b77800d5a0_0;
    %ix/getv 4, v0x55b77800d680_0;
    %shiftr 4;
    %jmp/1 T_12.14, 8;
T_12.13 ; End of true expr.
    %load/vec4 v0x55b77800d680_0;
    %ix/getv 4, v0x55b77800d5a0_0;
    %shiftr 4;
    %jmp/0 T_12.14, 8;
 ; End of false expr.
    %blend;
T_12.14;
    %store/vec4 v0x55b77800d4c0_0, 0, 32;
    %jmp T_12.10;
T_12.8 ;
    %load/vec4 v0x55b77800d5a0_0;
    %load/vec4 v0x55b77800d680_0;
    %cmp/s;
    %flag_mov 8, 5;
    %jmp/0 T_12.15, 8;
    %pushi/vec4 1, 0, 32;
    %jmp/1 T_12.16, 8;
T_12.15 ; End of true expr.
    %pushi/vec4 0, 0, 32;
    %jmp/0 T_12.16, 8;
 ; End of false expr.
    %blend;
T_12.16;
    %store/vec4 v0x55b77800d4c0_0, 0, 32;
    %jmp T_12.10;
T_12.9 ;
    %load/vec4 v0x55b77800d5a0_0;
    %load/vec4 v0x55b77800d680_0;
    %cmp/u;
    %flag_mov 8, 5;
    %jmp/0 T_12.17, 8;
    %pushi/vec4 1, 0, 32;
    %jmp/1 T_12.18, 8;
T_12.17 ; End of true expr.
    %pushi/vec4 0, 0, 32;
    %jmp/0 T_12.18, 8;
 ; End of false expr.
    %blend;
T_12.18;
    %store/vec4 v0x55b77800d4c0_0, 0, 32;
    %jmp T_12.10;
T_12.10 ;
    %pop/vec4 1;
    %vpi_call 8 37 "$display", "alu res=%x busy=%d", v0x55b77800d4c0_0, v0x55b77800d040_0 {0 0 0};
    %load/vec4 v0x55b77800d4c0_0;
    %cmpi/e 0, 0, 32;
    %flag_mov 8, 4;
    %jmp/0 T_12.19, 8;
    %pushi/vec4 1, 0, 1;
    %jmp/1 T_12.20, 8;
T_12.19 ; End of true expr.
    %pushi/vec4 0, 0, 1;
    %jmp/0 T_12.20, 8;
 ; End of false expr.
    %blend;
T_12.20;
    %assign/vec4 v0x55b77800d820_0, 0;
    %load/vec4 v0x55b77800d4c0_0;
    %cmpi/u 0, 0, 32;
    %flag_mov 8, 5;
    %jmp/0 T_12.21, 8;
    %pushi/vec4 1, 0, 1;
    %jmp/1 T_12.22, 8;
T_12.21 ; End of true expr.
    %pushi/vec4 0, 0, 1;
    %jmp/0 T_12.22, 8;
 ; End of false expr.
    %blend;
T_12.22;
    %assign/vec4 v0x55b77800d3b0_0, 0;
    %pushi/vec4 0, 0, 1;
    %store/vec4 v0x55b77800d040_0, 0, 1;
    %pushi/vec4 1, 0, 1;
    %store/vec4 v0x55b77800d120_0, 0, 1;
T_12.0 ;
    %jmp T_12;
    .thread T_12;
    .scope S_0x55b778010560;
T_13 ;
    %pushi/vec4 0, 0, 1;
    %store/vec4 v0x55b778010ac0_0, 0, 1;
    %pushi/vec4 0, 0, 32;
    %store/vec4 v0x55b778010b80_0, 0, 32;
T_13.0 ;
    %load/vec4 v0x55b778010b80_0;
    %cmpi/s 1024, 0, 32;
    %jmp/0xz T_13.1, 5;
    %pushi/vec4 0, 0, 32;
    %ix/getv/s 4, v0x55b778010b80_0;
    %store/vec4a v0x55b778010e30, 4, 0;
    %load/vec4 v0x55b778010b80_0;
    %addi 1, 0, 32;
    %store/vec4 v0x55b778010b80_0, 0, 32;
    %jmp T_13.0;
T_13.1 ;
    %end;
    .thread T_13;
    .scope S_0x55b778010560;
T_14 ;
    %wait E_0x55b778010940;
    %load/vec4 v0x55b778010ac0_0;
    %nor/r;
    %flag_set/vec4 8;
    %jmp/0xz  T_14.0, 8;
    %pushi/vec4 1, 0, 1;
    %store/vec4 v0x55b778010ac0_0, 0, 1;
    %load/vec4 v0x55b778010d20_0;
    %flag_set/vec4 8;
    %jmp/0xz  T_14.2, 8;
    %load/vec4 v0x55b778010c40_0;
    %ix/getv 4, v0x55b7780109c0_0;
    %store/vec4a v0x55b778010e30, 4, 0;
    %pushi/vec4 0, 0, 32;
    %assign/vec4 v0x55b778010ef0_0, 0;
    %jmp T_14.3;
T_14.2 ;
    %ix/getv 4, v0x55b7780109c0_0;
    %load/vec4a v0x55b778010e30, 4;
    %assign/vec4 v0x55b778010ef0_0, 0;
T_14.3 ;
    %pushi/vec4 0, 0, 1;
    %store/vec4 v0x55b778010ac0_0, 0, 1;
T_14.0 ;
    %pushi/vec4 0, 0, 32;
    %store/vec4 v0x55b778010b80_0, 0, 32;
T_14.4 ;
    %load/vec4 v0x55b778010b80_0;
    %cmpi/s 5, 0, 32;
    %jmp/0xz T_14.5, 5;
    %vpi_call 9 40 "$display", "mem[%x]=%x", v0x55b778010b80_0, &A<v0x55b778010e30, v0x55b778010b80_0 > {0 0 0};
    %load/vec4 v0x55b778010b80_0;
    %pushi/vec4 1, 0, 32;
    %add;
    %store/vec4 v0x55b778010b80_0, 0, 32;
    %jmp T_14.4;
T_14.5 ;
    %jmp T_14;
    .thread T_14;
    .scope S_0x55b77800ca40;
T_15 ;
    %fork t_1, S_0x55b778010290;
    %jmp t_0;
    .scope S_0x55b778010290;
t_1 ;
    %pushi/vec4 1, 0, 1;
    %ix/load 4, 0, 0;
    %flag_set/imm 4, 0;
    %store/vec4a v0x55b778011cd0, 4, 0;
    %pushi/vec4 0, 0, 32;
    %store/vec4 v0x55b778012aa0_0, 0, 32;
    %pushi/vec4 0, 0, 32;
    %store/vec4 v0x55b778012f00_0, 0, 32;
    %pushi/vec4 0, 0, 32;
    %store/vec4 v0x55b778012e20_0, 0, 32;
    %pushi/vec4 0, 0, 32;
    %store/vec4 v0x55b778010460_0, 0, 32;
T_15.0 ;
    %load/vec4 v0x55b778010460_0;
    %cmpi/s 3, 0, 32;
    %flag_or 5, 4;
    %jmp/0xz T_15.1, 5;
    %pushi/vec4 0, 0, 1;
    %ix/getv/s 4, v0x55b778010460_0;
    %store/vec4a v0x55b778011cd0, 4, 0;
    %pushi/vec4 0, 0, 1;
    %ix/getv/s 4, v0x55b778010460_0;
    %store/vec4a v0x55b7780136f0, 4, 0;
    %pushi/vec4 0, 0, 7;
    %ix/getv/s 4, v0x55b778010460_0;
    %store/vec4a v0x55b778012a00, 4, 0;
    %pushi/vec4 0, 0, 3;
    %ix/getv/s 4, v0x55b778010460_0;
    %store/vec4a v0x55b778011e10, 4, 0;
    %pushi/vec4 0, 0, 7;
    %ix/getv/s 4, v0x55b778010460_0;
    %store/vec4a v0x55b778011f50, 4, 0;
    %pushi/vec4 0, 0, 32;
    %ix/getv/s 4, v0x55b778010460_0;
    %store/vec4a v0x55b778013950, 4, 0;
    %pushi/vec4 0, 0, 32;
    %ix/getv/s 4, v0x55b778010460_0;
    %store/vec4a v0x55b778013a90, 4, 0;
    %pushi/vec4 0, 0, 5;
    %ix/getv/s 4, v0x55b778010460_0;
    %store/vec4a v0x55b778012ca0, 4, 0;
    %pushi/vec4 0, 0, 5;
    %ix/getv/s 4, v0x55b778010460_0;
    %store/vec4a v0x55b778012be0, 4, 0;
    %pushi/vec4 0, 0, 5;
    %ix/getv/s 4, v0x55b778010460_0;
    %store/vec4a v0x55b778012b40, 4, 0;
    %pushi/vec4 0, 0, 32;
    %ix/getv/s 4, v0x55b778010460_0;
    %store/vec4a v0x55b778011540, 4, 0;
    %pushi/vec4 0, 0, 32;
    %ix/getv/s 4, v0x55b778010460_0;
    %store/vec4a v0x55b778013370, 4, 0;
    %pushi/vec4 0, 0, 32;
    %ix/getv/s 4, v0x55b778010460_0;
    %store/vec4a v0x55b778012d60, 4, 0;
    %pushi/vec4 0, 0, 32;
    %ix/getv/s 4, v0x55b778010460_0;
    %store/vec4a v0x55b7780121f0, 4, 0;
    %pushi/vec4 0, 0, 32;
    %ix/getv/s 4, v0x55b778010460_0;
    %store/vec4a v0x55b778012fe0, 4, 0;
    %pushi/vec4 0, 0, 1;
    %ix/getv/s 4, v0x55b778010460_0;
    %store/vec4a v0x55b778013430, 4, 0;
    %load/vec4 v0x55b778010460_0;
    %addi 1, 0, 32;
    %store/vec4 v0x55b778010460_0, 0, 32;
    %jmp T_15.0;
T_15.1 ;
    %end;
    .scope S_0x55b77800ca40;
t_0 %join;
    %end;
    .thread T_15;
    .scope S_0x55b77800ca40;
T_16 ;
    %wait E_0x55b777f66e30;
    %vpi_call 7 95 "$display", "opcode=%b", v0x55b778011930_0 {0 0 0};
    %vpi_call 7 96 "$display", "rd=%b", v0x55b7780130a0_0 {0 0 0};
    %vpi_call 7 97 "$display", "fun3=%b", v0x55b778011620_0 {0 0 0};
    %vpi_call 7 98 "$display", "rs1=%b", v0x55b7780134d0_0 {0 0 0};
    %vpi_call 7 99 "$display", "rs2=%b", v0x55b7780135e0_0 {0 0 0};
    %vpi_call 7 100 "$display", "fun7=%b", v0x55b778011730_0 {0 0 0};
    %vpi_call 7 101 "$display", "imm=%b", v0x55b778011820_0 {0 0 0};
    %vpi_call 7 102 "$display", "opc=%b", v0x55b778012930_0 {0 0 0};
    %load/vec4 v0x55b778011930_0;
    %pushi/vec4 19, 0, 7;
    %cmp/e;
    %flag_get/vec4 4;
    %load/vec4 v0x55b778011620_0;
    %pushi/vec4 0, 0, 3;
    %cmp/e;
    %flag_get/vec4 4;
    %and;
    %load/vec4 v0x55b778011730_0;
    %pushi/vec4 0, 0, 7;
    %cmp/e;
    %flag_get/vec4 4;
    %and;
    %load/vec4 v0x55b778011820_0;
    %pushi/vec4 0, 0, 32;
    %cmp/e;
    %flag_get/vec4 4;
    %and;
    %flag_set/vec4 8;
    %load/vec4 v0x55b778011930_0;
    %cmpi/e 0, 0, 7;
    %flag_or 4, 8;
    %jmp/0xz  T_16.0, 4;
    %jmp T_16.1;
T_16.0 ;
    %fork t_3, S_0x55b778011190;
    %jmp t_2;
    .scope S_0x55b778011190;
t_3 ;
    %pushi/vec4 666, 0, 32;
    %store/vec4 v0x55b778011460_0, 0, 32;
    %pushi/vec4 1, 0, 32;
    %store/vec4 v0x55b778011360_0, 0, 32;
T_16.2 ;
    %load/vec4 v0x55b778011360_0;
    %cmpi/s 3, 0, 32;
    %jmp/0xz T_16.3, 5;
    %vpi_call 7 116 "$display", "busy[%x]=%b", v0x55b778011360_0, &A<v0x55b778011cd0, v0x55b778011360_0 > {0 0 0};
    %ix/getv/s 4, v0x55b778011360_0;
    %load/vec4a v0x55b778011cd0, 4;
    %nor/r;
    %flag_set/vec4 8;
    %jmp/0xz  T_16.4, 8;
    %load/vec4 v0x55b778011360_0;
    %store/vec4 v0x55b778011460_0, 0, 32;
T_16.4 ;
    %load/vec4 v0x55b778011360_0;
    %addi 1, 0, 32;
    %store/vec4 v0x55b778011360_0, 0, 32;
    %jmp T_16.2;
T_16.3 ;
    %vpi_call 7 121 "$display", "r=%x", v0x55b778011460_0 {0 0 0};
    %load/vec4 v0x55b778011930_0;
    %cmpi/e 3, 0, 7;
    %flag_mov 8, 4;
    %load/vec4 v0x55b778011930_0;
    %cmpi/e 35, 0, 7;
    %flag_or 4, 8;
    %jmp/0xz  T_16.6, 4;
    %load/vec4 v0x55b778011460_0;
    %ix/getv/s 4, v0x55b778012f00_0;
    %store/vec4a v0x55b778012fe0, 4, 0;
    %load/vec4 v0x55b778012f00_0;
    %addi 1, 0, 32;
    %pushi/vec4 31, 0, 32;
    %and;
    %store/vec4 v0x55b778012f00_0, 0, 32;
    %load/vec4 v0x55b7780134d0_0;
    %pad/u 7;
    %ix/vec4 4;
    %load/vec4a v0x55b778012b40, 4;
    %pad/u 32;
    %cmpi/e 0, 0, 32;
    %jmp/0xz  T_16.8, 4;
    %load/vec4 v0x55b7780134d0_0;
    %pad/u 7;
    %ix/vec4 4;
    %load/vec4a v0x55b778012d60, 4;
    %ix/getv/s 4, v0x55b778011460_0;
    %store/vec4a v0x55b778013950, 4, 0;
    %pushi/vec4 0, 0, 5;
    %ix/getv/s 4, v0x55b778011460_0;
    %store/vec4a v0x55b778012be0, 4, 0;
    %jmp T_16.9;
T_16.8 ;
    %load/vec4 v0x55b7780134d0_0;
    %pad/u 7;
    %ix/vec4 4;
    %load/vec4a v0x55b778012b40, 4;
    %ix/getv/s 4, v0x55b778011460_0;
    %store/vec4a v0x55b778012be0, 4, 0;
T_16.9 ;
    %pushi/vec4 1, 0, 1;
    %ix/getv/s 4, v0x55b778011460_0;
    %store/vec4a v0x55b778011cd0, 4, 0;
    %load/vec4 v0x55b778011820_0;
    %ix/getv/s 4, v0x55b778011460_0;
    %store/vec4a v0x55b7780121f0, 4, 0;
    %load/vec4 v0x55b778011930_0;
    %cmpi/e 3, 0, 7;
    %jmp/0xz  T_16.10, 4;
    %load/vec4 v0x55b778011460_0;
    %pad/s 5;
    %load/vec4 v0x55b7780130a0_0;
    %pad/u 7;
    %ix/vec4 4;
    %store/vec4a v0x55b778012b40, 4, 0;
    %jmp T_16.11;
T_16.10 ;
    %load/vec4 v0x55b7780135e0_0;
    %pad/u 7;
    %ix/vec4 4;
    %load/vec4a v0x55b778012b40, 4;
    %pad/u 32;
    %cmpi/e 0, 0, 32;
    %jmp/0xz  T_16.12, 4;
    %load/vec4 v0x55b7780135e0_0;
    %pad/u 7;
    %ix/vec4 4;
    %load/vec4a v0x55b778012d60, 4;
    %ix/getv/s 4, v0x55b778011460_0;
    %store/vec4a v0x55b778013a90, 4, 0;
    %pushi/vec4 0, 0, 5;
    %ix/getv/s 4, v0x55b778011460_0;
    %store/vec4a v0x55b778012ca0, 4, 0;
    %jmp T_16.13;
T_16.12 ;
    %load/vec4 v0x55b7780135e0_0;
    %pad/u 7;
    %ix/vec4 4;
    %load/vec4a v0x55b778012b40, 4;
    %ix/getv/s 4, v0x55b778011460_0;
    %store/vec4a v0x55b778012ca0, 4, 0;
T_16.13 ;
T_16.11 ;
    %jmp T_16.7;
T_16.6 ;
    %load/vec4 v0x55b778011930_0;
    %cmpi/e 99, 0, 7;
    %jmp/0xz  T_16.14, 4;
    %load/vec4 v0x55b7780134d0_0;
    %pad/u 7;
    %ix/vec4 4;
    %load/vec4a v0x55b778012b40, 4;
    %pad/u 32;
    %cmpi/e 0, 0, 32;
    %jmp/0xz  T_16.16, 4;
    %load/vec4 v0x55b7780134d0_0;
    %pad/u 7;
    %ix/vec4 4;
    %load/vec4a v0x55b778012d60, 4;
    %ix/getv/s 4, v0x55b778011460_0;
    %store/vec4a v0x55b778013950, 4, 0;
    %pushi/vec4 0, 0, 5;
    %ix/getv/s 4, v0x55b778011460_0;
    %store/vec4a v0x55b778012be0, 4, 0;
    %jmp T_16.17;
T_16.16 ;
    %load/vec4 v0x55b7780134d0_0;
    %pad/u 7;
    %ix/vec4 4;
    %load/vec4a v0x55b778012b40, 4;
    %ix/getv/s 4, v0x55b778011460_0;
    %store/vec4a v0x55b778012be0, 4, 0;
T_16.17 ;
    %pushi/vec4 1, 0, 1;
    %ix/getv/s 4, v0x55b778011460_0;
    %store/vec4a v0x55b778011cd0, 4, 0;
    %load/vec4 v0x55b778011820_0;
    %ix/getv/s 4, v0x55b778011460_0;
    %store/vec4a v0x55b7780121f0, 4, 0;
    %load/vec4 v0x55b7780135e0_0;
    %pad/u 7;
    %ix/vec4 4;
    %load/vec4a v0x55b778012b40, 4;
    %pad/u 32;
    %cmpi/e 0, 0, 32;
    %jmp/0xz  T_16.18, 4;
    %load/vec4 v0x55b7780135e0_0;
    %pad/u 7;
    %ix/vec4 4;
    %load/vec4a v0x55b778012d60, 4;
    %ix/getv/s 4, v0x55b778011460_0;
    %store/vec4a v0x55b778013a90, 4, 0;
    %pushi/vec4 0, 0, 5;
    %ix/getv/s 4, v0x55b778011460_0;
    %store/vec4a v0x55b778012ca0, 4, 0;
    %jmp T_16.19;
T_16.18 ;
    %load/vec4 v0x55b7780135e0_0;
    %pad/u 7;
    %ix/vec4 4;
    %load/vec4a v0x55b778012b40, 4;
    %ix/getv/s 4, v0x55b778011460_0;
    %store/vec4a v0x55b778012ca0, 4, 0;
T_16.19 ;
    %jmp T_16.15;
T_16.14 ;
    %load/vec4 v0x55b778011930_0;
    %cmpi/e 19, 0, 7;
    %jmp/0xz  T_16.20, 4;
    %load/vec4 v0x55b7780134d0_0;
    %pad/u 7;
    %ix/vec4 4;
    %load/vec4a v0x55b778012b40, 4;
    %pad/u 32;
    %cmpi/e 0, 0, 32;
    %jmp/0xz  T_16.22, 4;
    %load/vec4 v0x55b7780134d0_0;
    %pad/u 7;
    %ix/vec4 4;
    %load/vec4a v0x55b778012d60, 4;
    %ix/getv/s 4, v0x55b778011460_0;
    %store/vec4a v0x55b778013950, 4, 0;
    %pushi/vec4 0, 0, 5;
    %ix/getv/s 4, v0x55b778011460_0;
    %store/vec4a v0x55b778012be0, 4, 0;
    %jmp T_16.23;
T_16.22 ;
    %load/vec4 v0x55b7780134d0_0;
    %pad/u 7;
    %ix/vec4 4;
    %load/vec4a v0x55b778012b40, 4;
    %ix/getv/s 4, v0x55b778011460_0;
    %store/vec4a v0x55b778012be0, 4, 0;
T_16.23 ;
    %load/vec4 v0x55b778011820_0;
    %ix/getv/s 4, v0x55b778011460_0;
    %store/vec4a v0x55b778013a90, 4, 0;
    %pushi/vec4 0, 0, 5;
    %ix/getv/s 4, v0x55b778011460_0;
    %store/vec4a v0x55b778012ca0, 4, 0;
    %pushi/vec4 1, 0, 1;
    %ix/getv/s 4, v0x55b778011460_0;
    %store/vec4a v0x55b778011cd0, 4, 0;
    %load/vec4 v0x55b778011930_0;
    %ix/getv/s 4, v0x55b778011460_0;
    %store/vec4a v0x55b778012a00, 4, 0;
    %load/vec4 v0x55b778011620_0;
    %ix/getv/s 4, v0x55b778011460_0;
    %store/vec4a v0x55b778011e10, 4, 0;
    %load/vec4 v0x55b778011730_0;
    %ix/getv/s 4, v0x55b778011460_0;
    %store/vec4a v0x55b778011f50, 4, 0;
    %load/vec4 v0x55b778011460_0;
    %pad/s 5;
    %load/vec4 v0x55b7780130a0_0;
    %pad/u 7;
    %ix/vec4 4;
    %store/vec4a v0x55b778012b40, 4, 0;
    %jmp T_16.21;
T_16.20 ;
    %load/vec4 v0x55b7780134d0_0;
    %pad/u 7;
    %ix/vec4 4;
    %load/vec4a v0x55b778012b40, 4;
    %pad/u 32;
    %cmpi/e 0, 0, 32;
    %jmp/0xz  T_16.24, 4;
    %load/vec4 v0x55b7780134d0_0;
    %pad/u 7;
    %ix/vec4 4;
    %load/vec4a v0x55b778012d60, 4;
    %ix/getv/s 4, v0x55b778011460_0;
    %store/vec4a v0x55b778013950, 4, 0;
    %pushi/vec4 0, 0, 5;
    %ix/getv/s 4, v0x55b778011460_0;
    %store/vec4a v0x55b778012be0, 4, 0;
    %jmp T_16.25;
T_16.24 ;
    %load/vec4 v0x55b7780134d0_0;
    %pad/u 7;
    %ix/vec4 4;
    %load/vec4a v0x55b778012b40, 4;
    %ix/getv/s 4, v0x55b778011460_0;
    %store/vec4a v0x55b778012be0, 4, 0;
T_16.25 ;
    %load/vec4 v0x55b7780135e0_0;
    %pad/u 7;
    %ix/vec4 4;
    %load/vec4a v0x55b778012b40, 4;
    %cmpi/ne 0, 0, 5;
    %jmp/0xz  T_16.26, 4;
    %load/vec4 v0x55b7780135e0_0;
    %pad/u 7;
    %ix/vec4 4;
    %load/vec4a v0x55b778012d60, 4;
    %ix/getv/s 4, v0x55b778011460_0;
    %store/vec4a v0x55b778013a90, 4, 0;
    %pushi/vec4 0, 0, 5;
    %ix/getv/s 4, v0x55b778011460_0;
    %store/vec4a v0x55b778012ca0, 4, 0;
    %jmp T_16.27;
T_16.26 ;
    %load/vec4 v0x55b7780135e0_0;
    %pad/u 7;
    %ix/vec4 4;
    %load/vec4a v0x55b778012b40, 4;
    %ix/getv/s 4, v0x55b778011460_0;
    %store/vec4a v0x55b778012ca0, 4, 0;
T_16.27 ;
    %pushi/vec4 1, 0, 1;
    %ix/getv/s 4, v0x55b778011460_0;
    %store/vec4a v0x55b778011cd0, 4, 0;
    %load/vec4 v0x55b778011930_0;
    %ix/getv/s 4, v0x55b778011460_0;
    %store/vec4a v0x55b778012a00, 4, 0;
    %load/vec4 v0x55b778011620_0;
    %ix/getv/s 4, v0x55b778011460_0;
    %store/vec4a v0x55b778011e10, 4, 0;
    %load/vec4 v0x55b778011730_0;
    %ix/getv/s 4, v0x55b778011460_0;
    %store/vec4a v0x55b778011f50, 4, 0;
    %load/vec4 v0x55b778011460_0;
    %pad/s 5;
    %load/vec4 v0x55b7780130a0_0;
    %pad/u 7;
    %ix/vec4 4;
    %store/vec4a v0x55b778012b40, 4, 0;
T_16.21 ;
T_16.15 ;
T_16.7 ;
    %end;
    .scope S_0x55b77800ca40;
t_2 %join;
T_16.1 ;
    %pushi/vec4 1, 0, 32;
    %store/vec4 v0x55b778012130_0, 0, 32;
T_16.28 ;
    %load/vec4 v0x55b778012130_0;
    %cmpi/s 3, 0, 32;
    %jmp/0xz T_16.29, 5;
    %ix/getv/s 4, v0x55b778012130_0;
    %load/vec4a v0x55b778011cd0, 4;
    %flag_set/vec4 8;
    %jmp/0xz  T_16.30, 8;
    %ix/getv/s 4, v0x55b778012130_0;
    %load/vec4a v0x55b778012a00, 4;
    %cmpi/e 3, 0, 7;
    %jmp/0xz  T_16.32, 4;
    %ix/getv/s 4, v0x55b778012130_0;
    %load/vec4a v0x55b778012be0, 4;
    %pad/u 32;
    %pushi/vec4 0, 0, 32;
    %cmp/e;
    %flag_get/vec4 4;
    %load/vec4 v0x55b778012130_0;
    %ix/getv/s 4, v0x55b778012aa0_0;
    %load/vec4a v0x55b778012fe0, 4;
    %cmp/e;
    %flag_get/vec4 4;
    %and;
    %flag_set/vec4 8;
    %jmp/0xz  T_16.34, 8;
    %ix/getv/s 4, v0x55b778012130_0;
    %load/vec4a v0x55b7780121f0, 4;
    %ix/getv/s 4, v0x55b778012130_0;
    %store/vec4a v0x55b778013a90, 4, 0;
    %pushi/vec4 0, 0, 3;
    %ix/getv/s 4, v0x55b778012130_0;
    %store/vec4a v0x55b778011e10, 4, 0;
    %pushi/vec4 0, 0, 7;
    %ix/getv/s 4, v0x55b778012130_0;
    %store/vec4a v0x55b778011f50, 4, 0;
    %pushi/vec4 1, 0, 1;
    %ix/getv/s 4, v0x55b778012130_0;
    %store/vec4a v0x55b7780136f0, 4, 0;
    %ix/getv/s 4, v0x55b778012130_0;
    %load/vec4a v0x55b778011a90, 4;
    %nor/r;
    %flag_set/vec4 8;
    %jmp/0xz  T_16.36, 8;
    %ix/getv/s 4, v0x55b778012130_0;
    %load/vec4a v0x55b778013370, 4;
    %store/vec4 v0x55b778012380_0, 0, 32;
    %pushi/vec4 0, 0, 1;
    %store/vec4 v0x55b7780125f0_0, 0, 1;
    %pushi/vec4 0, 0, 1;
    %store/vec4 v0x55b778012790_0, 0, 1;
    %pushi/vec4 1, 0, 1;
    %store/vec4 v0x55b778012790_0, 0, 1;
T_16.36 ;
T_16.34 ;
    %jmp T_16.33;
T_16.32 ;
    %ix/getv/s 4, v0x55b778012130_0;
    %load/vec4a v0x55b778012a00, 4;
    %cmpi/e 35, 0, 7;
    %jmp/0xz  T_16.38, 4;
    %ix/getv/s 4, v0x55b778012130_0;
    %load/vec4a v0x55b778012be0, 4;
    %pad/u 32;
    %pushi/vec4 0, 0, 32;
    %cmp/e;
    %flag_get/vec4 4;
    %load/vec4 v0x55b778012130_0;
    %ix/getv/s 4, v0x55b778012aa0_0;
    %load/vec4a v0x55b778012fe0, 4;
    %cmp/e;
    %flag_get/vec4 4;
    %and;
    %flag_set/vec4 8;
    %jmp/0xz  T_16.40, 8;
    %ix/getv/s 4, v0x55b778012130_0;
    %load/vec4a v0x55b778013a90, 4;
    %ix/getv/s 4, v0x55b778012130_0;
    %store/vec4a v0x55b778011540, 4, 0;
    %ix/getv/s 4, v0x55b778012130_0;
    %load/vec4a v0x55b7780121f0, 4;
    %ix/getv/s 4, v0x55b778012130_0;
    %store/vec4a v0x55b778013a90, 4, 0;
    %pushi/vec4 0, 0, 3;
    %ix/getv/s 4, v0x55b778012130_0;
    %store/vec4a v0x55b778011e10, 4, 0;
    %pushi/vec4 0, 0, 7;
    %ix/getv/s 4, v0x55b778012130_0;
    %store/vec4a v0x55b778011f50, 4, 0;
    %pushi/vec4 1, 0, 1;
    %ix/getv/s 4, v0x55b778012130_0;
    %store/vec4a v0x55b7780136f0, 4, 0;
    %ix/getv/s 4, v0x55b778012130_0;
    %load/vec4a v0x55b778011a90, 4;
    %nor/r;
    %flag_set/vec4 8;
    %jmp/0xz  T_16.42, 8;
    %ix/getv/s 4, v0x55b778012130_0;
    %load/vec4a v0x55b778013370, 4;
    %store/vec4 v0x55b778012380_0, 0, 32;
    %ix/getv/s 4, v0x55b778012130_0;
    %load/vec4a v0x55b778011540, 4;
    %store/vec4 v0x55b778012520_0, 0, 32;
    %pushi/vec4 1, 0, 1;
    %store/vec4 v0x55b7780125f0_0, 0, 1;
    %pushi/vec4 0, 0, 1;
    %store/vec4 v0x55b778012790_0, 0, 1;
    %pushi/vec4 1, 0, 1;
    %store/vec4 v0x55b778012790_0, 0, 1;
T_16.42 ;
T_16.40 ;
    %jmp T_16.39;
T_16.38 ;
    %ix/getv/s 4, v0x55b778012130_0;
    %load/vec4a v0x55b778012a00, 4;
    %cmpi/e 99, 0, 7;
    %jmp/0xz  T_16.44, 4;
    %ix/getv/s 4, v0x55b778012130_0;
    %load/vec4a v0x55b778012be0, 4;
    %pad/u 32;
    %cmpi/e 0, 0, 32;
    %jmp/0xz  T_16.46, 4;
    %ix/getv/s 4, v0x55b778012130_0;
    %load/vec4a v0x55b778011e10, 4;
    %dup/vec4;
    %pushi/vec4 0, 0, 3;
    %cmp/u;
    %jmp/1 T_16.48, 6;
    %dup/vec4;
    %pushi/vec4 1, 0, 3;
    %cmp/u;
    %jmp/1 T_16.49, 6;
    %dup/vec4;
    %pushi/vec4 4, 0, 3;
    %cmp/u;
    %jmp/1 T_16.50, 6;
    %dup/vec4;
    %pushi/vec4 5, 0, 3;
    %cmp/u;
    %jmp/1 T_16.51, 6;
    %dup/vec4;
    %pushi/vec4 6, 0, 3;
    %cmp/u;
    %jmp/1 T_16.52, 6;
    %dup/vec4;
    %pushi/vec4 7, 0, 3;
    %cmp/u;
    %jmp/1 T_16.53, 6;
    %jmp T_16.54;
T_16.48 ;
    %jmp T_16.54;
T_16.49 ;
    %jmp T_16.54;
T_16.50 ;
    %jmp T_16.54;
T_16.51 ;
    %jmp T_16.54;
T_16.52 ;
    %jmp T_16.54;
T_16.53 ;
    %jmp T_16.54;
T_16.54 ;
    %pop/vec4 1;
    %pushi/vec4 1, 0, 1;
    %ix/getv/s 4, v0x55b778012130_0;
    %store/vec4a v0x55b7780136f0, 4, 0;
T_16.46 ;
    %jmp T_16.45;
T_16.44 ;
    %ix/getv/s 4, v0x55b778012130_0;
    %load/vec4a v0x55b778012be0, 4;
    %pad/u 32;
    %pushi/vec4 0, 0, 32;
    %cmp/e;
    %flag_get/vec4 4;
    %ix/getv/s 4, v0x55b778012130_0;
    %load/vec4a v0x55b778012ca0, 4;
    %pad/u 32;
    %pushi/vec4 0, 0, 32;
    %cmp/e;
    %flag_get/vec4 4;
    %and;
    %flag_set/vec4 8;
    %jmp/0xz  T_16.55, 8;
    %pushi/vec4 1, 0, 1;
    %ix/getv/s 4, v0x55b778012130_0;
    %store/vec4a v0x55b7780136f0, 4, 0;
T_16.55 ;
T_16.45 ;
T_16.39 ;
T_16.33 ;
T_16.30 ;
    %load/vec4 v0x55b778012130_0;
    %addi 1, 0, 32;
    %store/vec4 v0x55b778012130_0, 0, 32;
    %jmp T_16.28;
T_16.29 ;
    %pushi/vec4 1, 0, 32;
    %store/vec4 v0x55b778012130_0, 0, 32;
T_16.57 ;
    %load/vec4 v0x55b778012130_0;
    %cmpi/s 3, 0, 32;
    %jmp/0xz T_16.58, 5;
    %ix/getv/s 4, v0x55b778012130_0;
    %load/vec4a v0x55b778011cd0, 4;
    %ix/getv/s 4, v0x55b778012130_0;
    %load/vec4a v0x55b7780136f0, 4;
    %and;
    %ix/getv/s 4, v0x55b778012130_0;
    %load/vec4a v0x55b778011bb0, 4;
    %and;
    %flag_set/vec4 8;
    %jmp/0xz  T_16.59, 8;
    %ix/getv/s 4, v0x55b778012130_0;
    %load/vec4a v0x55b778013810, 4;
    %ix/getv/s 4, v0x55b778012130_0;
    %store/vec4a v0x55b778013370, 4, 0;
    %ix/getv/s 4, v0x55b778012130_0;
    %load/vec4a v0x55b778012a00, 4;
    %cmpi/e 3, 0, 7;
    %jmp/0xz  T_16.61, 4;
    %load/vec4 v0x55b778012790_0;
    %load/vec4 v0x55b778012450_0;
    %nor/r;
    %and;
    %flag_set/vec4 8;
    %jmp/0xz  T_16.63, 8;
    %load/vec4 v0x55b7780126c0_0;
    %load/vec4 v0x55b778012130_0;
    %part/s 1;
    %pad/u 32;
    %ix/getv/s 4, v0x55b778012130_0;
    %store/vec4a v0x55b778013370, 4, 0;
    %pushi/vec4 1, 0, 1;
    %ix/getv/s 4, v0x55b778012130_0;
    %store/vec4a v0x55b778013430, 4, 0;
T_16.63 ;
    %jmp T_16.62;
T_16.61 ;
    %ix/getv/s 4, v0x55b778012130_0;
    %load/vec4a v0x55b778012a00, 4;
    %cmpi/e 35, 0, 7;
    %jmp/0xz  T_16.65, 4;
    %ix/getv/s 4, v0x55b778012130_0;
    %load/vec4a v0x55b778012be0, 4;
    %pad/u 32;
    %pushi/vec4 0, 0, 32;
    %cmp/e;
    %flag_get/vec4 4;
    %load/vec4 v0x55b778012130_0;
    %ix/getv/s 4, v0x55b778012aa0_0;
    %load/vec4a v0x55b778012fe0, 4;
    %cmp/e;
    %flag_get/vec4 4;
    %and;
    %flag_set/vec4 8;
    %jmp/0xz  T_16.67, 8;
    %pushi/vec4 1, 0, 1;
    %ix/getv/s 4, v0x55b778012130_0;
    %store/vec4a v0x55b778013430, 4, 0;
T_16.67 ;
    %jmp T_16.66;
T_16.65 ;
    %ix/getv/s 4, v0x55b778012130_0;
    %load/vec4a v0x55b778012a00, 4;
    %cmpi/e 99, 0, 7;
    %jmp/0xz  T_16.69, 4;
    %ix/getv/s 4, v0x55b778012130_0;
    %load/vec4a v0x55b778012be0, 4;
    %pad/u 32;
    %cmpi/e 0, 0, 32;
    %jmp/0xz  T_16.71, 4;
    %ix/getv/s 4, v0x55b778012130_0;
    %load/vec4a v0x55b778011e10, 4;
    %dup/vec4;
    %pushi/vec4 0, 0, 3;
    %cmp/u;
    %jmp/1 T_16.73, 6;
    %dup/vec4;
    %pushi/vec4 1, 0, 3;
    %cmp/u;
    %jmp/1 T_16.74, 6;
    %dup/vec4;
    %pushi/vec4 4, 0, 3;
    %cmp/u;
    %jmp/1 T_16.75, 6;
    %dup/vec4;
    %pushi/vec4 5, 0, 3;
    %cmp/u;
    %jmp/1 T_16.76, 6;
    %dup/vec4;
    %pushi/vec4 6, 0, 3;
    %cmp/u;
    %jmp/1 T_16.77, 6;
    %dup/vec4;
    %pushi/vec4 7, 0, 3;
    %cmp/u;
    %jmp/1 T_16.78, 6;
    %jmp T_16.79;
T_16.73 ;
    %jmp T_16.79;
T_16.74 ;
    %jmp T_16.79;
T_16.75 ;
    %jmp T_16.79;
T_16.76 ;
    %jmp T_16.79;
T_16.77 ;
    %jmp T_16.79;
T_16.78 ;
    %jmp T_16.79;
T_16.79 ;
    %pop/vec4 1;
    %pushi/vec4 1, 0, 1;
    %ix/getv/s 4, v0x55b778012130_0;
    %store/vec4a v0x55b778013430, 4, 0;
T_16.71 ;
    %jmp T_16.70;
T_16.69 ;
    %ix/getv/s 4, v0x55b778012130_0;
    %load/vec4a v0x55b778011a90, 4;
    %nor/r;
    %flag_set/vec4 8;
    %jmp/0xz  T_16.80, 8;
    %pushi/vec4 1, 0, 1;
    %ix/getv/s 4, v0x55b778012130_0;
    %store/vec4a v0x55b778013430, 4, 0;
    %vpi_call 7 295 "$display", "res=%x", &A<v0x55b778013370, v0x55b778012130_0 > {0 0 0};
    %vpi_call 7 296 "$display", "tres=%x", &A<v0x55b778013810, v0x55b778012130_0 > {0 0 0};
T_16.80 ;
T_16.70 ;
T_16.66 ;
T_16.62 ;
T_16.59 ;
    %load/vec4 v0x55b778012130_0;
    %addi 1, 0, 32;
    %store/vec4 v0x55b778012130_0, 0, 32;
    %jmp T_16.57;
T_16.58 ;
    %pushi/vec4 0, 0, 32;
    %store/vec4 v0x55b778012130_0, 0, 32;
T_16.82 ;
    %load/vec4 v0x55b778012130_0;
    %cmpi/s 32, 0, 32;
    %jmp/0xz T_16.83, 5;
    %ix/getv/s 4, v0x55b778012130_0;
    %load/vec4a v0x55b778012b40, 4;
    %pad/u 32;
    %pushi/vec4 0, 0, 32;
    %cmp/e;
    %flag_get/vec4 4;
    %inv;
    %ix/getv/s 5, v0x55b778012130_0;
    %load/vec4a v0x55b778012b40, 5;
    %ix/vec4 4;
    %load/vec4a v0x55b778013430, 4;
    %and;
    %flag_set/vec4 8;
    %jmp/0xz  T_16.84, 8;
    %ix/getv/s 5, v0x55b778012130_0;
    %load/vec4a v0x55b778012b40, 5;
    %ix/vec4 4;
    %load/vec4a v0x55b778013370, 4;
    %ix/getv/s 4, v0x55b778012130_0;
    %store/vec4a v0x55b778012d60, 4, 0;
    %pushi/vec4 0, 0, 5;
    %ix/getv/s 4, v0x55b778012130_0;
    %store/vec4a v0x55b778012b40, 4, 0;
T_16.84 ;
    %load/vec4 v0x55b778012130_0;
    %addi 1, 0, 32;
    %store/vec4 v0x55b778012130_0, 0, 32;
    %jmp T_16.82;
T_16.83 ;
    %pushi/vec4 1, 0, 32;
    %store/vec4 v0x55b778012130_0, 0, 32;
T_16.86 ;
    %load/vec4 v0x55b778012130_0;
    %cmpi/s 3, 0, 32;
    %jmp/0xz T_16.87, 5;
    %ix/getv/s 4, v0x55b778012130_0;
    %load/vec4a v0x55b778012be0, 4;
    %pad/u 32;
    %pushi/vec4 0, 0, 32;
    %cmp/e;
    %flag_get/vec4 4;
    %inv;
    %ix/getv/s 5, v0x55b778012130_0;
    %load/vec4a v0x55b778012be0, 5;
    %ix/vec4 4;
    %load/vec4a v0x55b778013430, 4;
    %and;
    %flag_set/vec4 8;
    %jmp/0xz  T_16.88, 8;
    %ix/getv/s 5, v0x55b778012130_0;
    %load/vec4a v0x55b778012be0, 5;
    %ix/vec4 4;
    %load/vec4a v0x55b778013370, 4;
    %ix/getv/s 4, v0x55b778012130_0;
    %store/vec4a v0x55b778013950, 4, 0;
    %pushi/vec4 0, 0, 5;
    %ix/getv/s 4, v0x55b778012130_0;
    %store/vec4a v0x55b778012be0, 4, 0;
T_16.88 ;
    %ix/getv/s 4, v0x55b778012130_0;
    %load/vec4a v0x55b778012ca0, 4;
    %pad/u 32;
    %pushi/vec4 0, 0, 32;
    %cmp/e;
    %flag_get/vec4 4;
    %inv;
    %ix/getv/s 5, v0x55b778012130_0;
    %load/vec4a v0x55b778012ca0, 5;
    %ix/vec4 4;
    %load/vec4a v0x55b778013430, 4;
    %and;
    %flag_set/vec4 8;
    %jmp/0xz  T_16.90, 8;
    %ix/getv/s 5, v0x55b778012130_0;
    %load/vec4a v0x55b778012ca0, 5;
    %ix/vec4 4;
    %load/vec4a v0x55b778013370, 4;
    %ix/getv/s 4, v0x55b778012130_0;
    %store/vec4a v0x55b778013a90, 4, 0;
    %pushi/vec4 0, 0, 5;
    %ix/getv/s 4, v0x55b778012130_0;
    %store/vec4a v0x55b778012be0, 4, 0;
T_16.90 ;
    %load/vec4 v0x55b778012130_0;
    %addi 1, 0, 32;
    %store/vec4 v0x55b778012130_0, 0, 32;
    %jmp T_16.86;
T_16.87 ;
    %pushi/vec4 1, 0, 32;
    %store/vec4 v0x55b778012130_0, 0, 32;
T_16.92 ;
    %load/vec4 v0x55b778012130_0;
    %cmpi/s 3, 0, 32;
    %jmp/0xz T_16.93, 5;
    %ix/getv/s 4, v0x55b778012130_0;
    %load/vec4a v0x55b778013430, 4;
    %flag_set/vec4 8;
    %jmp/0xz  T_16.94, 8;
    %pushi/vec4 0, 0, 1;
    %ix/getv/s 4, v0x55b778012130_0;
    %store/vec4a v0x55b778011cd0, 4, 0;
    %pushi/vec4 0, 0, 1;
    %ix/getv/s 4, v0x55b778012130_0;
    %store/vec4a v0x55b7780136f0, 4, 0;
    %pushi/vec4 0, 0, 1;
    %ix/getv/s 4, v0x55b778012130_0;
    %store/vec4a v0x55b778013430, 4, 0;
    %pushi/vec4 0, 0, 5;
    %ix/getv/s 4, v0x55b778012130_0;
    %store/vec4a v0x55b778012be0, 4, 0;
    %pushi/vec4 0, 0, 5;
    %ix/getv/s 4, v0x55b778012130_0;
    %store/vec4a v0x55b778012ca0, 4, 0;
    %load/vec4 v0x55b778012130_0;
    %ix/getv/s 4, v0x55b778012aa0_0;
    %load/vec4a v0x55b778012fe0, 4;
    %cmp/e;
    %jmp/0xz  T_16.96, 4;
    %load/vec4 v0x55b778012aa0_0;
    %addi 1, 0, 32;
    %pushi/vec4 31, 0, 32;
    %and;
    %store/vec4 v0x55b778012aa0_0, 0, 32;
T_16.96 ;
T_16.94 ;
    %load/vec4 v0x55b778012130_0;
    %addi 1, 0, 32;
    %store/vec4 v0x55b778012130_0, 0, 32;
    %jmp T_16.92;
T_16.93 ;
    %pushi/vec4 1, 0, 1;
    %store/vec4 v0x55b7780122b0_0, 0, 1;
    %pushi/vec4 1, 0, 32;
    %store/vec4 v0x55b778012130_0, 0, 32;
T_16.98 ;
    %load/vec4 v0x55b778012130_0;
    %cmpi/s 3, 0, 32;
    %jmp/0xz T_16.99, 5;
    %ix/getv/s 4, v0x55b778012130_0;
    %load/vec4a v0x55b778011cd0, 4;
    %nor/r;
    %flag_set/vec4 8;
    %jmp/0xz  T_16.100, 8;
    %pushi/vec4 0, 0, 1;
    %store/vec4 v0x55b7780122b0_0, 0, 1;
T_16.100 ;
    %load/vec4 v0x55b778012130_0;
    %addi 1, 0, 32;
    %store/vec4 v0x55b778012130_0, 0, 32;
    %jmp T_16.98;
T_16.99 ;
    %pushi/vec4 0, 0, 32;
    %store/vec4 v0x55b778012130_0, 0, 32;
T_16.102 ;
    %load/vec4 v0x55b778012130_0;
    %cmpi/s 4, 0, 32;
    %jmp/0xz T_16.103, 5;
    %vpi_call 7 342 "$display", "reg[%x]=%x", v0x55b778012130_0, &A<v0x55b778012d60, v0x55b778012130_0 > {0 0 0};
    %load/vec4 v0x55b778012130_0;
    %addi 1, 0, 32;
    %store/vec4 v0x55b778012130_0, 0, 32;
    %jmp T_16.102;
T_16.103 ;
    %pushi/vec4 0, 0, 1;
    %store/vec4 v0x55b778012790_0, 0, 1;
    %pushi/vec4 1, 0, 1;
    %store/vec4 v0x55b778012790_0, 0, 1;
    %jmp T_16;
    .thread T_16;
    .scope S_0x55b777fcff10;
T_17 ;
    %pushi/vec4 0, 0, 1;
    %store/vec4 v0x55b778014810_0, 0, 1;
    %pushi/vec4 0, 0, 32;
    %store/vec4 v0x55b7780148b0_0, 0, 32;
T_17.0 ;
    %load/vec4 v0x55b7780148b0_0;
    %cmpi/s 25, 0, 32;
    %jmp/0xz T_17.1, 5;
    %delay 50000, 0;
    %load/vec4 v0x55b778014810_0;
    %inv;
    %store/vec4 v0x55b778014810_0, 0, 1;
    %load/vec4 v0x55b7780148b0_0;
    %addi 1, 0, 32;
    %store/vec4 v0x55b7780148b0_0, 0, 32;
    %jmp T_17.0;
T_17.1 ;
    %end;
    .thread T_17;
# The file index is used to find the file name in the following table.
:file_names 10;
    "N/A";
    "<interactive>";
    "cpu_tb.v";
    "./cpu.v";
    "./instr_ctrl.v";
    "./decoder.v";
    "./instr_mem.v";
    "./rsreg.v";
    "./alu.v";
    "./ram.v";
