/* BandMate Project, assembly.scad
 * assembly.scad by Oskari Rundgren is licensed under the
 * Creative Commons Attribution-ShareAlike 4.0 International License.
 */

$fn = 64;

include <settings.scad>
use <motor_rod.scad>
use <rod_mount3.scad>
use <other_parts.scad>
use <carriage.scad>

/* Holder for motor and rods */
translate([7,0,0]) rotate([0,0,180]) motor_rod();

/* Holder for two rods. */
translate([100,0,0]) rotate([0,0,0]) rod_mount2();

/* The wooden plank. */
wood();

/* The two rods */
translate([0,0,15]) %rods(length=300);

/* Metal flat bar. */
%bar();

/* A belt. */
translate([-25,0,20]) %belt(radius=13,length=200);

/* The carriage. */
translate([50,0,5]) carriage();

/* Big bearing. */
%translate([50,0,0]) bearing();


/* The wooden body of the whole thing. */
module wood()
{
	translate([0,-45/2,-45]) cube([500,45,45]);
}

