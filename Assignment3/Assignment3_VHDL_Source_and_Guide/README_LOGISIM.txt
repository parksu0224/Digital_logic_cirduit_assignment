Assignment 3 - Logisim gate-level build guide

1) RS Latch (NOR)
- 2 x 2-input NOR
- R goes to the NOR producing Q
- S goes to the NOR producing Qbar
- Q feeds back to the other NOR
- Qbar feeds back to the other NOR
- Test:
  S=1,R=0 -> Set
  S=0,R=1 -> Reset
  S=0,R=0 -> Hold
  S=1,R=1 -> Forbidden

2) D Latch with Enable (NAND)
- 5 x 2-input NAND
- nD = NAND(D,D)
- Sbar = NAND(D,EN)
- Rbar = NAND(nD,EN)
- Q    = NAND(Sbar,Qbar)
- Qbar = NAND(Rbar,Q)
- EN=1 -> Q follows D
- EN=0 -> Hold

3) Positive-edge D Flip-Flop (Master-Slave)
- Build TWO copies of the NAND D latch in item 2.
- Add an inverter for CLK.
- Master EN = NOT CLK
- Slave EN = CLK
- D -> Master D
- Master Q -> Slave D
- Slave Q -> final Q
- Final Q updates on the 0->1 clock edge.

4) JK Flip-Flop
- NAND feedback implementation, master-slave style.
- First stage:
  Sbar_m = NAND(J, CLK_bar, Qbar)
  Rbar_m = NAND(K, CLK_bar, Q)
- Master cross-coupled NAND pair -> M, Mbar
- Slave gating:
  Sbar_s = NAND(M, CLK)
  Rbar_s = NAND(Mbar, CLK)
- Slave cross-coupled NAND pair -> Q, Qbar
- For the first two NAND gates, set Number of Inputs = 3.
- Test at rising edge:
  J=0,K=0 Hold
  J=1,K=0 Set
  J=0,K=1 Reset
  J=1,K=1 Toggle

5) D Flip-Flop with asynchronous Set and Clear
- VHDL behavior:
  CLR=1 -> Q=0 immediately
  else SET=1 -> Q=1 immediately
  else rising edge -> Q=D
  If CLR=1 and SET=1 together, CLR wins.
- For gate-level Logisim, start from item 3 and add asynchronous preset/clear control to the NAND latch stages.

Recommended screenshots:
- RS: Set / Reset / Hold / Forbidden
- D Latch: EN=1,D=0 / EN=1,D=1 / EN=0 hold
- DFF: D changes while CLK steady, then rising edge
- JK: Hold / Set / Reset / Toggle
- Async DFF: CLR immediate / SET immediate / normal rising edge / CLR+SET priority
