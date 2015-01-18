/*
 * bandmate.h
 * 
 * Copyright 2015 Oskari Rundgren <orundg@gmail.com>
 * 
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 2 of the License, or
 * (at your option) any later version.
 * 
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 * 
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston,
 * MA 02110-1301, USA.
 * 
 * 
 */
 
#include <avr/io.h>
#include <avr/interrupt.h>
#define F_CPU 16000000
#include <util/delay.h>
#include "bandmate.h"
#include "midi.h"

#define STEPS_PER_MM 53 // Steppes motor steps per unit. 
#define MAX_SPEED 1 // Maximum speed in mm/s.
#define MAX_ACCELERATION 100 // Max acceleration in mm/s^2. 
#define MAX_STEPS 20000 

#define PIN_STEPPER_DIR   PB2 // Arduino IO10. 
#define PIN_STEPPER_STEP  PB1 // Arduino IO9.
#define PIN_STRIKER       PB5 // Arduino IO13. 
#define PIN_ENDSTOP       PD2 // Arduino IO2. 
#define HOME_DIR 1

uint8_t currentSpeed;

volatile int current_position = 0; 
volatile int goto_position = 0;
volatile uint8_t play_note;

uint8_t speed = 255;
uint8_t speed_count = 0; 

uint16_t accel = 64;
uint16_t accel_count = 0; 

volatile uint8_t data_next, note, velocity; 

ISR(TIMER0_COMPA_vect)
{

  if (accel_count++ >= accel)
  {
    accel_count = 0;
    if (speed > 5) // Max speed is really min.
    {
      speed--; 
    }
  }
  
  if (current_position == goto_position) // Reset speed when goal is reached. 
  {
    
    speed = 255; 
  }
  
  if (speed_count++ >= speed)
  {
    speed_count = 0; 
  if (current_position < goto_position)
  {
    if (HOME_DIR) // Direction of home. 
      PORTB &= ~(1<<PIN_STEPPER_DIR); // Move away from home.
    else
      PORTB |= (1<<PIN_STEPPER_DIR); // Move towards home.

    if (current_position < MAX_STEPS){
      PINB |= (1<<PIN_STEPPER_STEP); // Step only if not at Max Steps. 
    }
    current_position++;
  }
  else if (current_position > goto_position)
  {
    if (HOME_DIR) // Direction of home. 
      PORTB |= (1<<PIN_STEPPER_DIR); // Move towards home.
    else
      PORTB &= ~(1<<PIN_STEPPER_DIR); // Move away from home.
      
    if (current_position < MAX_STEPS){
      PINB |= (1<<PIN_STEPPER_STEP); // Step only if not at Max Steps.
    }
    current_position--;
  }
  }
}

ISR(USART_RX_vect)
{

  if (data_next == 1)
  {
    note = UDR0; 
    data_next = 2;
  }
  else if (data_next == 2)
  {
    velocity = UDR0;
    data_next = 0;
    play_note = velocity; 
  }
  else if (UDR0 == 0x90)
  {
      data_next = 1;
  }
}

int main()
{
  /* Set up ports. */
  DDRB |= (1<<PIN_STEPPER_DIR) | (1<<PIN_STEPPER_STEP) | (1<<PIN_STRIKER); // Out ports.
  PORTD |= (1<<PIN_ENDSTOP); // Enable endstop pull-up.
  
  midi_init();

  if (HOME_DIR) // Set direction of endstop home. 
    PORTB |= (1<<PIN_STEPPER_DIR);

  /* Initialize timer interrupt. */
  TCCR0A |= (1<<WGM01); // Clear counter on compare match. 
  TCCR0B |= (1<<CS01) | (1<<CS00); // Prescaler 64. 
  TIMSK0 |= (1<<OCIE0A); // Compare Match A interrupt enable. 
  OCR0A = 1; // Compare register A. 

  go_home();

  sei(); // Enable interrupts.

  int i; for (i=0; i<10; i++) _delay_ms(100); // One second delay. 

  while(1)
  {
    
    //if (flag) goto_position = 1000;
      if (note == 40) goto_position = NOTE1;
      if (note == 41) goto_position = NOTE2;
      if (note == 42) goto_position = NOTE3;
      if (note == 43) goto_position = NOTE4;
      if (note == 44) goto_position = NOTE5;
      if (note == 45) goto_position = NOTE6;
      //goto_position = 500;

      if (play_note)
      {
        //if (goto_position == current_position)
        //{
        strike(play_note);
        play_note = 0;
        //}
      }

  }
}

void go_home()
{
  if (HOME_DIR) // Set direction of endstop home. 
    PORTB |= (1<<PIN_STEPPER_DIR);
  else
    PORTB &= ~(1<<PIN_STEPPER_DIR);

    while(PIND & (1<<PIN_ENDSTOP)) {
      PINB |= (1<<PIN_STEPPER_STEP);
      _delay_ms(1);
    }
  current_position = 0; 
  goto_position = 0;
}

void strike(uint8_t velocity)
{
      PORTB |= (1<<PIN_STRIKER);
      int i; for (i=0; i<velocity; i++) _delay_us(100);
      PORTB &= ~(1<<PIN_STRIKER);  
}

