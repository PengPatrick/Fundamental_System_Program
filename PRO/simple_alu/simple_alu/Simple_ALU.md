# The Simple ALU
# Author:
    Jingyu Peng (jp550)
# Design:
    To build a non-RCA adder, I use a 32-bit CSA consisting of three 16-bit RCA. 
    
    For each 16-bit RCA, I use 16 full adder.

    To achieve the addition and subtraction in one adder, I use a 2 to 1 mux to choose from B and B' (in verilog, ~B) and set carry-in to 1 when it is for subtraction and to 0 when it is for addition. 

# Behavior
    If ctrl_ALUopcode = 00000, it will do addition;

    If ctrl_ALUopcode = 00001, it will do subtraction. 

    It has two output: 32-bit result and 1-bit overflow (1 represents overflow)


