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

void go_home(void);

// Fret places in tenths of mm
#define NOTE1 0
#define NOTE2 4937 //466
#define NOTE3 9598// 906
#define NOTE4 13998
#define NOTE5 18150
#define NOTE6 22069
#define NOTE7 2431
#define NOTE8 2760
#define NOTE9 3071
#define NOTE10 3365
#define NOTE11 3642
#define NOTE12 3903

void strike(uint8_t);
