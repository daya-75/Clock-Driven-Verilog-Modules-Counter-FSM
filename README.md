# Clock-Driven Verilog Modules: Counter & FSM

This repository contains two Verilog-based digital logic modules along with their simulation testbenches. The goal is to demonstrate real-time, clock-synchronized behavior using flip-flops and finite state machines (FSMs).

---

## 📌 Objective

To design and simulate Verilog modules that utilize:
- Flip-flops and clocked logic
- Synchronous resets
- Input edge detection
- Glitch-free FSM transitions

---

## 🧩 Modules

### ✅ up_counter_4bit.v
A 4-bit synchronous up-counter:
- Increments on every positive clock edge
- Resets to zero on active-high synchronous reset

### ✅ input_triggered_fsm.v
A three-state FSM that:
- Waits in IDLE until a trigger pulse
- Activates for 4 clock cycles (ACTIVE)
- Completes with a DONE pulse and returns to IDLE

---

## 🧪 Testbenches

### 🔹 tb_up_counter_4bit.v
- Provides a clock and reset sequence
- Observes the counter output
- Validates correct counting and reset behavior

### 🔹 tb_input_triggered_fsm.v
- Simulates trigger pulses at specific intervals
- Observes FSM transitions (IDLE → ACTIVE → DONE)
- Designed for clear waveform analysis
  
---

## 📈Sample Waveforms and Schematic

1. UP_COUNTER:
   
   a) Schematic: <img width="1514" height="893" alt="Screenshot 2025-07-14 010942" src="https://github.com/user-attachments/assets/86e61392-f01d-4679-9044-d6b719e4d104" />
   
   b) Sample Waveform: <img width="1213" height="345" alt="Screenshot 2025-07-14 010725" src="https://github.com/user-attachments/assets/9ed45eea-bfc4-4e16-b4ab-f533c53a3674" />

2. INPUT_TRIGGERED_FSM:

   a) Schematic: https://drive.google.com/file/d/1sEgDKjx8mrGNMo8fcM62fKFzK8LkTI8c/view?usp=drive_link

   b) Sample Waveform: <img width="1510" height="287" alt="Screenshot 2025-07-14 013044" src="https://github.com/user-attachments/assets/83341861-5714-43b9-bc35-dbad496a5597" />


---

## 👨‍💻 Author
Dayanand Bisanal  


   
